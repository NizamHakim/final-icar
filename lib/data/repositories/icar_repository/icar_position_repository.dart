import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icar/data/models/json_converter/latlng_json_converter.dart';
import 'package:icar/data/repositories/icar_repository/icar_websocket.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';

part 'icar_position_repository.g.dart';
part 'icar_position_repository.freezed.dart';

@riverpod
IcarPositionRepository icarPositionRepository(Ref ref) {
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
  final StreamController<IcarPositionResponse> _streamController =
      StreamController<IcarPositionResponse>.broadcast();

  Stream<IcarPositionResponse> get stream => _streamController.stream;

  void _init() {
    _channel = _icarWebsocket.connect();
    _listen();
  }

  void _listen() {
    if (_isDisposed) return;

    _channel?.stream.listen(
      (data) {
        _streamController.add(IcarPositionResponse.fromJson(jsonDecode(data)));
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

@freezed
abstract class IcarPositionResponse with _$IcarPositionResponse {
  const factory IcarPositionResponse({
    required int icarId,
    @JsonKey(fromJson: latLngFromJson, toJson: latLngToJson)
    required LatLng position,
  }) = _IcarPositionResponse;

  factory IcarPositionResponse.fromJson(Map<String, dynamic> json) =>
      _$IcarPositionResponseFromJson(json);
}
