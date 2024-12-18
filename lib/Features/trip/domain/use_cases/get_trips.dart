import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';
import 'package:traver_riverpod_app/Features/trip/domain/repos/trip_repos.dart';

class GetTrips {

  final TripRepos tripRepos;

  GetTrips(this.tripRepos);

  Future<List<Trip>> call() async {
    return await tripRepos.getTrip();
  }
}