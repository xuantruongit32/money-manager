import 'package:flutter/material.dart';
import 'package:moneyManager/services/models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.category, required this.removeCategory})
      : super(key: key);
  final Category category;
  final Function removeCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Text(category.name),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    removeCategory(category);
                  },
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
