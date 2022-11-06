import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/vvm/view_model.dart';

class ContentGame extends StatefulWidget {
  const ContentGame({super.key, required this.color1, required this.color2, required this.color3, required this.listMinReq});

  final Color color1;
  final Color color2;
  final Color color3;
  final List<String> listMinReq;

  @override
  State<ContentGame> createState() => _ContentGameState();
}

class _ContentGameState extends State<ContentGame> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
      builder: (context, value, _) => 
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 15),
            decoration: BoxDecoration(
              color: widget.color3,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.apiDetailGame.publisher,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Text(
                            value.apiDetailGame.title,
                            style: GoogleFonts.poppins(
                              color: Colors.cyan[200],
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              value.apiDetailGame.platform,
                              style: GoogleFonts.poppins(
                                color: Colors.indigo[900],
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    value.apiDetailGame.description,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Minimum Requirement :',
                      style: GoogleFonts.poppins(
                        color: Colors.indigo[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.listMinReq.length,
                    itemBuilder: (context, index) {
                      final minReq = value.apiDetailGame.minimumSystemRequirements.toJson();
                      String data = minReq.values.elementAt(index);
                      return Text(
                        '${widget.listMinReq[index]} : $data',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      );
                    } 
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Screenshots',
                      style: GoogleFonts.poppins(
                        color: Colors.indigo[900],
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: BoxDecoration(
                      // color: widget.color2,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: value.apiDetailGame.screenshots.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            value.apiDetailGame.screenshots[index].image)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: widget.color2,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}