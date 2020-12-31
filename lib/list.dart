import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql2/allSirs.dart';
import 'package:sql2/databaseHelper.dart';
import 'package:sql2/test.dart';
import 'TeacherInfoBuilder.dart';
import 'statuaryAuth.dart';
import 'secondaryListPrinter.dart';
import 'allSirs.dart';
import 'noticeRequest.dart';
import 'about.dart';

class list {
  List<Entry> sdf = [
    Entry("Vice-Chancellor", "423"),
    Entry("All-Teachers", "49"),
    // Entry("University Syndicate",
    //     "https://www.ruet.ac.bd/list/university-syndicate-member"),

    /// AUTHORITY///........................................................................................................................................
    Entry("Statutory Authorities", "#", [
      Entry('Academic Council', '0'),
      Entry('''Director of Student's Welfare(DSW)''', '1'),
      Entry('Director of Planning and Development(P&D)', '2'),
      Entry('Director of Research and Extension(R&E)', '3'),
      Entry('Director of Institutional Quality Assurance Cell(IQAC)', '4'),
      Entry('Director of RUET Further Development Project(PD RUET)', '5'),
      Entry('Director of ICT Cell(ICT)', '5'),
      Entry('Controller of Examinations', '6'),
    ]),

//// OFFICE///..........................................................................................................................................................
    Entry("Administrative Offices", "#", [
      Entry('Office of the Vice-Chancellor', '7'),
      Entry('Office of the Registrar', '8'),
      Entry('Office of the Comptroller', '9'),
      Entry('Office of the Central Library', '10'),
      Entry('Office of the Chief Engineer', '11'),
    ]),
    Entry("Sections", "#", [
      Entry('Accounts Section', '''12'''),
      Entry('Audit Section', '13'),
      Entry('Central Computer Center', '14'),
      Entry('Establishment Section ', '15'),
      Entry('RUET PABX', '16'),
      Entry('Office of the Press and Information', '17'),
      Entry('Transport Section', '18'),
      Entry('Central Store', '19'),
      Entry('Central Mosque', '20'),
      Entry('Office of the Controller of Examination', '21'),
      Entry('Physical Education Section', '22'),
      Entry('Engineering Section', '23'),
      Entry('"Education Section', '24'),
      Entry('Central Library', '25'),
      Entry('Council Affairs', '26'),
      Entry('Medical Center', '27'),
      Entry('Security Section', '28'),
      Entry('Guest House', '29'),
      Entry('Vehicle Section', '30'),
    ]),
    /////////////////////////////////
    Entry('Department', '31', [
      Entry(' EEE', '31'),
      Entry(' CSE', '32'),
      Entry(' ETE', '33'),
      Entry(' ECE', '34'),
      Entry(' CE', '35'),
      Entry(' URP', '36'),
      Entry(' Arch', '37'),
      Entry(' BECM', '38'),
      Entry(' ME', '39'),
      Entry(' IPE', '40'),
      Entry(' GCE', '41'),
      Entry(' MTE', '42'),
      Entry(' MSE', '43'),
      Entry(' CFPE', '44'),
      Entry(' Chem', '45'),
      Entry(' Math', '46'),
      Entry(' Phy', '47'),
      Entry(' Hum', '48')
    ]),

    Entry("Deans of the Faculties", "49"),
    Entry("Heads of the Departments", "50"),
    Entry("Provosts of the Residential Halls", "51"),
    Entry("Notice", '1'),
    //// 52 is for all vice chan's list.....................
    /////////////////////////////////////
    Entry('List of hilidays', '1'),
    Entry("About-Ruet", "53"),

    Entry('Dept. of Chemistry (Chem)', '4321'),
    Entry('Dept. of Mathematics (Math)', '123'),
    Entry('Dept. of Physics (Phy)', '2434'),
    Entry('Dept. of Humanities (Hum)', 'reryg'),

    Entry('News & Events', 'sfsert'),
    Entry('Architecture', '37'),
    Entry('Building Engineering & Construction Management', 'sdfdf'),
    Entry('Chemical and Food Process Engineering', 'sdfert'),
    Entry('Chemistry', 'fdgdfg'),
    Entry('Civil Engineering', '35'),
    Entry('Computer Science & Engineering', '32'),
    Entry('Electrical & Computer Engineering', '34'),
    Entry('Electrical & Electronic Engineering', '31'),
    Entry('Electronics & Telecommunication Engineering', '33'),
    Entry('Glass and Ceramic Engineering', '645'),
    Entry('Humanities', '756'),
    Entry(' Industrial & Production Engineering', '2345'),
    Entry(' Materials Science & Engineering', '234'),
    Entry(' Mathematics', '345'),
    Entry('Mechanical Engineering', '2345'),
    Entry('Mechatronics Engineering', '123'),
    Entry('Physics', '345'),
    Entry('Urban & Regional Planning', '36'),
  ];
}

