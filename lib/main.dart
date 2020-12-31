import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sql2/my_about.dart';
import 'package:url_launcher/url_launcher.dart';

import 'about.dart';
import 'noticeRequest.dart';
import 'request.dart';
import 'dataHelper.dart';

import 'package:floating_search_bar/floating_search_bar.dart';

///import 'package:shared_preferences/shared_preferences.dart';
import 'databaseHelper.dart';
import 'about_app.dart';
import 'list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ruet.In'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String substitute = "";
  String baseurl = 'ruet.ac.bd';
  HttpHelper htp;
  DbHelper sqd;
  int lng;
  list mainPageSelection;
  List<Map<String, dynamic>> mainTitle;
  List<Entry> pageList;
  List<Entry> pageList_forSearch;
  //var filter;
  int _counter = 0;
  int len;
  Color fullBosyColor = Colors.blue[50];
  List filter;
  @override
  void initState() {
    sqd = new DbHelper();
    mainPageSelection = new list();
    pageList = mainPageSelection.sdf;
    len = pageList.length - 23;

    //len = xxx.length;
    filter = pageList;
    pageList_forSearch = pageList;
    //lng = pageList.length;
    // sqd.testDb();
    // TODO: implement initState
    // htp = new HttpHelper('https://www.ruet.ac.bd');
    // print("manner");
    // asncProcs('https://www.ruet.ac.bd', 'a');
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      //   _counter++;
    });
  }

  final drawerItem = Container(
    child: ListView(
      children: <Widget>[
        _createHeader(),
        ListTile(
          title: Text('ALL Sir'),
          subtitle: Text('canner'),
        ),
        ListTile(
          title: Text('manner2'),
          subtitle: Text('canner2'),
        ),
        ListTile(
          title: Text('manner3'),
          subtitle: Text('canner3'),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    // testData();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Builder(
                  builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: SvgPicture.asset(
                      "asset/menu.svg",
                      height: 25,
                      //color: Colors.amber,
                      width: 34,
                    ),
                  ),
                )),
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontFamily: ttf[7],
                fontSize: 37,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        // title: Text(
        //   widget.title,
        //   style: TextStyle(
        //     color: Colors.black,
        //     fontFamily: ttf[7],
        //     fontSize: 37,
        //     //fontWeight: FontWeight.bold,
        //   ),
        // ),

        backgroundColor: fullBosyColor,
        elevation: 0,
      ),
      body: mailDragableList(),

      //  searchFloateer(),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: newChildIntown(),

        // drawerItem,
      ),
    );
  }

  void asncProcs(String urls, String attr) async {
    htp = new HttpHelper(urls);

    List<Map<String, dynamic>> lst;

    lst = await htp.getUpcoming(attr);
    setState(() {
      mainTitle = lst;
      lng = mainTitle.length;
      print(">>>>" + lng.toString());
    });
  }

  // _read() async {
  //   DatabaseHelper helper = DatabaseHelper.instance;
  //   List<Word> wrdlst;
  //   Word word;
  //   int rowId = 1;

  //   wrdlst = await helper.getall();
  //   if (wrdlst == null) {
  //     print('read row $rowId: empty');
  //   } else {
  //     for (Word x in wrdlst) {
  //       print(' row ${x.id}: ${x.word} ${x.frequency}');
  //     }

  //     //;
  //   }

  //   // for (int i = 1; i < 10; i++) {
  //   //   print(wrdlst[i].id);
  //   //   print(wrdlst[i].word);
  //   //   print(wrdlst[i].frequency);
  //   // }
  // }

  // _save() async {
  //   //no usage of any constructor .... it would be better if theres a
  //   //consructor

  //   Word word = Word();
  //   word.word = 'hello';
  //   word.frequency = 15;
  //   DatabaseHelper helper = DatabaseHelper.instance;
  //   int id = await helper.insert(word);
  //   print('inserted row: $id');
  // }

  //   Future testData() async {
  //  //   Firestore db = Firestore.instance;
  //    // var data = await db.collection('event_details').getDocuments();
  //     var details = data.documents.toList();
  //     details.forEach((d) {
  //       print(d.documentID);
  //     });
  //   }

  mailDragableList() {
    return Container(
      color: fullBosyColor,
      child: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        maxChildSize: 1,
        builder: (BuildContext context, myscrollController) {
          return Container(
            decoration: BoxDecoration(
                //     color: Colors.amber,
                borderRadius: BorderRadius.only(
                    //  topLeft: Radius.circular(40),
                    topRight: Radius.elliptical(100, 50))),
            child: Scrollbar(
              child: ListView.builder(
                ///////////////////////////////////////////////////
                controller: myscrollController,

                /// important for maling the
                ///whole list moving allOver the Screen.............
                //////////////////////////////////////////////////

                itemBuilder: (BuildContext context, int index) =>
                    EntryItem(pageList[index]),
                itemCount: len,
              ),
            ),
          );
        },
      ),
    );
  }

  newReten() {
    return FloatingSearchBar.builder(
      itemCount: len,
      itemBuilder: (BuildContext context, int index) {
        /////  print("builds");
        return EntryItem(pageList[index]);
        //   DraggableScrollableSheet(builder:(){} )
      },
      // trailing: CircleAvatar(
      //   child: Text("RD"),
      // ),
      pinned: true,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
      drawer: Drawer(
        child: Container(),
      ),

      onChanged: (String value) {
        filter = pageList_forSearch.where((test) {
          var x = test.title.toLowerCase();
          return x.startsWith(value);
        }).toList();

        setState(() {
          len = filter.length;
          if (len > 15) {
            len = 15;
          }
          pageList = filter;
        });
      },

      /// on tap personalities......................////////////
      ///
      onTap: () {},
      decoration: InputDecoration.collapsed(
          fillColor: Colors.amber,
          hintText: "Search...",
          enabled: true,
          hoverColor: Colors.amber,
          focusColor: Colors.lightBlue),
    );
  }

  Future<List<Entry>> search(String text) async {
    await Future.delayed(Duration(milliseconds: 600));

    return filter = pageList_forSearch.where((test) {
      var x = test.title.toLowerCase();
      return x.startsWith(text.toLowerCase());
    }).toList();
  }

  static Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('asset/33.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("RUET.In",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 50.0,
                      fontFamily: ttf[7],
                      fontWeight: FontWeight.bold))),
        ]));
  }

  newChildIntown() {
    return Container(
      // color: Colors.amber,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadiusDirectional.only(bottomEnd: Radius.circular(40)),
        boxShadow: [
          //background color of box
        ],
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(250, 255, 216, 155),
            Color.fromARGB(250, 25, 84, 123),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          DrawerHeader(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: Icon(
                      Icons.change_history,
                      size: 90,
                      color: Color.fromRGBO(250, 55, 76, 125),
                    ),
                    //     child: Text(
                    //   'R',
                    //   style: TextStyle(
                    //       color: Colors.black26,
                    //       fontFamily: ttf[4],
                    //       fontSize: 50),
                    // )
                  ),
                ),
                Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Text(
                    'Ruet.In',
                    style: TextStyle(fontFamily: ttf[7], fontSize: 40),
                  )),
                  // child: Image.asset(
                  //   "asset/123.jpg",
                  // )
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                var currentIndex = 3;
              });
              Navigator.of(context).pop();
            },
            child: Text(
              'Home',
              style: TextStyle(
                fontFamily: ttf[7],
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: () {
              launch('https://www.ruet.ac.bd');
            },
            child: Text(
              'RUET-WebSite',
              style: TextStyle(
                fontFamily: ttf[7],
                fontSize: 24,
                //    fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'RUET-Notice',
              style: TextStyle(
                fontFamily: ttf[7],
                fontSize: 24,
                //    fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return noticeLoader('https://www.ruet.ac.bd/notice', 1);
              }));
            },
          ),
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            child: Text(
              'About Me',
              style: TextStyle(
                  fontFamily: ttf[7],
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.amber),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return aboutme();
              }));
            },
          ),
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            child: Text(
              'About RUET',
              style: TextStyle(
                  fontFamily: ttf[7],
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.cyan),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return aboutBuild(
                  data: Authority[53]['OverView'],
                  data2: Authority[53]['history'],
                );
              }));
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Text(
              'About this App',
              style: TextStyle(
                  fontFamily: ttf[7], fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return aboutApp();
              }));
            },
          ),
          SizedBox(
            height: 45,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius:
                    BorderRadiusDirectional.only(topStart: Radius.circular(40)),
              ),
              height: 65,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'v1.0.1',
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
