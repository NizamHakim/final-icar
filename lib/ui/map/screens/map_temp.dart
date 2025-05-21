import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icar/data/repositories/icar_repository/icar_position_repository.dart';
import 'package:icar/ui/core/errors/data_not_fetched.dart';
import 'package:icar/ui/core/widgets/circular_loader.dart';
import 'package:icar/ui/core/widgets/root_container.dart';
import 'package:icar/ui/map/viewmodels/map_viewmodel.dart';

class MapTemp extends ConsumerWidget {
  const MapTemp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icarPositionMapStream = ref.watch(icarsPositionMapStreamProvider);
    // in viewmodel initialize position using local storage
    // if get data update state and local storage
    return Scaffold(
      appBar: AppBar(title: const Text('Map Temp')),
      body: RootContainer(
        child: Center(
          child: icarPositionMapStream.when(
            data: (asyncValueData) {
              // final type = asyncValueData['type'];
              // final data = asyncValueData['data'];
              // return Column(
              //   children: [Text('Type: $type'), Text('Data: $data')],
              // );
              print('Data: $asyncValueData');
              return;
            },
            error: (error, _) {
              return DataNotFetched(text: error.toString());
            },
            loading: () {
              return const CircularLoader();
            },
          ),
        ),
      ),
    );
  }
}