class Entry {
  const Entry(this.title, this.url, [this.children = const <Entry>[]]);
  final String title;
  final String url;
  final List<Entry> children;
}

List<String> ttf = [
  "man1",
  "man2",
  "man3",
  "man4",
  "man5",
  "man6",
  "man7",
  "man8",
  "man9",
  "man10",
  "man11",
  "man12",
  "man13",
  "man14",
  "man15"
];

////////////////////// REGEX IN FLUTTERsh.................///////////////

/*
RegExp exp = new RegExp(r"(\w+)");
// Find the Card number in string
 
String str = "Parse my string";
//use func firstMatch to get first matching String 
Iterable<Match> matches = exp.allMatches(str);


if (matches == null) {
    print("No match");
} else {
    
    // group(0) => full matched text
    // if regex had groups. groups can be extracted 
    // using group(1), group(2)...
    final matchedText = matches.elementAt(1).group(0);
    print(matchedText); // my
}
*/

List<Map<String, dynamic>> Authority = StatAuth;
List<Map<String, dynamic>> All_Sir;

class EntryItem extends StatefulWidget {
  const EntryItem(this.entry);

  final Entry entry;

  @override
  _EntryItemState createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return Container(
        // color: Colors.amber,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: 100,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                    image: imgretOrsomeThingELse(root),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: .6,
                      )
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(250, 260, 214, 243),
                        Color.fromARGB(0, 226, 176, 185)
                      ],
                      begin: Alignment(.1, 2.5),
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: ListTile(
                        title: Center(
                          child: Text(
                            root.title,
                            style: TextStyle(
                              fontFamily: ttf[2],
                              fontSize: 25,
                            ),
                          ),
                        ),
                        /////////////////////////////////////////////////////////////////////////////
                        /////////////////////////////////////////////////////////////////////////////
                        ///                        ONTAP...............................................
                        onTap: () {
///////////////////////////////
////////////////////////// main division for all main catagories stays here...
///////////////////////////////////

                          if (root.title == "About-Ruet") {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return aboutBuild(
                                data: Authority[53]['OverView'],
                                data2: Authority[53]['history'],
                              );
                            }));
                          } else if (root.title == "List of hilidays") {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return noticeLoader(
                                  'https://www.ruet.ac.bd/page/holidays', 0);
                            }));
                          } else if (root.title == "Notice") {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return noticeLoader(
                                  'https://www.ruet.ac.bd/notice', 1);
                            }));
                          } else if (root.title == "All-Teachers") {
                            print('sirs printes.........');

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return secondaryListPrint(
                                  title: "Teachers",
                                  lists: allSir,
                                  posInMainList: int.parse(root.url));
                            }));
                          } else if (root.title == 'Vice-Chancellor') {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return teacherMainstramInfo(
                                title: allSir[0]['name'],
                                lists: allSir[0],
                              );
                            }));
                          } else if (root.title == 'Chancellor') {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return aboutBuild(
                                data: "mannerMAn",
                              );
                            }));
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              List<Map<String, dynamic>> lsts =
                                  Authority[int.parse(root.url)]['selection2'];

                              return secondaryListPrint(
                                  title: Authority[int.parse(root.url)]['name'],
                                  lists: lsts,
                                  posInMainList: int.parse(root.url));
                            }));
                          }
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(7),
      child: Container(
        //  height: 100,
        decoration: BoxDecoration(
          // color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(17)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(250, 260, 214, 243),
              Color.fromARGB(250, 250, 172, 168)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        //  color: Colors.amber,
        child: ExpansionTile(
          backgroundColor: Colors.black45,
          key: PageStorageKey<Entry>(root),
          title: Center(
            child: Text(
              root.title,
              style: TextStyle(
                fontFamily: ttf[2],
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          children: root.children.map(_buildTiles).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.entry);
  }

  imgretOrsomeThingELse(Entry root) {
    String path = 'asset/';
    if (int.parse(root.url) <= 48 && int.parse(root.url) >= 31) {
      path += root.url + '.jpg';

      return new DecorationImage(
        image: new AssetImage(path),
        fit: BoxFit.cover,
      );
    } else {
      return new DecorationImage(
        image: new AssetImage('asset/' + '123' + '.jpg'),
        fit: BoxFit.fill,
      );
    }
  }
}
