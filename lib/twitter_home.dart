import "package:flutter/material.dart";
import "package:flutter/services.dart";

class TwiterHome extends StatefulWidget {
  @override
  _TwiterHomeState createState() => _TwiterHomeState();
}

class _TwiterHomeState extends State<TwiterHome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    // ignore: file_names
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Text(
                      "S",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Image.asset("images/Twitter Logo.png"),
                  Image.asset("images/Feature stroke icon.png"),
                ])),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.markunread_outlined),
              label: "",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
