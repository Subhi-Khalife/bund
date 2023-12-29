import 'package:bund/core/constant/images/png_images.dart';
import 'package:bund/features/fixed_income/data/model/bonds/bonds.dart';
import 'package:bund/features/fixed_income/data/model/fixed_income/fixed_income.dart';
import 'package:bund/features/fixed_income/data/model/term/term.dart';
import 'package:bund/features/fixed_income/domain/use_cases/get_fixed_income_use_case.dart';

class GetFixedIncomeRemote {
  Future<FixedIncomeModel> call(GetFixedIncomeUseCaseParam params) async {
    await Future.delayed(const Duration(seconds: 2));
    return FixedIncomeModel(
      annualInterest: 68.1,
      averageMaturityDate: 2026,
      totalInterest: 681,
      capitalAtMaturity: 10.681,
      investmentAmount: 1000,
      bondsNumbers: 20,
      averageRating: "AA",
      bonds: [
        BondsModel(
          description: "BBB",
          title: "Netflix INC",
          image: PngImages.netflix,
        ),
        BondsModel(
          description: "BB+",
          title: "Ford Motor LLC",
          image: PngImages.ford,
        ),
        BondsModel(
          description: "AA+",
          title: "Apple INC",
          image: PngImages.apple,
        ),
        BondsModel(
          description: "A-",
          title: "Morgan Stanley",
          image: PngImages.morganStanley,
        )
      ],
      annualYieldToMaturity: 6.81,
      termTypes: [
        TermModel(duration: 3),
        TermModel(duration: 5),
      ],
    );
  }
}
