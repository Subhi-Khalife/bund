import 'package:bund/core/use_case/use_case.dart';
import 'package:bund/features/home/data/models/home/home.dart';
import 'package:bund/features/home/domain/repositories/home_screen_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

class GetHomeUseCase implements UseCase<List<HomeModel>, GetHomeUseCaseParam> {
  GetHomeUseCase({required this.homeScreenRepositories});
  final HomeScreenRepositories homeScreenRepositories;
  @override
  Future<Either<Failure, List<HomeModel>>> call(GetHomeUseCaseParam params) async {
    return homeScreenRepositories.getHomeData(params);
  }
}

class GetHomeUseCaseParam {
  GetHomeUseCaseParam();
  Map<String, dynamic> getParam() => {};
}
