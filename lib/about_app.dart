import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class aboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About this app',
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[100],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            //  child: Text('This app is made as secondary project  '),
            decoration: BoxDecoration(
              color: Colors.white30,
              image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  image: AssetImage('asset/vec2.jpg')),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'This app is made as a secondary project. And All datas been taken from the the Ruet website as public information. The key features are on the mian Screen.The Images are subjects to be loaded from the Website Via Internet. If you find anything wrong.. fell free to contact me on my Email or on Facebook.\nThank You',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[900],
                    fontFamily: 'man3',
                    fontWeight: FontWeight.bold,
                    fontSize: 33),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                  child: Text(
                'Ruet.In v1.01 All rights reserved By the Owner\n Muhammed Khatami',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'man3', wordSpacing: 4, letterSpacing: 2),
              ))
            ],
          )
        ],
      ),
    );
  }
}
