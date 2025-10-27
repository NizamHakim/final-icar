import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:icar/src/core/config/themes/app_colors.dart';
import 'package:icar/src/core/key/navigator_key.dart';
import 'package:icar/src/core/routes/bottom_sheet_page.dart';
import 'package:icar/src/core/routes/dialog_page.dart';
import 'package:icar/src/features/auth/presentation/screens/login_screen.dart';
import 'package:icar/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:icar/src/features/home/presentation/screens/home_screen.dart';
import 'package:icar/src/features/home/presentation/screens/select_icar_route_sheet.dart';
import 'package:icar/src/features/home/presentation/screens/select_icar_stop_screen.dart';
import 'package:icar/src/features/map/presentation/screens/map_screen.dart';
import 'package:icar/src/features/map/presentation/widgets/schedule_dialog/schedule_dialog.dart';
import 'package:icar/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:icar/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:icar/src/features/profile/presentation/screens/switch_language_screen.dart';
import 'package:icar/src/features/schedule/presentation/screens/schedule_list_screen.dart';
import 'package:icar/src/features/ticket/presentation/screens/ticket_details_screen.dart';
import 'package:icar/src/features/ticket/presentation/screens/ticket_list_screen.dart';
import 'package:icar/src/features/ticket/presentation/screens/ticket_review_sheet.dart';
import 'package:icar/src/shared/presentation/providers/app_startup.dart';
import 'package:icar/src/shared/presentation/screens/authenticated_screen.dart';
import 'package:icar/src/shared/presentation/screens/startup_loading.dart';
import 'package:icar/src/shared/presentation/widgets/centered_gray_text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

const Duration kTransitionDuration = Duration(milliseconds: 400);

@riverpod
GoRouter router(Ref ref) {
  final appStartup = ref.watch(appStartupProvider);
  final gorouter = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: "/home",
    routes: [
      ShellRoute(
        builder: (context, state, child) => Scaffold(body: child),
        routes: [
          GoRoute(
            path: "/startup",
            builder: (context, state) => const StartupLoading(),
          ),
          GoRoute(
            path: "/onboarding",
            builder: (context, state) => const OnboardingScreen(),
          ),
          GoRoute(
            path: "/login",
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: "/signup",
            builder: (context, state) => const SignupScreen(),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return AuthenticatedScreen(navigationShell: navigationShell);
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: "/home",
                    builder: (context, state) => const HomeScreen(),
                    routes: [
                      GoRoute(
                        path: "selectstop",
                        parentNavigatorKey: navigatorKey,
                        builder:
                            (context, state) => const SelectIcarStopScreen(),
                      ),
                      GoRoute(
                        path: "selectroute",
                        parentNavigatorKey: navigatorKey,
                        pageBuilder: (context, state) {
                          return const BottomSheetPage(
                            child: SelectIcarRouteSheet(),
                          );
                        },
                      ),
                      GoRoute(
                        path: "schedules",
                        parentNavigatorKey: navigatorKey,
                        builder: (context, state) {
                          final icarRouteId = int.parse(
                            state.uri.queryParameters['icarRouteId']!,
                          );
                          final icarStopId = int.parse(
                            state.uri.queryParameters['icarStopId']!,
                          );
                          return ScheduleListScreen(
                            icarRouteId: icarRouteId,
                            icarStopId: icarStopId,
                          );
                        },
                      ),
                      GoRoute(
                        path: "map",
                        parentNavigatorKey: navigatorKey,
                        builder: (context, state) => const MapScreen(),
                        routes: [
                          GoRoute(
                            path: ":icarStopId",
                            parentNavigatorKey: navigatorKey,
                            pageBuilder: (context, state) {
                              final icarStopId = int.parse(
                                state.pathParameters['icarStopId']!,
                              );
                              return DialogPage(
                                barrierDismissible: true,
                                barrierColor: AppColors.transparent,
                                barrierLabel: '',
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        ScheduleDialog(icarStopId: icarStopId),
                              );
                            },
                          ),
                        ],
                      ),
                      GoRoute(
                        path: ":ticketId",
                        parentNavigatorKey: navigatorKey,
                        builder: (context, state) {
                          final ticketId = int.parse(
                            state.pathParameters['ticketId']!,
                          );
                          return TicketDetailsScreen(ticketId: ticketId);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: "/tickets",
                    builder: (context, state) => const TicketListScreen(),
                    routes: [
                      GoRoute(
                        path: ":ticketId",
                        parentNavigatorKey: navigatorKey,
                        builder: (context, state) {
                          final ticketId = int.parse(
                            state.pathParameters['ticketId']!,
                          );
                          return TicketDetailsScreen(ticketId: ticketId);
                        },
                        routes: [
                          GoRoute(
                            path: "review",
                            parentNavigatorKey: navigatorKey,
                            pageBuilder: (context, state) {
                              final ticketId = int.parse(
                                state.pathParameters['ticketId']!,
                              );
                              return BottomSheetPage(
                                child: TicketReviewSheet(ticketId: ticketId),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: "/profile",
                    builder: (context, state) => const ProfileScreen(),
                    routes: [
                      GoRoute(
                        path: "language",
                        parentNavigatorKey: navigatorKey,
                        builder:
                            (context, state) => const SwitchLanguageScreen(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      return appStartup.when(
        data: (data) {
          final (shouldShowOnboarding, currentUser) = data;

          if (shouldShowOnboarding) {
            return "/onboarding";
          }

          if (currentUser == null) {
            if (state.fullPath == "/signup") {
              return "/signup";
            } else {
              return "/login";
            }
          }

          return null;
        },
        error: (error, _) {
          throw error;
        },
        loading: () {
          return "/startup";
        },
      );
    },
    errorBuilder: (context, state) {
      return CenteredGrayText(text: state.error.toString());
    },
  );
  return gorouter;
}
