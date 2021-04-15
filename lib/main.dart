import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage() ,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tech Post"),
        centerTitle: true,
      ),
      body: Container(

        child: Column(
          children: [
            Center(
                child: Text(
                    "Hello World"
                )),
            Center(
                child: Text(
                    "Shoeb Shaikh"

                )),
          ],
        ),
      ),
    );
  }
}

