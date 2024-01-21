import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LineOfAddTrans extends StatelessWidget {
  const LineOfAddTrans({required this.text, required this.content, Key? key})
      : super(key: key);
  final text;
  final content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
            const Gap(100),
            Text(content),
          ],
        ),
        Divider(),
      ],
    );
  }
}
