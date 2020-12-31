import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:path/path.dart';

class aboutBuild extends StatefulWidget {
  aboutBuild({this.data, this.data2});
  String data;
  String data2;

  @override
  _aboutBuildState createState() => _aboutBuildState();
}

class _aboutBuildState extends State<aboutBuild> {
  String data3;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About-RUET"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.blue[100],
        child: SingleChildScrollView(
          child: mainViewBuild(),
        ),
      ),
    );
  }

  mainViewBuild() {
    if (widget.data2 == null) widget.data2 = "";
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: multipleRet_for_convenience(
                  '18 Departments', 1, Colors.cyan[100], Colors.cyan),
            ),
            Expanded(
              child: multipleRet_for_convenience(
                  '5650 Students', 1, Colors.amber[200], Colors.amber[900]),
            ),
            Expanded(
              child: multipleRet_for_convenience(
                  '299 Faculty Members', 1, Colors.red[100], Colors.red),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: multipleRet_for_convenience('525 Officers & Staffs', 1,
                  Colors.deepPurpleAccent[100], Colors.purple[900]),
            ),
            Expanded(
              child: multipleRet_for_convenience(
                  '10000 Alumni', 1, Colors.teal, Colors.black),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: multipleRet_for_convenience(
                  'One RUET', 1, Colors.green[100], Colors.green),
            ),
          ],
        ),
        Text(
          'Short - History',
          style: TextStyle(
              fontFamily: "man8", fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Stepper(
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Container();
          },
          steps: steps,
          currentStep: _index,
          onStepTapped: (step) => goTo(step),
        ),
        Text(
          'OverView',
          style: TextStyle(
              fontFamily: "man8", fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Container(
          child: Text(
            widget.data,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "man3", fontSize: 25),
          ),
        ),
        // Text(
        //   'History',
        //   style: TextStyle(
        //       fontFamily: "man8", fontWeight: FontWeight.bold, fontSize: 25),
        // ),
        // Container(
        //   child: Text(
        //     widget.data2,
        //     style: TextStyle(fontFamily: "man3", fontSize: 25),
        //   ),
        // ),
      ],
    );
  }

  multipleRet_for_convenience(
      String txt, int pos, Color Bacclr, Color txtColor) {
    return Container(
      height: 120,
      //  width: 80,
      child: Card(
          elevation: 3,
          color: Bacclr,
          child: Center(
            child: Text(
              txt,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'man1',
                  fontSize: 25,
                  color: txtColor,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

//////////////////////////
/////////////////////////
  /// for steppers....................
  /// ......................

  goTo(int step) {
    setState(() {
      _index = step;
      fontSetter = 'man1';
    });
  }

  String fontSetter = 'man9';
  List<Step> steps = [
    Step(
      isActive: true,
      // state: StepState.editing,
      title: textWid('man1', '1964 Established'),
      subtitle: Text('Rajshahi Engineering College'),
      content: Text(
        'Consisting three Engineering departments namely Mechanical Engineering, Electrical & Electronic Engineering and Civil Engineering',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    Step(
      isActive: true,
      // state: StepState.editing,
      title: textWid('man1', '1986'),

      subtitle: Text(
        'Named as BIT',
      ),
      content: Text(
        'Named as Bangladesh Institute of Technology (BIT), Rajshahi',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    Step(
      isActive: true,
      // state: StepState.editing,
      title: textWid('man1', 'September, 2003'),

      subtitle: Text('Named as RUET'),
      content: Text(
        'The institute is upgraded as Rajshahi University of Engineering & Technology (RUET)',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    Step(
      isActive: true,
      // state: StepState.editing,
      title: const Text(
          'The Rajshahi University of Engineering &Technology\n Act 2003.'),
      content: Text('Ruet act 2003'),
    ),
  ];

  static textWid(String man, String text) {
    return Text(
      text,
      style:
          TextStyle(fontFamily: man, fontWeight: FontWeight.bold, fontSize: 15),
    );
  }
}
