// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:icar/data/core/app_failure.dart';
// import 'package:icar/data/models/icar_stops.dart';
// import 'package:icar/data/models/icar.dart';
// import 'package:icar/data/models/rute.dart';
// import 'package:icar/data/models/rute_waypoint.dart';
// import 'package:icar/data/models/schedule.dart';
// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'icar_repository.g.dart';

// @riverpod
// IcarRepository icarRepository(Ref ref) {
//   return IcarRepository();
// }

// class IcarRepository {
//   Future<Either<AppFailure, List<Halte>>> getAllHalte() async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));

//       return Right(halteList);
//     } catch (e) {
//       return Left(AppFailure(e.toString()));
//     }
//   }

//   Future<Either<AppFailure, Halte>> getHalteById(String id) async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));

//       final halte = halteList.firstWhere((element) => element.id == id);
//       return Right(halte);
//     } catch (e) {
//       return Left(AppFailure(e.toString()));
//     }
//   }

//   Future<Either<AppFailure, List<Rute>>> getAllRute() async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));

//       return Right(ruteList);
//     } catch (e) {
//       return Left(AppFailure(e.toString()));
//     }
//   }

//   Future<Either<AppFailure, Rute>> getRuteById(String id) async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));

//       final rute = ruteList.firstWhere((element) => element.id == id);
//       return Right(rute);
//     } catch (e) {
//       return Left(AppFailure(e.toString()));
//     }
//   }

//   Future<Either<AppFailure, List<Schedule>>> getScheduleListByHalteRute(
//     String halteId,
//     String ruteId,
//   ) async {
//     try {
//       await Future.delayed(const Duration(seconds: 2));

//       final schedule =
//           scheduleList
//               .where(
//                 (sch) => sch.halte.id == halteId && sch.icar.rute.id == ruteId,
//               )
//               .toList();
//       return Right(schedule);
//     } catch (e) {
//       return Left(AppFailure(e.toString()));
//     }
//   }

//   // get schedule by id
//   Schedule getScheduleById(String id) {
//     return scheduleList.firstWhere((element) => element.id == id);
//   }
// }

// final List<Halte> halteList = [
//   Halte(
//     id: '0',
//     name: 'Gerbang ITS',
//     coordinate: Point(coordinates: Position(112.791810, -7.280951)),
//   ),
//   Halte(
//     id: '1',
//     name: 'Teknik Lingkungan ITS',
//     coordinate: Point(coordinates: Position(112.792148, -7.280187)),
//   ),
//   Halte(
//     id: '2',
//     name: 'Rektorat ITS',
//     coordinate: Point(coordinates: Position(112.793812, -7.281965)),
//   ),
//   Halte(
//     id: '3',
//     name: 'Kantin Pusat ITS',
//     coordinate: Point(coordinates: Position(112.793401, -7.284482)),
//   ),
//   Halte(
//     id: '4',
//     name: 'Asrama ITS',
//     coordinate: Point(
//       coordinates: Position(112.79260104694447, -7.288637552974364),
//     ),
//   ),
//   Halte(
//     id: '5',
//     name: 'Masjid Manarul Ilmi',
//     coordinate: Point(coordinates: Position(112.793127, -7.283931)),
//   ),
//   Halte(
//     id: '6',
//     name: 'Tower 2',
//     coordinate: Point(
//       coordinates: Position(112.79546927245038, -7.285946302453313),
//     ),
//   ),
//   Halte(
//     id: '7',
//     name: 'Perumdos Blok U Barat',
//     coordinate: Point(
//       coordinates: Position(112.79928016505121, -7.282778908378972),
//     ),
//   ),
//   Halte(
//     id: '8',
//     name: 'Gedung Riset',
//     coordinate: Point(
//       coordinates: Position(112.79772569350835, -7.280752438287473),
//     ),
//   ),
//   Halte(
//     id: '9',
//     name: 'Gedung Pusat Robotika ITS',
//     coordinate: Point(
//       coordinates: Position(112.79722334575523, -7.2779583586393555),
//     ),
//   ),
//   Halte(
//     id: '10',
//     name: 'Perumdos Blok U Timur',
//     coordinate: Point(
//       coordinates: Position(112.79943421548083, -7.28356614782186),
//     ),
//   ),
//   Halte(
//     id: '11',
//     name: 'Danau 8',
//     coordinate: Point(
//       coordinates: Position(112.79592224735022, -7.2860978150280955),
//     ),
//   ),
// ];

// // Rute 0
// /* 
//   - Gerbang ITS - 0
//   - Teknik Lingkungan ITS - 1
//   - Rektorat ITS - 2
//   - Kantin Pusat ITS - 3
//   - Asrama ITS - 4
//   - Masjid Manarul Ilmi - 5
// */

