import '../../../../core/utils/functions/build_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart', onTap: () {}),
      body: const MyCartViewBody(),
    );
  }
}