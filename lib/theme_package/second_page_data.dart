import 'package:flutter/material.dart';
import 'package:tech_post_app/theme_package/third_page.dart';

class Second_Page_Theme extends StatelessWidget {
  final String name;

  Second_Page_Theme({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Page Theme',
          style:
              TextStyle( fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32.0,
            ),
            Text(
              'Data is::${name}',
              style: TextStyle(
                 // fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(
                child: const Text('Number Pass'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Third_page(
                        number: '7990508505',
                      ),
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
