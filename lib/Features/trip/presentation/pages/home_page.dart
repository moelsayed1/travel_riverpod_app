import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traver_riverpod_app/Features/trip/presentation/pages/add_trip_page.dart';
import 'package:traver_riverpod_app/Features/trip/presentation/pages/my_trip_page.dart';
import 'package:traver_riverpod_app/Features/trip/presentation/providers/trip_provider.dart';

class HomePage extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tripListNotifierProvider.notifier).loadTrips();
    _pageController.addListener(() {
      _currentIndex.value = _pageController.page!.round();
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Disha! 👋',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'travelling today?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: [
            const MyTripPage(),
            AddTripPage(),
            const Text('3'),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, pageIndex, child) {
            return BottomNavigationBar(
              currentIndex: pageIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'My trips',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add trips',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Maps',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            );
          },
        ),
      ),
    );
  }
}
