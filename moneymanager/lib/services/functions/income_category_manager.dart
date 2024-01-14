class IncomeCategoryManager {
  static List<String> categories = ['salary', 'bonus'];

  static void addCategory(String category) {
    categories.add(category);
  }

  static void removeCategory(String category) {
    categories.remove(category);
  }
}
