import 'package:hive_flutter/hive_flutter.dart';
import 'package:traver_riverpod_app/Features/trip/data/models/trip_model.dart';

class TripLocalDataSource {

  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrip(int index) {
    tripBox.deleteAt(index);
  }
}