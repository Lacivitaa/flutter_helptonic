import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar() {
  return AppBar(
    title: SvgPicture.asset('assets/logo.svg', height: 30),
    centerTitle: true,
    leading: IconButton(
        icon: SvgPicture.asset('assets/people.svg', height: 23),
        onPressed: null),
    //actions: <Widget>[
    //IconButton(
    //icon: SvgPicture.asset('assets/people.svg', height: 23),
    //onPressed: null)
    //],
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
