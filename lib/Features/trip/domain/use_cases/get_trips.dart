import 'package:dartz/dartz.dart';
import 'package:traver_riverpod_app/Core/errors/failures.dart';
import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';
import 'package:traver_riverpod_app/Features/trip/domain/repos/trip_repos.dart';

class GetTrips {

  final TripRepos tripRepos;

  GetTrips(this.tripRepos);

  Future<Either<Failures, List<Trip>>> call() async {
    return await tripRepos.getTrip();
  }
}