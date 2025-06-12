import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/core/server_conn.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';

part 'icar_websocket.g.dart';

@riverpod
IcarWebsocket icarWebsocket(Ref ref) {
  ref.onDispose(() {
    debugPrint("IcarWebsocket disposed");
  });
  ref.onCancel(() {
    debugPrint("IcarWebsocket cancelled");
  });
  ref.onResume(() {
    debugPrint("IcarWebsocket resumed");
  });
  ref.onAddListener(() {
    debugPrint("IcarWebsocket listener added");
  });
  ref.onRemoveListener(() {
    debugPrint("IcarWebsocket listener removed");
  });

  return IcarWebsocket();
}

class IcarWebsocket {
  IcarWebsocket() {
    debugPrint("IcarWebsocket initialized");
  }
  IOWebSocketChannel connect() {
    debugPrint("Connecting to WebSocket: ${ServerConn.wsUrl}");
    return IOWebSocketChannel.connect(
      Uri.parse(ServerConn.wsUrl),
      headers: {"client-type": "user"},
      pingInterval: const Duration(seconds: 30),
    );
  }
}
