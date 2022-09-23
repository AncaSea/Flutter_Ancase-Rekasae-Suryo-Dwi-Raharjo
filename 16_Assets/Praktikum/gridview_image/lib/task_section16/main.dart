import 'package:flutter/material.dart';
import 'package:gridview_image/task_section16/rute_dua.dart';

void main() {
  runApp(GridImage());
}

class ImageNet {
  String gambar;
  ImageNet(
    this.gambar,
  );
}

class GridImage extends StatelessWidget {
  GridImage({super.key});

  final List<ImageNet> image = [
    ImageNet('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg'),
    ImageNet('https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_960_720.jpg'),
    ImageNet('https://cdn.pixabay.com/photo/2016/01/08/11/57/butterflies-1127666_960_720.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'GridView Image',
            style: TextStyle(
              fontFamily: 'Arial'
            ),
          ),
        ),
        body: GridView.builder(
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), 
          itemBuilder: (context, index) {
            return Stack(
              children: 
                <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(image[index].gambar),
                        ),
                      ),
                    ),
                  ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteTwo(
                            image: image[index].gambar,
                        ),
                      )
                    );
                    },
                  )
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}