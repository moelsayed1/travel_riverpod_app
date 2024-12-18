import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traver_riverpod_app/Features/trip/domain/entities/trip.dart';
import 'package:traver_riverpod_app/Features/trip/presentation/providers/trip_provider.dart';

class AddTripPage extends ConsumerWidget {
  AddTripPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: 'City trip');
  final _descController = TextEditingController(text: 'Best City ever');
  final _locationController = TextEditingController(text: 'Paris');
  final _imagesController = TextEditingController(
      text:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg/800px-La_Tour_Eiffel_vue_de_la_Tour_Saint-Jacques%2C_Paris_ao%C3%BBt_2014_%282%29.jpg');
  final List<String> images = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(
            height: 14,
          ),
          TextFormField(
            controller: _descController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(
            height: 14,
          ),
          TextFormField(
            controller: _locationController,
            decoration: const InputDecoration(labelText: 'Location'),
          ),
          const SizedBox(
            height: 14,
          ),
          TextFormField(
            controller: _imagesController,
            decoration: const InputDecoration(labelText: 'Images'),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 45,
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                images.add(_imagesController.text);
                if (_formKey.currentState!.validate()) {
                  final newTrip = Trip(
                    title: _titleController.text,
                    description: _descController.text,
                    location: _locationController.text,
                    images: images,
                    dateTime: DateTime.now(),
                  );
                  ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
                  ref.watch(tripListNotifierProvider.notifier).loadTrips();
                }
              },
              child: const Text(
                'Add Trip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
