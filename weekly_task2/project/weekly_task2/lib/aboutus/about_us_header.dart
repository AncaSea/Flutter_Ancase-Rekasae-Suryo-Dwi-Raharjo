import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsHeader extends StatelessWidget {
  const AboutUsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent[100]!.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 55,
            left: 0,
            right: 5,
            child: Container(
              width: 450,
              height: 450,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Booking Bus Online',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.dmSans().fontFamily
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
                child: Text(
                  textAlign: TextAlign.center,
                  'Berikut adalah beberapa contoh produk yang kami tawarkan berupa tiket bus sesuai jurusan',
                  style: TextStyle(
                    fontFamily: GoogleFonts.notoSansCaucasianAlbanian().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}