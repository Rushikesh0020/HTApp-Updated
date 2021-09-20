import 'package:flutter/material.dart';

class tncPage extends StatefulWidget {
  tncPage({Key? key}) : super(key: key);

  @override
  _tncPageState createState() => _tncPageState();
}

class _tncPageState extends State<tncPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            // terms and condition page
            Container(
              width: 300,
              child: Text(
                "To create a Google Account, you’ll need to agree to the Terms of Service below In addition, when you create an account, we process your information described in our Privacy Policy, including these key points:Data we process when you use Google",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
