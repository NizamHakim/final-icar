import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icar/src/core/errors/failure.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/src/l10n/generated/failure_localizations.dart';
import 'package:icar/src/shared/presentation/widgets/centered_gray_text.dart';
import 'package:icar/src/features/location/presentation/widgets/location_permission_denied.dart';
import 'package:icar/src/features/location/presentation/widgets/location_service_disabled.dart';

Widget handleError(BuildContext context, Object error, StackTrace stackTrace) {
  if (kDebugMode) print(stackTrace);
  if (error is LocationServiceDisabledException) {
    return const LocationServiceDisabled();
  } else if (error is PermissionDeniedException) {
    return const LocationPermissionDenied();
  } else if (error is Failure) {
    return CenteredGrayText(
      text: FailureLocalizations.of(context)!.failure(error.message),
    );
  } else {
    return CenteredGrayText(
      text:
          (kDebugMode)
              ? error.toString()
              : FailureLocalizations.of(context)!.failure(error.toString()),
    );
  }
}
