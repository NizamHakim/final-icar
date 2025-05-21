import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/repositories/icar_repository/icar_position_repository.dart';
import 'package:icar/ui/core/errors/data_not_fetched.dart';
import 'package:icar/ui/core/widgets/root_container.dart';

class MapTemp extends ConsumerWidget {
  const MapTemp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(icarPositionStreamProvider);
    // in viewmodel initialize position using local storage
    // if get data update state and local storage
    return Scaffold(
      appBar: AppBar(title: const Text('Map Temp')),
      body: RootContainer(
        child: Center(
          child: asyncValue.when(
            data: (asyncValueData) {
              final type = asyncValueData['type'];
              final data = asyncValueData['data'];
              return Column(
                children: [Text('Type: $type'), Text('Data: $data')],
              );
            },
            error: (error, _) {
              return DataNotFetched(text: error.toString());
            },
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
