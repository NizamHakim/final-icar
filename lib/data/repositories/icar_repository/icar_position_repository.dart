import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/repositories/icar_repository/icar_websocket.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';

part 'icar_position_repository.g.dart';

@riverpod
IcarPositionRepository icarPositionStream(Ref ref) {
  final icarWebsocket = ref.watch(icarWebsocketProvider);
  final icarPositionRepository = IcarPositionRepository(icarWebsocket);

  ref.onDispose(() {
    icarPositionRepository.dispose();
    ref.invalidate(icarWebsocketProvider);
  });
  return icarPositionRepository;
}

class IcarPositionRepository {
  final IcarWebsocket _icarWebsocket;

  IcarPositionRepository(this._icarWebsocket) {
    _init();
  }

  IOWebSocketChannel? _channel;
  bool _isDisposed = false;
  final StreamController<Map<String, dynamic>> _streamController =
      StreamController<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get stream => _streamController.stream;

  void _init() {
    _channel = _icarWebsocket.connect();
    _listen();
  }

  void _listen() {
    if (_isDisposed) return;

    _channel?.stream.listen(
      (data) {
        final jsonData = jsonDecode(data) as Map<String, dynamic>;
        _streamController.add(jsonData);
      },
      onError: (error) {
        _reconnect();
      },
    );
  }

  void _reconnect() {
    if (_isDisposed) return;

    Future.delayed(const Duration(seconds: 3), () {
      _init();
    });
  }

  void dispose() {
    _isDisposed = true;
    _channel?.sink.close();
    _streamController.close();
  }
}
