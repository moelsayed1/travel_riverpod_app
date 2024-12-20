import 'package:dartz/dartz.dart';
import 'package:traver_riverpod_app/Core/errors/failures.dart';
import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';

abstract class TripRepos {

  Future<Either<Failures, List<Trip>>> getTrip();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}