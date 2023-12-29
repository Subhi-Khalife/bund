import 'package:bund/core/error/failures.dart';
import 'package:bund/features/fixed_income/data/model/fixed_income/fixed_income.dart';
import 'package:bund/features/fixed_income/domain/use_cases/get_fixed_income_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class FixedIncomeRepositories {
  Future<Either<Failure, FixedIncomeModel>> getFixedIncomeData(GetFixedIncomeUseCaseParam params);
}
