import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';

abstract class TripRepos {

  Future<List<Trip>> getTrip();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}