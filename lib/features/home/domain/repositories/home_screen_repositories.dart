import 'package:bund/core/error/failures.dart';
import 'package:bund/features/home/data/models/home/home.dart';
import 'package:bund/features/home/domain/use_case/get_home_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class HomeScreenRepositories {
  Future<Either<Failure, List<HomeModel>>> getHomeData(GetHomeUseCaseParam params);
}
