import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/repositories/icar_repository/icar_websocket.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';

part 'icar_position_repository.g.dart';

@riverpod
Stream<Map<String, dynamic>> icarPositionStream(Ref ref) {
  final icarWebsocket = ref.watch(icarWebsocketProvider);
  final icarPositionRepository = IcarPositionRepository(icarWebsocket);

  ref.onDispose(() {
    debugPrint("Disposing icarPositionRepository");
    icarPositionRepository.dispose();
  });

  return icarPositionRepository.stream;
}

class IcarPositionRepository {
  IcarPositionRepository(this._icarWebsocket) {
    _init();
  }

  final IcarWebsocket _icarWebsocket;
  IOWebSocketChannel? _channel;
  bool _isDisposed = false;
  bool _isSubscribed = false;
  final StreamController<Map<String, dynamic>> _streamController =
      StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get stream => _streamController.stream;

  void _init() {
    debugPrint("Initializing WebSocket connection");
    try {
      _channel = _icarWebsocket.connect();
      _subscribeToIcarPosition();
      _listen();
    } catch (e) {
      debugPrint("Error connecting to WebSocket: $e");
      _reconnect();
    }
  }

  void _subscribeToIcarPosition() {
    if (_isDisposed) return;

    final message = jsonEncode({
      "type": "subscribe",
      "channel": "icar_position",
    });

    debugPrint("Subscribing to icar_position channel");
    _isSubscribed = true;
    _channel?.sink.add(message);
  }

  void _listen() {
    if (_isDisposed) return;

    _channel?.stream.listen(
      (data) {
        debugPrint("Raw WebSocket data received: ${data.runtimeType}");
        try {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          debugPrint("Parsed data: $jsonData");
          _streamController.add(jsonData);
        } catch (e) {
          debugPrint("Error parsing WebSocket data: $e");
          _streamController.addError(e);
        }
      },
      onDone: _onConnectionClosed,
      onError: (error) {
        debugPrint("WebSocket error: $error");
        _streamController.addError(error);
        _reconnect();
      },
      cancelOnError: false,
    );
  }

  void _onConnectionClosed() {
    debugPrint("WebSocket connection closed");
    if (!_isDisposed) {
      _reconnect();
    }
  }

  void _reconnect() {
    if (_isDisposed) return;

    debugPrint("Attempting to reconnect in 2 seconds...");
    Future.delayed(const Duration(seconds: 2), () {
      if (_isDisposed) return;
      _channel?.sink.close();
      _init();
    });
  }

  void dispose() {
    if (_isDisposed) return;

    debugPrint("Disposing IcarPositionRepository");
    _isDisposed = true;
    _isSubscribed = false;
    _channel?.sink.close();
    _streamController.close();
  }
}
