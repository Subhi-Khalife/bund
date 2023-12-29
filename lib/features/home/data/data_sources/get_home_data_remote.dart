import 'package:bund/core/constant/images/png_images.dart';
import 'package:bund/core/constant/images/svg_images.dart';
import 'package:bund/features/home/data/models/bank_special_items/back_special_items.dart';
import 'package:bund/features/home/data/models/banner/banner.dart';
import 'package:bund/features/home/data/models/conditions/conditions.dart';
import 'package:bund/features/home/data/models/home/home.dart';
import 'package:bund/features/home/domain/use_case/get_home_use_case.dart';

class GetHomeDataRemote {
  Future<List<HomeModel>> call(GetHomeUseCaseParam params) async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value([
      HomeModel(
        banner: BannerModel(image: PngImages.sukascopyBank, type: "Standard"),
        bankSpecialItems: [
          BankSpecialItemsModel(image: SvgImages.bank, isActive: true, title: 'Swiss Bank Account'),
          BankSpecialItemsModel(
              image: SvgImages.bankCard, isActive: true, title: 'Mastercard prepaid'),
          BankSpecialItemsModel(
              image: SvgImages.power, isActive: true, title: 'Account Open Same Day'),
          BankSpecialItemsModel(
              image: SvgImages.umbrela, isActive: true, title: 'Protected up to \$100,000'),
          BankSpecialItemsModel(
              image: SvgImages.investmentPortfolios,
              isActive: false,
              title: 'Investments Portfolios'),
          BankSpecialItemsModel(
              image: SvgImages.deposits, isActive: false, title: 'Deposits Options'),
        ],
        conditionsModel: ConditionsModel(minimumDepositValue: null, paidAnnualy: 15),
      ),
      HomeModel(
        banner: BannerModel(image: PngImages.cimBank, type: "Plus"),
        bankSpecialItems: [
          BankSpecialItemsModel(image: SvgImages.bank, isActive: true, title: 'Swiss Bank Account'),
          BankSpecialItemsModel(
              image: SvgImages.bankCard, isActive: true, title: 'Mastercard Debit/Credit'),
          BankSpecialItemsModel(
              image: SvgImages.umbrela, isActive: true, title: 'Protected up to \$100,000'),
          BankSpecialItemsModel(
              image: SvgImages.investmentPortfolios,
              isActive: true,
              title: 'Investments Portfolios'),
          BankSpecialItemsModel(
              image: SvgImages.deposits, isActive: true, title: 'Fixed Income Deposit'),
        ],
        conditionsModel: ConditionsModel(minimumDepositValue: 10000, paidAnnualy: 30),
      ),
      HomeModel(
        banner: BannerModel(image: PngImages.ubsBank, type: "Max"),
        bankSpecialItems: [
          BankSpecialItemsModel(image: SvgImages.bank, isActive: true, title: 'Swiss Bank Account'),
          BankSpecialItemsModel(
              image: SvgImages.bankCard, isActive: true, title: 'Mastercard Debit/Credit'),
          BankSpecialItemsModel(
              image: SvgImages.umbrela, isActive: true, title: 'Protected up to \$100,000'),
          BankSpecialItemsModel(
              image: SvgImages.investmentPortfolios,
              isActive: true,
              title: 'Investments Portfolios'),
          BankSpecialItemsModel(
              image: SvgImages.deposits, isActive: true, title: 'Fixed Income Deposit'),
        ],
        conditionsModel: ConditionsModel(minimumDepositValue: 50000, paidAnnualy: 200),
      ),
      HomeModel(
        banner: BannerModel(image: PngImages.ubsBank, type: "Max"),
        bankSpecialItems: [
          BankSpecialItemsModel(image: SvgImages.bank, isActive: true, title: 'Swiss Bank Account'),
          BankSpecialItemsModel(
              image: SvgImages.bankCard, isActive: true, title: 'Mastercard Debit/Credit'),
          BankSpecialItemsModel(
              image: SvgImages.umbrela, isActive: true, title: 'Protected up to \$100,000'),
          BankSpecialItemsModel(
              image: SvgImages.investmentPortfolios,
              isActive: true,
              title: 'Investments Portfolios'),
          BankSpecialItemsModel(
              image: SvgImages.deposits, isActive: true, title: 'Fixed Income Deposit'),
        ],
        conditionsModel: ConditionsModel(minimumDepositValue: 500000, paidAnnualy: null),
      ),
    ]);
  }
}
