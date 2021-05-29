import 'package:flutter/material.dart';

AppBar buildAppBar(String title){
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Color(0xFFab0000),
  );
}