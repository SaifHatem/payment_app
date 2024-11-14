import '../../../../core/utils/functions/build_app_bar.dart';
import '../widgets/thankyou_view_body.dart';
import 'package:flutter/material.dart';

class ThankyouView extends StatelessWidget {
  const ThankyouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
          title: '',
          onTap: () {
            Navigator.pop(context);
          }),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankyouViewBody()),
    );
  }
}
