import 'package:flash_chat/components/screens/ArticleCard.dart';
import 'package:flash_chat/components/screens/NewsList.dart';
import 'package:flutter/material.dart';

class CategoryNews extends StatefulWidget {
  static const String id = 'categorynews';
  final String newsCategory;

  CategoryNews({this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleCard> newlist;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  void getNews() async {
    List<ArticleCard> newslist = new List();
    newslist.add(ArticleCard("Adani's donation", "images/news.jpg",
        "Adani's family to donate 60K crores to charity", "something"));
    newslist.add(ArticleCard(
        "Unpaid, voluntary blood donation saves countless lives",
        "images/blooddon.png",
        "World Blood Donor Day takes place on 14 June each year to raise global awareness of the need for safe blood and blood products for transfusion and highlight the critical contribution made by unpaid, voluntary blood donors",
        "Blood and blood products are live-saving resources not just for emergencies, accidents and surgical procedures, but also for the management of medical disorders, such as the bleeding associated with pregnancy and childbirth, childhood anaemia, and transfusions for patients with blood and bone marrow disorders, inherited disorders of haemoglobin and immune-deficiency conditions.The theme for World Blood Donor Day 2022 is Donating blood is an act of solidarity. Join the effort and save lives. The need for blood is universal, but access to safe blood for everyone who needs it remains a challenge worldwide. Voluntary and unpaid blood donation made regularly can help overcome blood shortages."));
    newslist.add(ArticleCard(
        "Emotional support for elderly in MoC focus",
        "images/missionary.jpg",
        "",
        "The Missionaries of Charity (MoC), under the leadership of s ..Read more at: http://timesofindia.indiatimes.com/articleshow/90407223.cms?utm_source=contentofinterest&utm_medium=text&utm_campaign=cppst"));
    newslist.add(ArticleCard(
        "Help Senior Citizens", "images/news.jpg", "", "something"));
    newlist = newslist;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff39c3e7),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Charity",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.share,
                )),
          )
        ],
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: newlist.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imgUrl: newlist[index].image ?? "",
                          title: newlist[index].cardTitle ?? "",
                          desc: newlist[index].summary ?? "",
                          content: newlist[index].context ?? "",
                        );
                      }),
                ),
              ),
            ),
    );
  }
}
