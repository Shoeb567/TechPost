import 'package:tech_post_app/form_validation.dart';
import 'package:tech_post_app/getAll_projectfile.dart';

import 'package:tech_post_app/show_screen/twitter_home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Form_Validation(),

    );
  }
}
