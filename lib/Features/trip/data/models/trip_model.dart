import 'package:hive/hive.dart';
import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';

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

  // conversion from entity to model
  factory TripModel.fromEntity(Trip trip) => TripModel(
        title: trip.title,
        description: trip.description,
        location: trip.location,
        images: trip.images,
        dateTime: trip.dateTime,
      );
// conversion from model to entity
  Trip toEntity() => Trip(
        title: title,
        description: description,
        location: location,
        images: images,
        dateTime: dateTime,
      );
}
