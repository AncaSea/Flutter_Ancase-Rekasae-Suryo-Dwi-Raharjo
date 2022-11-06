import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/vvm/view_model.dart';

class BottomContent extends StatefulWidget {
  const BottomContent({super.key, required this.color1, required this.color2, required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<BottomContent> createState() => _BottomContentState();
}

class _BottomContentState extends State<BottomContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
      builder: (context, value, _) => 
      Container(
        height: 70,
        decoration: BoxDecoration(
          color: widget.color3,
        ),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [BoxShadow(
                  color: Colors.black54, blurRadius: 7,
                  spreadRadius: 1,offset: Offset(0, 0))]
              ),
              child: Text('Download', style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: Colors.green.withOpacity(0.3),
                  onTap: () {
                    // print('add product test');
                      value.launchURL(value.apiDetailGame.gameUrl);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}