import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/di/injection.dart';
import 'package:habit_tracker/view/features/edit/edit_page.dart';
import 'package:habit_tracker/view/features/home/home_page.dart';
import 'package:habit_tracker/view_model/view_model.dart';

import 'routes.dart';

part 'router.g.dart';

@TypedGoRoute<HomeRoute>(path: Routes.home)
class HomeRoute extends GoRouteData with _$HomeRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      HomePage(vm: getIt.get<IHomePageViewModel>());
}

@TypedGoRoute<EditRoute>(path: Routes.edit)
class EditRoute extends GoRouteData with _$EditRoute{
  final IYearHabitViewModel? $extra;

  const EditRoute(this.$extra);

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditPage(vm: getIt.get<IEditPageViewModel>(param1: $extra));
}
