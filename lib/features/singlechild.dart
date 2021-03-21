import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Text("Informações",
                    style: GoogleFonts.coda(fontSize: 18, color: Colors.black)),
                SizedBox(height: 8),
                buildCardInfo(),
                SizedBox(height: 8),
                buildCardInfo(),
                SizedBox(height: 8),
                buildCardInfo(),
                SizedBox(height: 24),
              ],
            )),
          )
        ],
      ),
    );
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
                  Color(0xFFc5a6c0),
                  Color(0xFFa47b9e),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }