import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/screens/CategoryNews.dart';
import 'package:flash_chat/components/screens/clothes.dart';
import 'package:flash_chat/components/screens/education.dart';
import 'package:flash_chat/components/screens/ehelp.dart';
import 'package:flash_chat/components/screens/health.dart';
import 'package:flash_chat/components/screens/planetcard.dart';
import 'package:flash_chat/components/screens/seniorpage.dart';
import 'package:flash_chat/components/screens/welcomescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article.dart';

class mycards extends StatefulWidget {
  static const String id = 'mycards';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mycardsState();
  }
}

class mycardsState extends State<mycards> {
  List<Widget> cardList = new List();

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardList = _generateCards();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff39c3e7),
      appBar: AppBar(
        backgroundColor: Color(0xff39c3e7), //Theme.of(context).accentColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.home_outlined),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoryNews()));
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: Text('Do you want to logout?'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('Yes'),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();

                          Navigator.pushNamed(context, WelcomeScreen.id);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(alignment: Alignment.center, children: cardList),
    );
  }

  List<Widget> _generateCards() {
    List<PlanetCard> planetCard = new List();
    planetCard.add(
      PlanetCard("Education", "images/edu.jpg", 50.0, 6),
    );
    planetCard.add(
      PlanetCard("Blood Bank", "images/blood.jpg", 60.0, 5),
    );
    planetCard.add(
      PlanetCard("Food Donation", "images/food.jpg", 60.0, 4),
    );
    planetCard.add(
      PlanetCard("Clothes Donation", "images/clothes1.jpg", 60.0, 3),
    );
    planetCard.add(
      PlanetCard("Sanitory", "images/sanitary.png", 60.0, 2),
    );
    planetCard.add(
      PlanetCard("Senior Citizen", "images/senior.jpg", 60.0, 1),
    );

    List<Widget> cardList = new List();
    // cardList.add(Positioned(
    //   top: 10,
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 22.0),
    //     child: Container(
    //       child: Text(
    //         "Choose A Category",
    //         softWrap: true,
    //         style: GoogleFonts.acme(
    //           fontSize: 45,
    //           color: Colors.white.withOpacity(0.9),
    //         ),
    //       ),
    //     ),
    //   ),
    // ));
    for (int x = 0; x < 6; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: Draggable(
              onDragEnd: (drag) {
                removeCards(x);
              },
              childWhenDragging: Container(),
              feedback: GestureDetector(
                onTap: () {
                  print("Hello All");
                },
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  // color: Color.fromARGB(250, 112, 19, 179),
                  child: Column(
                    children: <Widget>[
                      Hero(
                        tag: "imageTag",
                        child: Image.asset(
                          planetCard[x].cardImage,
                          width: 320.0,
                          height: 440.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          planetCard[x].cardTitle,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      // ignore: missing_return
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    switch (planetCard[x].number) {
                      case 1:
                        return SeniorPage();
                        break;
                      case 2:
                        return Article();
                        break;
                      case 3:
                        return Clothes();
                        break;
                      case 4:
                        return Ehelp();
                        break;
                      case 5:
                        return Health();
                        break;
                      case 6:
                        return Education();
                        break;
                    }
                    ;
                  }));
                },
                child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // color: Color.fromARGB(250, 112, 19, 179),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            image: DecorationImage(
                                image: AssetImage(planetCard[x].cardImage),
                                fit: BoxFit.cover),
                          ),
                          height: 480.0,
                          width: 320.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            planetCard[x].cardTitle,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.purple,
                            ),
                          ),
                        )
                      ],
                    )),
              )),
        ),
      );
    }

    return cardList;
  }
}
