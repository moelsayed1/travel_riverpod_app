import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';
import 'package:traver_riverpod_app/Features/trip/domain/repos/trip_repos.dart';

class AddTrips {

  final TripRepos tripRepos;

  AddTrips(this.tripRepos);

  Future<void> call(Trip trip) async {
    return await tripRepos.addTrip(trip);
  }

}