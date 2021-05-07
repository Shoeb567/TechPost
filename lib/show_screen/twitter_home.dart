
import 'package:tech_post_app/getAll_projectfile.dart';
class TwiterHome extends StatefulWidget {
  @override
  _TwiterHomeState createState() => _TwiterHomeState();
}

class _TwiterHomeState extends State<TwiterHome> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.black));
    // ignore: file_names
    return Scaffold(

        body: Container(
            child:TwitterApp()
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0.3,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.markunread_outlined), label: ""),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {},
          child:  Image.asset(AppAssets.texticon),
        ));
  }
}
