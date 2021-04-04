import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> imageList = [
  "https://static2.thetravelimages.com/wordpress/wp-content/uploads/2018/08/seattle-skyline.jpg",
  "https://viajando.expedia.com.br/sites/viajando.expedia.com.br/files/Golden%20Gate%20Bridge%20San%20Francisco.jpg",
];

SingleChildScrollView buildSingleChildScrollView() {
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
              createCarousel()
              //buildCardInfo(),
              //SizedBox(height: 8),
              //buildCardInfo(),
              //SizedBox(height: 8),
              //buildCardInfo(),
              //SizedBox(height: 24),
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

Container showImage() {
  return Container(
      height: 200,
      width: double.infinity,
      child: Stack(alignment: Alignment.bottomLeft, children: <Widget>[
        Image.network(
          "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
          fit: BoxFit.cover,
        ),
      ]));
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
