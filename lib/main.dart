import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/di/injection.dart';
import 'package:habit_tracker/navigation/router.dart';
import 'package:habit_tracker/navigation/routes.dart';
import 'package:habit_tracker/view/features/home/home_page.dart';
import 'package:habit_tracker/view_model/view_model.dart';

final _router = GoRouter(
  routes: $appRoutes,
  errorBuilder:
      (_, state) =>
          HomePage(vm: getIt.get<IHomePageViewModel>()), // Обработка ошибок
  initialLocation: Routes.home,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) =>
      MaterialApp.router(routerConfig: _router);
}
