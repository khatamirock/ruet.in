import 'package:web_scraper/web_scraper.dart';
import 'package:shimmer/shimmer.dart';

class NoticeHttp {
  String urls;
  int pos_for_recog;
  NoticeHttp(this.urls, this.pos_for_recog);

  String api = "api_key=88c698c922f63ff8bafc7e1ad776ec35";
  String base = "https://api.themoviedb.org/3/movie";
  String upcomn = "/upcoming?";
  final String urlLanguage = "&language=en-US";
  String respoce;
  List<Map<String, dynamic>> titles;
  List<Map<String, dynamic>> date;
  final webScraper = WebScraper('https://webscraper.io');

  Future<List<Map<String, dynamic>>> getUpcoming() async {
    // List<Map<String, dynamic>> lst;
    // var prs = parse(res.body);
    // List<Element> elms = prs.querySelectorAll("a");
    // // print(elms[2].text);
    // print(elms.length);

    // for (var elm in elms) {
    //   print(elm.text);
    // }

    final webScraper = WebScraper(urls);
    print("start");
    if (await webScraper.loadWebPage('/')) {
      //     webScraper.getElement('div.team-content > span.post', ['']);
      date = webScraper.getElement('.card-body .notice_date_time', ['title']);
      if (pos_for_recog == 1) {
        titles = webScraper.getElement('h5.font_weight500> a', ['href']);
        for (int i = 0; i < date.length; i++) {
          date[i]['title'] = date[i]['title'].replaceAll("\n", "");

          ///    titles[i]['title'] = date[i]['title'] + "  " + titles[i]['title'];
        }
      } else
        titles = webScraper.getElement('tr', ['href']);

      return titles;
      // print(date.length);
    }
  }
}
