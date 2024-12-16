import 'package:hive/hive.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String location;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final DateTime dateTime;

  TripModel(
      {required this.title,
      required this.description,
      required this.location,
      required this.images,
      required this.dateTime});
}
