// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/habits_repository.dart' as _i47;
import '../data/i_habits_repository.dart' as _i458;
import '../view_model/edit_page_view_model.dart' as _i1011;
import '../view_model/home_page_view_model.dart' as _i682;
import '../view_model/i_edit_page_view_model.dart' as _i94;
import '../view_model/i_home_page_view_model.dart' as _i956;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i458.IHabitsRepository>(() => _i47.HabitsRepository());
    gh.factory<_i94.IEditPageViewModel>(
      () => _i1011.EditPageViewModel(repository: gh<_i458.IHabitsRepository>()),
    );
    gh.factory<_i956.IHomePageViewModel>(
      () => _i682.HomePageViewModel(repository: gh<_i458.IHabitsRepository>()),
    );
    return this;
  }
}
