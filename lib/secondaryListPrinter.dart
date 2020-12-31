import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql2/TeacherInfoBuilder.dart';
import 'package:sql2/allSirs.dart';
import 'package:sql2/list.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:sql2/test.dart';
import 'allSirs.dart';
import 'TeacherInfoBuilder.dart';
import 'statuaryAuth.dart';
import 'list.dart';

class secondaryListPrint extends StatefulWidget {
  static RegExp exp = new RegExp(r"(prof.)* (Dr)* (Md)* (\w+) (\w+)");
// Find the Card number in string

  static String str; // = "Parse my string";

  static Iterable<Match> matches; // = exp.allMatches(str);

  secondaryListPrint(
      {Key key,
      @required this.title,
      @required this.lists,
      @required this.posInMainList});
  List<Map<String, dynamic>> lists;
  int posInMainList;
  String title;

  @override
  _secondaryListPrintState createState() => _secondaryListPrintState();
}

final _kTabs = <Tab>[
  Tab(icon: Icon(Icons.assignment), text: "About"),
  Tab(icon: Icon(Icons.contacts), text: "Lists"),
];
final _kTabs2 = <Tab>[
  Tab(icon: Icon(Icons.cloud), text: "Inspire"),
];

class _secondaryListPrintState extends State<secondaryListPrint> {
  String titleOflist = "-";
  String base_url = 'https://www.ruet.ac.bd';
  String subTl = "-";
  List<Map<String, dynamic>> lists_for_search;
  String SecOfWork_for_office_Admins = "-";
  PageController controller;
  String detail;
  int len;
  String imgSource;
  int currentpage = 0;
  @override
  void initState() {
    // TODO: implement initState
    len = widget.lists.length;
    lists_for_search = widget.lists;
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.5,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ifelseRet_for_TheDept_detail_and_list();

    //  Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //     actions: <Widget>[
    //       //  appBarInfoBuilder(),
    //     ],
    //   ),
    //   body: searchRet(),

    //   //OrdRet(),
    // );
  }

  searchRet() {
    return FloatingSearchBar.builder(
      itemCount: len,
      itemBuilder: (BuildContext context, int index) {
        //    imgSource = base_url;
        titleOflist = widget.lists[index]['name'];
        //   imgSource=////////////////////////////////////////////
        int x = 0;

        imgSourceFinder(index);
        regXprinter(titleOflist);
        if (widget.lists[index]['pos'] != null)
          subTl = widget.lists[index]['pos'];

        return Stack(
          children: <Widget>[
            /////////////////// grid for the Dept_________
            ///
            // Container(
            //   child: retrnGriview(),
            // ),

            Card(
              //////////////////////////////////////////////////////////
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                ////////////////////////////////////////////////////////////

                child: ListTile(
                  leading: circlrAV(),
                  title: Text(
                    titleOflist,
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                  subtitle: Text(subTl + " "),
                  onTap: () {
                    ///// everyOne.....if mainSir list contains that from this lsit.....
                    sirMainDeatil(index);
                  },
                ),
              ),
            ),
            ////////////////////////
            ///   IF YOU WANT TO MAKE IMAGE POP------- OUT............
            ////    circlrAV(),
          ],
        );
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
        var filter = lists_for_search.where((test) {
          var x = test['name'].toLowerCase();
          return x.contains(value);
        }).toList();

        setState(() {
          len = filter.length;
          widget.lists = filter;
        });
      },

      /// on tap personalities......................////////////
      ///
      onTap: () {},
      decoration: InputDecoration.collapsed(
          hintText: "Search...",
          enabled: true,
          hoverColor: Colors.amber,
          focusColor: Colors.lightBlue),
    );
  }

  void regXprinter(String datForReg) {
    ///  String str1;

    //Declaring a RegExp object with a pattern that matches sequences of digits
    //   RegExp phnRg = new RegExp(r' *Phone: *\w+-\w+(-\w+)*');
    // RegExp mailRg = new RegExp(
    //     r'  *(.*) *Head (.*) (\d{6,12}) *(\w+@.*)* *(\d{6,12})* *(.*)');

    /////......................................
    RegExp reg1 = new RegExp(r' *(.*) *Dean (.*)? *(\d{11,12})+ *(\w+@.*)*');

    /// from dartPad............................................

    Match allMatches;
    var matchCount = 0;

    allMatches = reg1.firstMatch(datForReg);

    //print(allMatches);
    if (allMatches != null) {
      print('name ' + allMatches.group(1));
      print('dept' + allMatches.group(2));
      print('phone' + allMatches.group(3));
      // print('phone' + allMatches.group(4));
      print('\n\n');
    }
  }

  appBarInfoBuilder() {
    if (widget.posInMainList > 31) {
      return Text("manner");
    }
  }

