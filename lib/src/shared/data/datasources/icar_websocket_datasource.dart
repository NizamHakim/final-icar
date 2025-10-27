import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/src/core/config/app_dot_env.dart';
import 'package:icar/src/features/auth/presentation/providers/current_user.dart';
import 'package:icar/src/shared/data/models/icar_websocket_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';

part 'icar_websocket_datasource.g.dart';

@riverpod
IcarWebsocketDatasource icarWebsocketDatasource(Ref ref) {
  final currentUser = ref.watch(currentUserProvider).requireValue!;
  final icarWebsocketDatasource = IcarWebsocketDatasource(currentUser.token);
  ref.onDispose(() {
    icarWebsocketDatasource.dispose();
  });
  return icarWebsocketDatasource;
}

class IcarWebsocketDatasource {
  final String _token;
  late IOWebSocketChannel _webSocketChannel;
  bool _isDisposed = false;
  final StreamController<IcarWebsocketResponseModel>
  _websocketStreamController =
      StreamController<IcarWebsocketResponseModel>.broadcast();
  StreamSubscription<dynamic>? _webSocketSubscription;
  Stream<IcarWebsocketResponseModel> get stream =>
      _websocketStreamController.stream;

  IcarWebsocketDatasource(this._token) {
    _connect();
  }

  void _connect() {
    _webSocketChannel = IOWebSocketChannel.connect(
      Uri.parse(AppDotEnv.wsUrl),
      headers: {"x-client-type": "user", "x-auth-token": _token},
      pingInterval: const Duration(seconds: 30),
    );
    _listen();
  }

  void _listen() {
    if (_isDisposed) return;

    _webSocketSubscription?.cancel();

    _webSocketSubscription = _webSocketChannel.stream.listen(
      (data) {
        final websocketResponse = IcarWebsocketResponseModel.fromJson(
          jsonDecode(data),
        );
        _websocketStreamController.add(websocketResponse);
      },
      onError: (error) => _reconnect(),
      onDone: () => _reconnect(),
    );
  }

  void _reconnect() {
    if (_isDisposed) return;
    Future.delayed(const Duration(seconds: 3), () => _connect());
  }

  void dispose() {
    _isDisposed = true;
    _webSocketSubscription?.cancel();
    _webSocketChannel.sink.close();
    _websocketStreamController.close();
  }
}
