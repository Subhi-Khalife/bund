import 'package:bund/core/error/failures.dart';
import 'package:bund/features/home/data/data_sources/get_home_data_remote.dart';
import 'package:bund/features/home/data/models/home/home.dart';
import 'package:bund/features/home/domain/repositories/home_screen_repositories.dart';
import 'package:bund/features/home/domain/use_case/get_home_use_case.dart';
import 'package:dartz/dartz.dart';

class HomeScreenRepositoriesImpl implements HomeScreenRepositories {
  final GetHomeDataRemote getHomeDataRemote;
  HomeScreenRepositoriesImpl({required this.getHomeDataRemote});
  @override
  Future<Either<Failure, List<HomeModel>>> getHomeData(GetHomeUseCaseParam params) async {
    final model = await getHomeDataRemote.call(params);
    return Right(model);
  }
}