  void sirMainDeatil(int index) {
    if (widget.posInMainList >= 0) {
      String value = widget.lists[index]['name'];
      int x = 0;
      for (int i = 0; i < allSir.length; i++) {
        if (value.startsWith(allSir[i]['name'])) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return teacherMainstramInfo(
              title: value,
              lists: allSir[i],
            );
          }));
          x = 1;
          break;
          /////////////////////////
          ///

        }
      }
      if (x == 0) {
        for (int i = 0; i < allSir.length; i++) {
          if (value.contains(allSir[i]['name'])) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return teacherMainstramInfo(
                title: value,
                lists: allSir[i],
              );
            }));
            x = 1;
            break;
            /////////////////////////
            ///

          }
        }
      }
    }
  }

  void imgSourceFinder(int index) {
    int x = 0;
    //  print("..................................\n");
    print(widget.lists[index]['image']);

    if (widget.lists[index]['image'] == null) {
      for (int i = 0; i < allSir.length; i++) {
        if (titleOflist.startsWith(allSir[i]['name'])) {
          imgSource = allSir[i]['image-src'];
          //  print(imgSource);

          //  imgSource = imgSource;
          x = 1;
          break;
          /////////////////////////
          ///

        }
      }
      if (x == 0) {
        for (int i = 0; i < allSir.length; i++) {
          if (titleOflist.startsWith(allSir[i]['name'])) {
            imgSource = allSir[i]['image-src'];

            break;
          }
        }
      }
    } else {
      imgSource = widget.lists[index]['image'];
    }
  }

  circlrAV() {
    if (imgSource == null) {
      imgSource = "abcdefghik.jpg";
      base_url = "fdsdfsdf.jpg";
    }

    if (widget.posInMainList > 30 || widget.posInMainList < 12)
      return CircleAvatar(
        backgroundImage: NetworkImage(base_url + imgSource),
        radius: 30,
      );
    else
      return Text('no image!');
    //   CircleAvatar(child: Image.network(base_url + imgSource));
  }

  abou_details_fordeptsonly() {
    if (widget.posInMainList >= 31 && widget.posInMainList <= 48) {
      return Container(
        color: Colors.lightBlue[50],
        child: SingleChildScrollView(
          child: info_of_counting_of_sirs(),
        ),
      );
    } else
      return Text('what??');
  }

  deckCards() {
    return Center(
      child: new Container(
        color: Colors.brown,
        child: new PageView.builder(
            onPageChanged: (value) {
              currentpage = value;
            },
            controller: controller,
            itemBuilder: (context, index) => builder(index)),
      ),
    );
  }

  builder(int index) {
    return new AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return new Center(
          child: new SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 750,
            child: child,
          ),
        );
      },
      child: new Container(
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    if (widget.posInMainList >= 31 && widget.posInMainList <= 48)
      return new AppBar(
        //backgroundColor: Colors.black12,
        //
        backgroundColor: Color.fromRGBO(250, 50, 75, 37),
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        bottom: TabBar(
          tabs: _kTabs,
        ),
      );
    else
      return AppBar(
        backgroundColor: Color.fromRGBO(250, 50, 75, 37),
        title: Text(widget.title),
      );
  }

  ifelseRet_for_TheDept_detail_and_list() {
    final _kTabPages = <Widget>[
      abou_details_fordeptsonly(),
      searchRet(),
    ];
    final _kTabPages2 = <Widget>[
      searchRet(),
    ];
    if (widget.posInMainList >= 31 && widget.posInMainList <= 48)
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: _buildBar(context),
          body: TabBarView(
            children: _kTabPages,
          ),
        ),
      );
    else
      return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: _buildBar(context),
          body: TabBarView(
            children: _kTabPages2,
          ),
        ),
      );
  }

  info_of_counting_of_sirs() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: multipleRet_for_convenience(0, Colors.pink[500]),
            ),
            Expanded(
              child: multipleRet_for_convenience(1, Colors.cyan),
            ),
            Expanded(child: multipleRet_for_convenience(2, Colors.yellow)),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(child: multipleRet_for_convenience(3, Colors.blueGrey)),
            Expanded(child: multipleRet_for_convenience(4, Colors.blue)),
          ],
        ),
        Divider(
          thickness: 2,
        ),
        Text(
          Authority[widget.posInMainList]['about'],
          style: TextStyle(fontFamily: "man3", fontSize: 25),
        ),
      ],
    );
  }

  multipleRet_for_convenience(int pos, Color clr) {
    return Container(
      height: 120,
      //  width: 80,
      child: Card(
          elevation: 3,
          color: clr,
          child: Center(
            child: Text(
              Authority[widget.posInMainList]['infoofdept'][pos]['name'],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'man1',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
