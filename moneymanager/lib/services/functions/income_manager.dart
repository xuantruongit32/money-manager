import 'package:moneyManager/services/models/income.dart';

class IncomeManager {
  static List<Income> incomes=[];

  static addIncome(Income income){
    incomes.add(income);
  }
  static removeIncome(Income income){
    incomes.remove(income);
  }
}
