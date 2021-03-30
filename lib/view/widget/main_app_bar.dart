import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildMainAppBar() {
  return AppBar(
    title: SvgPicture.asset('assets/logo.svg', height: 30),
    centerTitle: true,
    leading: IconButton(
        icon: SvgPicture.asset('assets/slide.svg', height: 25),
        onPressed: null),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
