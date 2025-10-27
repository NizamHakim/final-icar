# icar

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```ts
part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String token,
  }) = _User;
}

```

```ts
part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final authRemoteDatasource = ref.watch(authRemoteDatasourceProvider);
  final authLocalDatasource = ref.watch(authLocalDatasourceProvider);
  return AuthRepositoryImpl(authRemoteDatasource, authLocalDatasource);
}

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
}

```

```ts
part 'auth_remote_datasource.g.dart';

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  return AuthRemoteDatasource();
}

class AuthRemoteDatasource {
  Future<UserModel> getUser(String token) async {
    try {
      final response = await http.get(
        uriBuilder(endpoint: "/api/auth"),
        headers: headersBuilder(token: token),
      );

      return responseHandler<UserModel>(
        response,
        onSuccess: (json) => UserModel.fromJson(json),
        onError: (json) => throw ServerException.fromJson(json),
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException.internalServerError(
        statusCode: 500,
        message: e.toString(),
      );
    }
  }
```

```ts
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource _authRemote;
  final AuthLocalDatasource _authLocal;

  AuthRepositoryImpl(this._authRemote, this._authLocal);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final result = await _authRemote.login(email, password);
      return Right(result.toEntity());
    } on UnprocessableContentException catch (e) {
      return Left(ValidationFailure(message: e.message, errors: e.errors));
    } on SocketException {
      return const Left(NetworkFailure());
    } on InternalServerErrorException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
```

```ts
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required int id,
    required String name,
    required String email,
    required String token,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  User toEntity() {
    return User(id: id, name: name, email: email, token: token);
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      token: user.token,
    );
  }
}
```