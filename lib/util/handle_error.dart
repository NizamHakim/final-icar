import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:icar/ui/widgets/data_not_fetched.dart';
import 'package:icar/core/permissions/location/widgets/location_permission_denied.dart';
import 'package:icar/core/permissions/location/widgets/location_service_disabled.dart';

Widget handleError(BuildContext context, Object error) {
  if (error is LocationServiceDisabledException) {
    return const LocationServiceDisabled();
  } else if (error is PermissionDeniedException) {
    return const LocationPermissionDenied();
  } else {
    return DataNotFetched(
      text:
          (kDebugMode)
              ? error.toString()
              : CoreLocalizations.of(context)!.internalServerError,
    );
  }
}
