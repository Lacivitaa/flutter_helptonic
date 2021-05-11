import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ftt/constant/user_const.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> imageList = [];

SingleChildScrollView buildSingleChildScrollView(bool update) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Todas as fotos registradas",
                  style: GoogleFonts.coda(fontSize: 18, color: Colors.black)),
              SizedBox(height: 8),
              Visibility(
                child: createCarousel(),
                visible: UserConst.imageCarousel,
              ),
              Visibility(
                child: Text("Nenhuma foto encontrada"),
                visible: UserConst.disconnected,
              )
            ],
          )),
        )
      ],
    ),
  );
}

CarouselImages createCarousel() {

  return new CarouselImages(
      scaleFactor: 0.8,
      listImages: imageList,
      height: 300.0,
      borderRadius: 10.0,
      cachedNetworkImage: true,
      verticalAlignment: Alignment.topCenter);
}

buildCardInfo() {
  return Container(
    height: 200,
    width: double.infinity,
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            right: 20,
            top: 20,
          ),
          height: 195,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFb02f2f),
                Color(0xFFab0000),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        )
      ],
    ),
  );
}
