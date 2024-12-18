import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:traver_riverpod_app/Features/trip/data/data_sources/trip_local_data_source.dart';
import 'package:traver_riverpod_app/Features/trip/data/models/trip_model.dart';
import 'package:traver_riverpod_app/Features/trip/data/repos/trip_repo_impl.dart';
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