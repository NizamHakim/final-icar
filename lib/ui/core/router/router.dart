import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/data/core/providers/current_user/current_user.dart';
import 'package:icar/ui/onboarding/viewmodels/onboarding_viewmodel.dart';
import 'package:icar/ui/root/authorized.dart';
import 'package:icar/ui/root/unauthorized.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final currentUser = ref.watch(currentUserProvider);
  final shouldShowOnboarding = ref.read(shouldShowOnboardingProvider);

  return GoRouter(
    initialLocation: '/authorized',
    redirect: (context, state) {
      if (shouldShowOnboarding) {
        return '/onboarding';
      } else if (currentUser == null) {
        return '/unauthorized';
      } else {
        return '/authorized';
      }
    },
    routes: [
      GoRoute(
        path: '/authorized',
        builder: (context, state) => const Authorized(),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const Authorized(navIndexInitial: 0),
          ),
          GoRoute(
            path: '/my-queue',
            builder: (context, state) => const Authorized(navIndexInitial: 1),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const Authorized(navIndexInitial: 2),
          ),
        ],
      ),
      GoRoute(
        path: '/unauthorized',
        builder: (context, state) => const Unauthorized(),
        routes: [
          GoRoute(
            path: '/signup',
            builder: (context, state) => const Unauthorized(logout: false),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => const Unauthorized(logout: true),
          ),
        ],
      ),
    ],
  );
}
