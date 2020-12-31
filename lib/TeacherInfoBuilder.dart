import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql2/list.dart';
import 'package:url_launcher/url_launcher.dart';

class teacherMainstramInfo extends StatefulWidget {
  //We want to extract ages from the following string:

  teacherMainstramInfo({this.title, this.lists});
  String title;
  Map<String, dynamic> lists;
  @override
  _teacherMainstramInfoState createState() => _teacherMainstramInfoState();

  //////////////////////////////
  /// BOTTOM MENU BAR.......................

}

final _kTabs = <Tab>[
  Tab(icon: Icon(Icons.info_outline), text: "Details"),
  Tab(icon: Icon(Icons.contacts), text: "List-of-all-VC's"),
];

class _teacherMainstramInfoState extends State<teacherMainstramInfo> {
  String str1;
  RegExp phnRg = new RegExp(r' *Phone:( *\w+-\w+(-\w+)*)');

  RegExp mailRg = new RegExp(r' *Email: *(.*).com');

  Iterable allMatches;
  var matchCount = 0;

  int _selectedIndex = 0;

  String phone;

  String mail = "-";

  String base_url = 'https://www.ruet.ac.bd';

  @override
  Widget build(BuildContext context) {
    str1 = widget.lists['fullDat'];
    allMatches = mailRg.allMatches(str1);

    allMatches.forEach((match) {
      // print('Match ${matchCount}: ' + str1.substring(match.start, match.end));
      mail = match.group(0);
      print(mail);
    });
    int lll = widget.lists['resrc'].length;

    var xxx = List.generate(lll, (index) {
      return ListTile(title: Text(widget.lists['resrc'][index]['resrc']));
    }).toList();
    //  Entry('REsearch', '123', xxx);
    var xx = ListView.builder(
        //  padding: const EdgeInsets.all(8),
        itemCount: widget.lists['resrc'].length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: widget.lists['resrc'][index]['resrc']);
        });

    allMatches = phnRg.allMatches(str1);

    allMatches.forEach((match) {
      // print('Match ${matchCount}: ' + str1.substring(match.start, match.end));
      phone = match.group(1);
      print(phone);
    });
    ///////////////////////////////////
    if (mail == null) {
      mail = "mail isnt available";
    }
    if (phone == null) {
      phone = "phone isnt available";
    }

    ////////////////////////////////
    ///
    return forViceChan_and_others();
  }

  /////////////////////////////////////////////////
  ///
  ///       the main list...............................
  ///

  mainInfoBuild() {
    return Stack(
      ///////// for making the info button at the top..
      ///
      children: <Widget>[
        ListView(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  // color: Colors.teal,
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 7.0, // soften the shadow
                      spreadRadius: 10.0, //extend the shadow
                      offset: Offset(
                        12.0, // Move to right 10  horizontally
                        9.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(250, 204, 43, 94),
                      Color.fromARGB(250, 117, 58, 136),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        launch(widget.lists['sirLink-href']);
                      },
                      child: CircleAvatar(
                        radius: 77,
                        backgroundColor: Color(0xffFDCF09),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              base_url + widget.lists['image-src']),
                          radius: 70,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Center(
                        child: Text(
                          widget.lists['name'],
                          style: TextStyle(
                              fontFamily: ttf[2],
                              fontSize: 30,
                              letterSpacing: 2.5,
                              wordSpacing: 5),
                        ),
                      ),
                      subtitle: Center(child: Text(widget.lists['nameBn'])),
                    ),
                    Text(
                      widget.lists['pos'],
                      style: TextStyle(
                          fontFamily: ttf[6],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
              ///    color: Colors.amber[200],
              child: Column(
                children: <Widget>[
                  Center(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'Phone: ' + phone,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: ttf[11]),
                        ),
                      ),
                      onTap: () {
                        launch("tel://$phone");
                        print("mannerITs the name");
                      },
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text(mail)),
                    onTap: () {
                      launch("mailto:$mail?subject=Untitled");
                    },
                  ),
                  /////////////
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.teal,

                      gradient: LinearGradient(
                        colors: [
                          // Colors.amber,

                          Color.fromARGB(230, 172, 98, 111),
                          Color.fromARGB(10, 172, 98, 111)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        widget.lists['joins'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  // Text(xxx[0].title),
                  ////// RESEARCH>>>>>>>>>>>>>>>>>

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'ResearchField',
                      style: TextStyle(
                          fontFamily: ttf[14],
                          fontSize: 23,
                          color: Colors.orange),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                    thickness: 1.4,
                  ),
                  Column(
                    children:
                        List.generate(widget.lists['resrc'].length, (index) {
                      return ListTile(
                        leading: Icon(Icons.star),
                        title: Text(
                          widget.lists['resrc'][index]['resrc'],
                          style: TextStyle(
                            fontFamily: ttf[11],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      );
                    }).toList(),
                  ),
                  ///// EDU>........>>>>>>>>
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      'Educational History',
                      style: TextStyle(
                          fontFamily: ttf[14],
                          fontSize: 23,
                          color: Colors.brown),
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                    thickness: 1.4,
                  ),
                  Column(
                    children:
                        List.generate(widget.lists['edu'].length, (index) {
                      return ListTile(
                        leading: Icon(Icons.school),
                        title: Text(
                          widget.lists['edu'][index]['edu'],
                          style: TextStyle(
                            fontFamily: ttf[11],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {},
                      );
                    }).toList(),
                  ),
                  // ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                String url = widget.lists['g_schlr-href'];
                launch(url);
                //  print(widget.lists['g_schlr-href']);
              },
            ),
          ],
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0 what???: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  _buildBar(BuildContext context) {
    if (widget.title == 'Dr. Md. Rafiqul Islam Sheikh')
      return new AppBar(
        backgroundColor: Colors.purple,
        // Color.fromRGBO(64, 75, 96, .9),
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        elevation: 0,
        bottom: TabBar(
          tabs: _kTabs,
        ),
      );
    else
      return AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Text(widget.title),
      );
  }

  slimycar() {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(Authority[52]['selection2'].length, (index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(Authority[52]['selection2'][index]['Image']),
              radius: 30,
            ),
            title: Text(
              Authority[52]['selection2'][index]['name'],
              style: TextStyle(
                fontFamily: ttf[2],
                fontSize: 22,
                //fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              Authority[52]['selection2'][index]['post'] +
                  "\nfrom " +
                  Authority[52]['selection2'][index]['date'],
              style: TextStyle(
                fontFamily: ttf[2],
                fontSize: 17,
                wordSpacing: 4,
                letterSpacing: 2,
                //fontWeight: FontWeight.bold
                //fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          );
        }).toList(),
      ),
    );
    // return Center(child: Text('History please....'));
  }

  forViceChan_and_others() {
    final _kTabPages = <Widget>[
      mainInfoBuild(),
      slimycar(),
    ];
    final _kTabPages2 = <Widget>[
      mainInfoBuild(),
      mainInfoBuild(),
    ];

    if (widget.title == 'Dr. Md. Rafiqul Islam Sheikh') {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: _buildBar(context),
          body: TabBarView(
            children: _kTabPages,
          ),
        ),

        //  mainInfoBuild(),
      );
    } else
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(250, 204, 43, 94),
          elevation: 0,
          title: Text(widget.title),
        ),
        body: mainInfoBuild(),
      );
  }
}
