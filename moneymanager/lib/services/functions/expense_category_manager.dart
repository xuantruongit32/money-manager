class ExpenseCategoryManager {
  static List<String> categories = ['food', 'entertain'];

  static void addCategory(String category) {
    categories.add(category);
  }

  static void removeCategory(String category) {
    categories.remove(category);
  }
}
