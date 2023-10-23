import 'package:flutter/material.dart';
import 'package:flutter_paymob/core/utils/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.titleLarge, required this.value});
  final String titleLarge, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleLarge,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style24,
        ),
      ],
    );
  }
}
