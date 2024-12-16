import 'package:traver_riverpod_app/Features/trip/domain/repos/trip_repos.dart';

class DeleteTrips {

  final TripRepos tripRepos;

  DeleteTrips(this.tripRepos);

  Future<void> call(int index) async {
    return await tripRepos.deleteTrip(index);
  }

}