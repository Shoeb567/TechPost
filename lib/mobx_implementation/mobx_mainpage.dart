import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tech_post_app/mobx_implementation/counter.dart';

class Mobx_HomePage extends StatelessWidget {
//  Mobx_HomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _Mobx_HomePageState createState() => _Mobx_HomePageState();
//}
//
//class _Mobx_HomePageState extends State<Mobx_HomePage> {
  CounterStore _counter = CounterStore();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobex Homepage',
          style: TextStyle(
              fontWeight: FontWeight.bold),),

        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
           // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
              child: TextField(
                 controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'You have pushed the button this many times:',
          style: TextStyle(
              fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _counter.increment();
                  },
                  child: Text('Increment',
                    style: TextStyle(
                        fontWeight: FontWeight.bold),),
                ),
                Observer(
                  builder: (context) {
                    return Text(
                      '${_counter.counter}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                        fontSize: 25
                      ),

                      // '0',

                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    _counter.decrement();
                  },
                  child: Text('Decrement',
                    style: TextStyle(
                        fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            SizedBox(height: 15),
            Observer(
              builder: (context) {
                // print('Like Design');
                return Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width:50,
                        child: IconButton(

                          onPressed: () {
                            //  setState(() {
                            //  isLikedButton = isLikedButton == true ? false : true;
                            _counter.onLikeButtonTapped(_counter.isLikedButton);
                            //   });
                          },
                          icon: Icon(
                            _counter.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _counter.isLiked ? Colors.red : Colors.black,
                            size: 20,
                          ),
                        ),
                      ),

                      Container(
                        width:80,
                        child: Text(
                          '${_counter.isLikeString}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],

                );
              },
            )
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          //todo code
//          _counter.increment();
//        },
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}