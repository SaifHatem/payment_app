import '../assets.dart';
import '../styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({
  required final String title,
  required final void Function()? onTap,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: GestureDetector(
      onTap: onTap,
      child: Center(
        child: SvgPicture.asset(Assets.assetsImagesArrow),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: AppStyles.styleMedium25,
    ),
  );
}
