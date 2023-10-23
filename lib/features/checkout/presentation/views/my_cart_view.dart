import 'package:flutter/material.dart';
import 'package:flutter_paymob/core/utils/styles.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, size: 30),
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: Styles.style25,
        ),
      ),
    );
  }
}
