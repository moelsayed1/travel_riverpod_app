import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traver_riverpod_app/Features/trip/presentation/providers/trip_provider.dart';

class MyTripPage extends ConsumerWidget {
  const MyTripPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripList = ref.watch(tripListNotifierProvider);

    return ListView.builder(
      itemCount: tripList.length,
      itemBuilder: (context, index) {
        final trip = tripList[index];
        return Text(trip.title);
      },
    );
  }
}
