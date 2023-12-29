import 'package:bund/features/fixed_income/data/data_sources/get_fixed_income_remote.dart';
import 'package:bund/features/fixed_income/data/repositories/fixed_income_repositories_impl.dart';
import 'package:bund/features/fixed_income/domain/use_cases/get_fixed_income_use_case.dart';
import 'package:bund/features/fixed_income/presentation/blocs/fixed_income/fixed_income_bloc.dart';
import 'package:bund/features/home/data/data_sources/get_home_data_remote.dart';
import 'package:bund/features/home/data/repositories_impl/home_screen_repositories_impl.dart';
import 'package:bund/features/home/domain/use_case/get_home_use_case.dart';
import 'package:bund/features/home/presentation/bloc/home_screen/home_screen_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

class Injection {
  static Future<void> init() async => _appDependencies();

  static Future<void> _appDependencies() async {
    // Home Screen
    serviceLocator.registerFactory<HomeScreenBloc>(
        () => HomeScreenBloc(getHomeUseCase: serviceLocator<GetHomeUseCase>()));
    serviceLocator.registerFactory<GetHomeUseCase>(
        () => GetHomeUseCase(homeScreenRepositories: serviceLocator<HomeScreenRepositoriesImpl>()));
    serviceLocator.registerFactory<HomeScreenRepositoriesImpl>(
        () => HomeScreenRepositoriesImpl(getHomeDataRemote: serviceLocator<GetHomeDataRemote>()));
    serviceLocator.registerFactory<GetHomeDataRemote>(() => GetHomeDataRemote());

    // Fixed income
    serviceLocator.registerFactory<FixedIncomeBloc>(
        () => FixedIncomeBloc(getFixedIncomeUseCase: serviceLocator<GetFixedIncomeUseCase>()));
    serviceLocator.registerFactory<GetFixedIncomeUseCase>(() => GetFixedIncomeUseCase(
        fixedIncomeRepositories: serviceLocator<FixedIncomeRepositoriesImpl>()));
    serviceLocator.registerFactory<FixedIncomeRepositoriesImpl>(() =>
        FixedIncomeRepositoriesImpl(getFixedIncomeRemote: serviceLocator<GetFixedIncomeRemote>()));
    serviceLocator.registerFactory<GetFixedIncomeRemote>(() => GetFixedIncomeRemote());
  }
}
