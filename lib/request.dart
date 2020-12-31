import 'package:web_scraper/web_scraper.dart';

class HttpHelper {
  String urls;
  HttpHelper(this.urls);

  String api = "api_key=88c698c922f63ff8bafc7e1ad776ec35";
  String base = "https://api.themoviedb.org/3/movie";
  String upcomn = "/upcoming?";
  final String urlLanguage = "&language=en-US";
  String respoce;
  List<Map<String, dynamic>> productNames;
  List<Map<String, dynamic>> productDescriptions;
  final webScraper = WebScraper('https://webscraper.io');

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper
        .loadWebPage('/test-sites/e-commerce/allinone/computers/laptops')) {
      // getElement takes the address of html tag/element and attributes you want to scrap from website
      // it will return the attributes in the same order passed
      productNames = webScraper.getElement(
          'div.thumbnail > div.caption > h4 > a.title', ['href', 'title']);
      productDescriptions = webScraper
          .getElement('div.thumbnail > div.caption > p.description', ['class']);
      print(productDescriptions);
      // for (int i = 0; i < productNames.length; i++) {
      //   print(productNames[i]['attributes']);
      //   //    print(productNames[i]['href']);
      //   //     print(productDescriptions[i]['title']);
      // }
    }
  }

  Future<List<Map<String, dynamic>>> getUpcoming(String attr) async {
    // List<Map<String, dynamic>> lst;
    // var prs = parse(res.body);
    // List<Element> elms = prs.querySelectorAll("a");
    // // print(elms[2].text);
    // print(elms.length);

    // for (var elm in elms) {
    //   print(elm.text);
    // }
    print("above");
    final webScraper = WebScraper(urls);
    print("start");
    if (await webScraper.loadWebPage('/')) {
      // productNames =
      //     webScraper.getElement('div.team-content > span.post', ['']);
      // productDescriptions =
      //     webScraper.getElement('div.team-content > h3.title >a', ['title']);
      productNames = webScraper.getElement(attr, ['href']);

      print(productNames);

      // for (int i = 0; i < productNames.length; i++) {
      //   // print(productNames[i]['attributes']['href']);
      //   print(productNames[i]['title']);
      //   //     print(productDescriptions[i]['title']);
      // }
      return productNames;
      // print(productDescriptions.length);
    }
  }
}
