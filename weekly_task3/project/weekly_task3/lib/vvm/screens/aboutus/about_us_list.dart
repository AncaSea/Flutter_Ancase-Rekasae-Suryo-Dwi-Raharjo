import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/product_model.dart';

// ignore: must_be_immutable
class AboutUsListItem extends StatelessWidget {
  AboutUsListItem({super.key});

  List<Product> produk = [
    Product('Jakarta - Surabaya', 'assets/favpng_bus-icon.png', 'Rp. 40.000',
        'Ekonomi', Colors.blue),
    Product('Surabaya - Klaten', 'assets/favpng_bus-icon.png', 'Rp. 50.000',
        'Bisnis', Colors.lime),
    Product('Bali - Klaten', 'assets/favpng_bus-icon.png', 'Rp. 600.000',
        'Ekonomi', Colors.red),
    Product('Malang - Solo', 'assets/favpng_bus-icon.png', 'Rp. 80.000',
        'Reguler', Colors.teal),
    Product('Jakarta - Solo', 'assets/favpng_bus-icon.png', 'Rp. 120.000',
        'Premium', Colors.indigo),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: produk.length,
        itemBuilder: (ctx, i) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          clipBehavior: Clip.hardEdge,
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
                left: 160,
                bottom: 150,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: produk[i].color,
                    borderRadius: BorderRadius.circular(200),
                  ),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'Harga Tiket',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w700, color: Colors.black
                      )
                    ),
                    subtitle: Text(
                      produk[i].price,
                      style: TextStyle(
                          fontFamily: GoogleFonts.bebasNeue().fontFamily,
                          color: Colors.black,
                          fontSize: 28),
                    ),
                    // trailing: Image.asset('assets/icons/Shopping-bag.webp'),
                  ),
                  Image.asset(produk[i].image),
                  ListTile(
                    title: Text(produk[i].jurusan),
                    subtitle: Text(
                      produk[i].kelas,
                      style: TextStyle(
                        fontFamily: GoogleFonts.dmSans().fontFamily,
                        color: Colors.amber[600]
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}