import 'package:flutter/material.dart';
import 'package:habit_tracker/di/injection.dart';
import 'package:habit_tracker/view/features/edit/edit_page.dart';
import 'package:habit_tracker/view/features/home/home_page.dart';
import 'package:habit_tracker/view_model/view_model.dart';

void main() {
  configureDependencies();
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    routes: {
      '/home': (_)=> HomePage(vm: getIt.get<IHomePageViewModel>()),
      '/edit': (_)=> EditPage(vm: getIt.get<IEditPageViewModel>()),
    },
    initialRoute: '/home',
  );
}
