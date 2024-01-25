class TransactionCategoryManager {
  static List<String> expenseCategories = ['food', 'entertain'];
  static List<String> incomeCategories = ['bonus', 'salary'];

  static void addIncomeCategory(String category) {
    incomeCategories.add(category);
  }

  static void addExpenseCategory(String category) {
    incomeCategories.add(category);
  }

  static void removeIncomeCategory(String category) {
    incomeCategories.remove(category);
  }

  static void removeExpenseCategory(String category) {
    expenseCategories.remove(category);
  }
}
