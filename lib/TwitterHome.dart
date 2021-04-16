import "package:flutter/material.dart";
import "package:flutter/services.dart";
class TwitterHome extends StatefulWidget {
  @override
  _TwitterHomeState createState() => _TwitterHomeState();
}

class _TwitterHomeState extends State<TwitterHome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               CircleAvatar(
                backgroundColor: Colors.black,
                child: Text("S",style: TextStyle(color: Colors.white),),
              ),
              Image.asset("images/Twitter Logo.png"),
              Image.asset("images/Feature stroke icon.png"),
            ])),
        body: Container(),
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home  ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search ),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              title: Text(""),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.markunread_outlined),
              title: Text(""),
            ),
          ],
          //currentIndex: index,
//         onTap: (int i){setState((){index = i;});},
//         fixedColor: Colors.white,
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            onPressed: (){}
        )
    );
  }
}
