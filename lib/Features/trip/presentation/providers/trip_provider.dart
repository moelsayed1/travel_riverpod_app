import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:traver_riverpod_app/Features/trip/data/data_sources/trip_local_data_source.dart';
import 'package:traver_riverpod_app/Features/trip/data/models/trip_model.dart';
import 'package:traver_riverpod_app/Features/trip/data/repos/trip_repo_impl.dart';
import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';
import 'package:traver_riverpod_app/Features/trip/domain/repos/trip_repos.dart';
import 'package:traver_riverpod_app/Features/trip/domain/use_cases/add_trips.dart';
import 'package:traver_riverpod_app/Features/trip/domain/use_cases/delete_trips.dart';
import 'package:traver_riverpod_app/Features/trip/domain/use_cases/get_trips.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});

final tripReposProvider = Provider<TripRepos>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepoImpl(localDataSource);
});

final addTripProvider = Provider<AddTrips>((ref) {
  final repos = ref.read(tripReposProvider);
  return AddTrips(repos);
});

final getTripProvider = Provider<GetTrips>((ref) {
  final repos = ref.read(tripReposProvider);
  return GetTrips(repos);
});

final deleteTripProvider = Provider<DeleteTrips>((ref) {
  final repos = ref.read(tripReposProvider);
  return DeleteTrips(repos);
});

final tripListNotifierProvider = StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripProvider);
  final addTrips = ref.read(addTripProvider);
  final deleteTrips = ref.read(deleteTripProvider);

  return TripListNotifier(getTrips, addTrips, deleteTrips);
});

class TripListNotifier extends StateNotifier<List<Trip>>{
  
  final GetTrips _getTrips;
  final AddTrips _addTrips;
  final DeleteTrips _deleteTrips;

  TripListNotifier(this._getTrips, this._addTrips, this._deleteTrips) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrips(trip);
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrips(tripId);
  }

  Future<void> loadTrips() async {
    await _getTrips();
  }
}