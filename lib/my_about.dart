import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sql2/list.dart';
import 'package:url_launcher/url_launcher.dart';

var now = new DateTime.now();
Random rnd = new Random();
Random rnd2 = new Random(now.millisecondsSinceEpoch);
int min = 1, max = 3;
int r2 = 1;

class aboutme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    r2 = min + rnd2.nextInt(max - min);
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawing Paths',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            /// main color holder.........
            ///
            color: Color.fromARGB(250, 86, 171, 47),
            child: Column(
              children: <Widget>[
                //// top 1st child hilder
                firstChild_1stRoW(hei, wid),

                ////////////// second child holder........
                SEcond_Child_1stRoW(hei, wid),
              ],
            ),
          ),
        ),
      ),
    );
  }

  firstChild_1stRoW(double hei, double wid) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(250, 168, 224, 99),
              Color.fromARGB(250, 86, 171, 47),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: wid,
        height: hei / 1.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38, left: 20, bottom: 2),
              //// image/........................
              child: Row(
                children: <Widget>[
                  setCircleAvWithRandomness(r2),

                  ///////////////////// name//////////////////////
                  ///
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Md. Khatami ',
                            style: TextStyle(
                                fontFamily: ttf[2],
                                fontSize: 30,
                                letterSpacing: 3,
                                wordSpacing: 2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Text(
                            '''RUET'18''',
                            style: TextStyle(
                                fontFamily: ttf[2],
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                                letterSpacing: 6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //////////////////////////////// for details...................
            ///
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '''Hello welcome here, myself khatami. I'm a student of Ruet onBoard in CSE department,  passionate about Android development. As a matter of fact this app is the result of my Compassion for development and love to my RUET. I would be glad if you find the app helpful. More Up-comming development is in the stack of time....You can conncet with me from these folloing links. Thanks for your valuable time..''',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'man1',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  )
                ],
              ),
            ),

            //////////// for faceBook and Gmail links........................"mailto:$url?subject=Untitled
            Row(
              children: <Widget>[
                buttonMaker('asset/facebook.png',
                    'https://m.facebook.com/ronin.returns/'),
                buttonMaker('asset/gmail.png',
                    'mailto:khatamionik@gmail.com?subject=Untitled'),
                buttonMaker('asset/phone.png', 'tel://01743330066'),
              ],
            ),
          ],
        ));
  }

  SEcond_Child_1stRoW(double hei, double wid) {
    return Container(
      width: wid,
      height: hei / 1.8,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        boxShadow: [
          //background color of box
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              -1.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(250, 221, 94, 137),
            Color.fromARGB(250, 247, 187, 151),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),

      //   color: Colors.blue,
      child: Column(
        children: <Widget>[
          Center(
              child: Text(
            'More',
            style: TextStyle(
                fontFamily: 'man1',
                fontSize: 30,
                letterSpacing: 10,
                fontWeight: FontWeight.bold),
          )),
          Center(
            child: Text(
              'hey!! welcome.....Sorry.... nothing more  in this section....Maybe more in Future Updates..... stay connrected..........',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  buttonMaker(String name, String url) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: IconButton(
            onPressed: () async {
              await launch(url, forceSafariVC: false);
              //     int r = min + rnd.nextInt(max - min);
              //   print("$r is in the range of $min and $max"); // e.g. 31
              // used as a function nextInter:
              //   r2 = min + rnd2.nextInt(max - min);
            },
            icon: ImageIcon(AssetImage(name))),

        //  GestureDetector(
        //     onTap: () {
        //       print("manner");
        //       launch(url);
        //     },
        //     child: ImageIcon(AssetImage(name))),
        // CircleAvatar(
        //   child: Text(name),
        // ),
      ),
    );
  }

  setCircleAvWithRandomness(int r2) {
    String ss = 'asset/apper' + r2.toString() + '.jpg';
    return CircleAvatar(
      backgroundImage: AssetImage(ss),
      radius: 70,
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    var path = Path();

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