// // Rute 1
// /* 
//   - Kantin Pusat ITS - 3
//   - Tower 2 - 6
//   - Perumdos U Blok Barat - 7
//   - Gedung Riset - 8
//   - Gedung Pusat Robotika - 9
//   - Perumdos U Blok Timur - 10
//   - Danau 8 - 11
//   - Masjid Manarul Ilmi - 5
// */

// final List<Rute> ruteList = [
//   Rute(
//     id: '0',
//     name: 'Bunderan ITS - Asrama ITS',
//     waypoints: [...ruteWaypoints.where((element) => element.ruteId == '0')],
//   ),
//   Rute(
//     id: '1',
//     name: 'Kantin ITS - Robotika',
//     waypoints: [...ruteWaypoints.where((element) => element.ruteId == '1')],
//   ),
// ];

// final List<RuteWaypoint> ruteWaypoints = [
//   const RuteWaypoint(id: '0', ruteId: '0', halteId: '0', order: 1),
//   const RuteWaypoint(id: '1', ruteId: '0', halteId: '1', order: 2),
//   const RuteWaypoint(id: '2', ruteId: '0', halteId: '2', order: 3),
//   const RuteWaypoint(id: '3', ruteId: '0', halteId: '3', order: 4),
//   const RuteWaypoint(id: '4', ruteId: '0', halteId: '4', order: 5),
//   const RuteWaypoint(id: '5', ruteId: '0', halteId: '5', order: 6),
//   const RuteWaypoint(id: '6', ruteId: '1', halteId: '3', order: 1),
//   const RuteWaypoint(id: '7', ruteId: '1', halteId: '6', order: 2),
//   const RuteWaypoint(id: '8', ruteId: '1', halteId: '7', order: 3),
//   const RuteWaypoint(id: '9', ruteId: '1', halteId: '8', order: 4),
//   const RuteWaypoint(id: '10', ruteId: '1', halteId: '9', order: 5),
//   const RuteWaypoint(id: '11', ruteId: '1', halteId: '10', order: 6),
//   const RuteWaypoint(id: '12', ruteId: '1', halteId: '11', order: 7),
//   const RuteWaypoint(id: '13', ruteId: '1', halteId: '5', order: 8),
// ];

// final List<Icar> icarList = [
//   Icar(
//     id: '0',
//     name: 'iCar 1',
//     capacity: 6,
//     coordinate: Point(coordinates: Position(0, 0)),
//     status: true,
//     rute: ruteList[0],
//   ),
//   Icar(
//     id: '1',
//     name: 'iCar 2',
//     capacity: 6,
//     coordinate: Point(coordinates: Position(0, 0)),
//     status: true,
//     rute: ruteList[1],
//   ),
// ];

// // 09:00 - 11:00
// // 14:00 - 16:00

// final List<Schedule> scheduleList = [
//   Schedule.fromTimeString(
//     id: '0',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '09:05',
//   ),
//   Schedule.fromTimeString(
//     id: '1',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '09:29',
//   ),
//   Schedule.fromTimeString(
//     id: '2',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '09:53',
//   ),
//   Schedule.fromTimeString(
//     id: '3',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '10:17',
//   ),
//   Schedule.fromTimeString(
//     id: '4',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '10:41',
//   ),
//   Schedule.fromTimeString(
//     id: '5',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '14:05',
//   ),
//   Schedule.fromTimeString(
//     id: '6',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '14:29',
//   ),
//   Schedule.fromTimeString(
//     id: '7',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '14:53',
//   ),
//   Schedule.fromTimeString(
//     id: '8',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '15:17',
//   ),
//   Schedule.fromTimeString(
//     id: '9',
//     halte: halteList[5],
//     icar: icarList[0],
//     departureTimeString: '15:41',
//   ),
//   Schedule.fromTimeString(
//     id: '10',
//     halte: halteList[5],
//     icar: icarList[1],
//     departureTimeString: '09:56',
//   ),
//   Schedule.fromTimeString(
//     id: '11',
//     halte: halteList[5],
//     icar: icarList[1],
//     departureTimeString: '10:35',
//   ),
//   Schedule.fromTimeString(
//     id: '12',
//     halte: halteList[5],
//     icar: icarList[1],
//     departureTimeString: '11:14',
//   ),
//   Schedule.fromTimeString(
//     id: '13',
//     halte: halteList[5],
//     icar: icarList[1],
//     departureTimeString: '14:56',
//   ),
//   Schedule.fromTimeString(
//     id: '14',
//     halte: halteList[5],
//     icar: icarList[1],
//     departureTimeString: '15:35',
//   ),
//   Schedule.fromTimeString(
//     id: '15',
//     halte: halteList[5],
//     icar: icarList[1],
//     departureTimeString: '16:14',
//   ),
// ];
