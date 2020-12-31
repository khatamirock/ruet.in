import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sql2/secondaryListPrinter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'request.dart';

import 'noticeHTTPreqPROTO.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class noticeLoader extends StatefulWidget {
  noticeLoader(this.url, this.notice_or_Holidy);
  String url;
  int notice_or_Holidy;
  @override
  _noticeLoaderState createState() => _noticeLoaderState();
}

class _noticeLoaderState extends State<noticeLoader> {
  NoticeHttp htp;
  List<Map<String, dynamic>> NoticeLists;
  List<Map<String, dynamic>> dates;
  @override
  void initState() {
    // htp = new NoticeHttp('https://www.ruet.ac.bd/notice');
    // print("manner");
    asncProcs(widget.url);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: notice_HolidayBar(),
        body: ListView.builder(
            itemCount: NoticeLists == null ? 0 : NoticeLists.length,
            itemBuilder: (BuildContext context, int postion) {
              return Card(
                color: Colors.blue[400],
                child: ListTile(
                  title: Text(
                    NoticeLists[postion]['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'man1',
                    ),
                  ),
                  subtitle: forNotice(postion),
                  onTap: () {
                    String url = NoticeLists[postion]['attributes']['href'];
                    print(url);

                    launch(url);
                    //  launch("http://m.me/ronin.returns");
                  },
                ),
              );
            }));
  }

  Future asncProcs(String urls) async {
    htp = new NoticeHttp(urls, widget.notice_or_Holidy);

    List<Map<String, dynamic>> lst;

    lst = await htp.getUpcoming();
    setState(() {
      dates = htp.date;
      NoticeLists = lst;
    });
  }

  Widget buldsTHenotice() {
    return secondaryListPrint(
        title: 'fd', lists: NoticeLists, posInMainList: 33);
    // SingleChildScrollView(
    //   child: Column(
    //     children: List.generate(NoticeLists.length, (index) {
    //       return ListTile(
    //         title: Text(
    //           NoticeLists[index]['title'],
    //           style: TextStyle(
    //             fontFamily: 'man1',
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         onTap: () {},
    //       );
    //     }).toList(),
    //   ),
    // );
  }

  notice_HolidayBar() {
    String tit;
    if (widget.notice_or_Holidy == 0) {
      tit = 'Holidays';
    } else
      tit = 'notice';
    return AppBar(
      // backgroundColor: Colors.purple,
      // Color.fromRGBO(64, 75, 96, .9),
      automaticallyImplyLeading: false,
      title: Text(tit),
      elevation: 0,
    );
  }

  forNotice(int pos) {
    if (widget.notice_or_Holidy == 0) {
      return Text("");
    } else
      return Text(htp.date[pos]['title']);
  }
}
