// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$editRoute, $homeRoute];

RouteBase get $editRoute =>
    GoRouteData.$route(path: 'edit', factory: _$EditRoute._fromState);

mixin _$EditRoute on GoRouteData {
  static EditRoute _fromState(GoRouterState state) =>
      EditRoute(state.extra as IYearHabitViewModel?);

  EditRoute get _self => this as EditRoute;

  @override
  String get location => GoRouteData.$location('edit');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $homeRoute =>
    GoRouteData.$route(path: '/', factory: _$HomeRoute._fromState);

mixin _$HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
