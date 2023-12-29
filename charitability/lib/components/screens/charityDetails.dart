import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class charityDetails extends StatefulWidget {
  static const String id = 'charitypage';
  @override
  State<StatefulWidget> createState() => new _charityDetailsState();
}

class _charityDetailsState extends State<charityDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.showSnackBar(const SnackBar(
                      content: const Text('Implement a sharing function')));
                }),
          ],
        ),
        body: new Scaffold(
          key: _scaffoldKey,
          body: _postCardView(),
        ),
      );

  Widget _postCardView() {
    return SingleChildScrollView(
      child: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new Text(
              "Senior Corps",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            new Padding(
              padding: new EdgeInsets.symmetric(vertical: 10.0),
              child: new Divider(
                height: 1.0,
                color: Colors.black,
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.access_time,
                  color: Colors.grey,
                ),
                new Padding(
                  padding: new EdgeInsets.symmetric(horizontal: 10.0),
                  child: new Text("24 hours"),
                )
              ],
            ),
            new Container(
                width: double.infinity,
                height: 150.0,
                margin: new EdgeInsets.all(10.0),
                child: Image.asset("images/scorps.jpg")),
            new Text(
              "Senior Corps is an organization of seniors ages 55 and up. The organization connects these seniors with people and organizations in their community that need them most. The organization feels that seniors have a lot of experience and expertise to share and look to them to become mentors, coaches or companions. The areas where senior citizens can help include:",
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            new Text(
              "The Senior Companion Program",
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            new Text(
              "The Foster Grandparent Program",
              style: new TextStyle(
                fontSize: 16.0,
              ),
            ),
            new Container(
              height: 40,
            ),
            new Text("Mobile Number : 9102345677"),
            new Container(
              margin: new EdgeInsets.only(top: 20.0),
              child: new RaisedButton(
                onPressed: _launchUrl,
                child: new Text(
                  "Visit Website",
                  style: new TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).accentColor,
                splashColor: Colors.deepOrangeAccent,
              ),
            )
          ],
        ),
      ),
    );
  }

  // String getFormattedTime() {
  //   var timeStamp = new DateTime.fromMillisecondsSinceEpoch(post.timeStamp);
  //   var formatter = new DateFormat('dd MMM, yyyy. HH:mm');
  //   return formatter.format(timeStamp);
  // }

  void _launchUrl() async {
    String url = "https://americorps.gov/serve/americorps-seniors";
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text('Cannot launch "$url"')));
    }
  }
}
