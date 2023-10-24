import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar buildAppBar({required final String title}) {
  return AppBar(
    // leading: const Icon(Icons.arrow_back, size: 30),
    centerTitle: true,
    title: Text(
      title,
      style: Styles.style25,
    ),
  );
}
