import 'package:bund/core/error/failures.dart';
import 'package:bund/features/fixed_income/data/data_sources/get_fixed_income_remote.dart';
import 'package:bund/features/fixed_income/data/model/fixed_income/fixed_income.dart';
import 'package:bund/features/fixed_income/domain/repositories/fixed_income_repositories.dart';
import 'package:bund/features/fixed_income/domain/use_cases/get_fixed_income_use_case.dart';
import 'package:dartz/dartz.dart';

class FixedIncomeRepositoriesImpl implements FixedIncomeRepositories {
  final GetFixedIncomeRemote getFixedIncomeRemote;
  FixedIncomeRepositoriesImpl({required this.getFixedIncomeRemote});
  @override
  Future<Either<Failure, FixedIncomeModel>> getFixedIncomeData(
      GetFixedIncomeUseCaseParam params) async {
    final model = await getFixedIncomeRemote.call(params);
    return Right(model);
  }
}
