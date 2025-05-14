import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextAndTextButtonRow extends StatelessWidget {
  const TextAndTextButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Today Habits', style: Theme.of(context).textTheme.headlineLarge),
        TextButton(
          onPressed: () {},
          child: Text(
            'See all',
            style: TextStyle(fontSize: 14.h, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
