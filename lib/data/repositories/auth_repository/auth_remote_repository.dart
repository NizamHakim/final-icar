// import 'dart:convert';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:http/http.dart' as http;
// import 'package:icar/data/models/user.dart';
// import 'package:icar/data/core/app_failure.dart';
// import 'package:icar/data/core/server_conn.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'auth_remote_repository.g.dart';

// @riverpod
// AuthRemoteRepository authRemoteRepository(Ref ref) {
//   return AuthRemoteRepository();
// }

// class AuthRemoteRepository {
//   Future<Either<AppFailure, User>> signup({
//     required String name,
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await http.post(
//         Uri.parse("${ServerConn.url}/auth/signup"),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'name': name, 'email': email, 'password': password}),
//       );

//       final Map<String, dynamic> jsonMap = jsonDecode(response.body);

//       if (response.statusCode != 201) {
//         return Left(AppFailure(jsonMap['detail']));
//       }

//       return Right(User.fromMap(jsonMap));
//     } catch (e) {
//       return Left(AppFailure(e.toString()));
//     }
//   }

//   Future<Either<AppFailure, User>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final response = await http.post(
//         Uri.parse("${ServerConn.url}/auth/login"),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': email, 'password': password}),
//       );

//       final Map<String, dynamic> jsonMap = jsonDecode(response.body);

//       if (response.statusCode != 200) {
//         return Left(AppFailure(jsonMap['detail']));
//       }

//       return Right(User.fromMap(jsonMap));
//     } catch (e) {
//       return Left(AppFailure(e.toString()));
//     }
//   }
// }
