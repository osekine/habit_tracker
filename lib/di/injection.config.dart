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
import '../view_model/factories/category_view_model_factory.dart' as _i813;
import '../view_model/factories/i_category_view_model_factory.dart' as _i773;
import '../view_model/factories/i_year_habit_view_model_factory.dart' as _i33;
import '../view_model/factories/year_habit_view_model_factory.dart' as _i1001;
import '../view_model/home_page_view_model.dart' as _i682;
import '../view_model/i_edit_page_view_model.dart' as _i94;
import '../view_model/i_home_page_view_model.dart' as _i956;
import '../view_model/i_year_habit_view_model.dart' as _i338;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i773.ICategoryViewModelFactory>(
      () => _i813.CategoryViewModelFactory(),
    );
    await gh.lazySingletonAsync<_i458.IHabitsRepository>(() {
      final i = _i47.HabitsRepository();
      return i.init().then((_) => i);
    }, preResolve: true);
    gh.factoryParam<
      _i94.IEditPageViewModel,
      _i338.IYearHabitViewModel?,
      dynamic
    >(
      (editableHabit, _) => _i1011.EditPageViewModel(
        repository: gh<_i458.IHabitsRepository>(),
        editableHabit: editableHabit,
      ),
    );
    gh.lazySingleton<_i33.IYearHabitViewModelFactory>(
      () => _i1001.YearHabitViewModelFactory(
        habitsRepository: gh<_i458.IHabitsRepository>(),
      ),
    );
    await gh.lazySingletonAsync<_i956.IHomePageViewModel>(() {
      final i = _i682.HomePageViewModel(
        categoriesFactory: gh<_i773.ICategoryViewModelFactory>(),
        repository: gh<_i458.IHabitsRepository>(),
        habitViewModelFactory: gh<_i33.IYearHabitViewModelFactory>(),
      );
      return i.init().then((_) => i);
    }, preResolve: true);
    return this;
  }
}
