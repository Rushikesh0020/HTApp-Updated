import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ignore: camel_case_types
class httePage extends StatefulWidget {
  httePage({Key? key}) : super(key: key);

  @override
  _httePageState createState() => _httePageState();
}

// ignore: camel_case_types
class _httePageState extends State<httePage> {
  var conditionvar;
  @override
  void initState() {
    super.initState();
    conditionvar = false;
  }

  resposnse() async {
    var url = Uri.parse(
        'http://localhost:8080/tgfportal/attendance/submitattendance');
    var response = await http.post(url, body: {
      "firstName": "FirstTest_1",
      "middleName": "MiddleTest_1",
      "lastName": "LastTest_1",
      "gender": "male_1",
      "emailId": "test@email.com_1",
      "mobileNumber": "9876543220",
      "shivirName": "Maha Asmani_1",
      "city": "Pune_1",
      "tejsthanName": "Pune_1",
      "eventAttended": "1",
      "dtAttendanceMarkedOn": "2021-07-01T11:53:32.1090522"
    });

    print("Done!");

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //color: Colors.amber,
        child: Material(
          borderRadius: BorderRadius.circular(conditionvar ? 50 : 8),
          color: Theme.of(context).buttonColor,
          child: InkWell(
            onTap: () {
              // submit(context, _attendance, _gender, _shivirValue,
              //     _tejsthanValue);
              resposnse();
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: conditionvar ? 50 : 120,
              height: 50,
              alignment: Alignment.center,
              child: conditionvar
                  ? Icon(
                      Icons.done_outlined,
                      color: Theme.of(context).canvasColor,
                    )
                  : Text(
                      "Submit",
                      style: TextStyle(
                        color: Theme.of(context).canvasColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
