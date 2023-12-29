import 'package:bund/core/use_case/use_case.dart';
import 'package:bund/features/fixed_income/data/model/fixed_income/fixed_income.dart';
import 'package:bund/features/fixed_income/domain/repositories/fixed_income_repositories.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

class GetFixedIncomeUseCase implements UseCase<FixedIncomeModel, GetFixedIncomeUseCaseParam> {
  GetFixedIncomeUseCase({required this.fixedIncomeRepositories});
  final FixedIncomeRepositories fixedIncomeRepositories;
  @override
  Future<Either<Failure, FixedIncomeModel>> call(GetFixedIncomeUseCaseParam params) async {
    return fixedIncomeRepositories.getFixedIncomeData(params);
  }
}

class GetFixedIncomeUseCaseParam {
  GetFixedIncomeUseCaseParam();
  Map<String, dynamic> getParam() => {};
}
