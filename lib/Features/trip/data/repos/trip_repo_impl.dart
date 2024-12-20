import 'package:dartz/dartz.dart';
import 'package:traver_riverpod_app/Core/errors/failures.dart';
import 'package:traver_riverpod_app/Features/trip/data/data_sources/trip_local_data_source.dart';
import 'package:traver_riverpod_app/Features/trip/data/models/trip_model.dart';
import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';
import 'package:traver_riverpod_app/Features/trip/domain/repos/trip_repos.dart';

class TripRepoImpl implements TripRepos {
  final TripLocalDataSource localDataSource;

  TripRepoImpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<Either<Failures, List<Trip>>> getTrip() async {
    try {
      final tripModels = localDataSource.getTrips();
      List<Trip> res = tripModels.map((model) => model.toEntity()).toList();
      return right(res);
    } catch (err) {
      return left(
        SomeSpecificError(err.toString()),
      );
    }
  }
}
