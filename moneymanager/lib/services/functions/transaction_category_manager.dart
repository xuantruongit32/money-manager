class TransactionCategoryManager {
  static List<String> expenseCategories = [];
  static List<String> incomeCategories = [
  ];

  static void addIncomeCategory(String category) {
    incomeCategories.add(category);
  }

  static void addExpenseCategory(String category) {
    expenseCategories.add(category);
  }

  static void removeIncomeCategory(String category) {
    incomeCategories.remove(category);
  }

  static void removeExpenseCategory(String category) {
    expenseCategories.remove(category);
  }
}
