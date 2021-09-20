import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tgf_style_guide_v2/pages/dummy.dart';
import 'package:tgf_style_guide_v2/main.dart';
import 'package:tgf_style_guide_v2/utils/routes.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
// ignore: must_be_immutable
class setpasswordPage extends StatefulWidget {
  setpasswordPage({
    Key? key,
    this.firstName: "Ankit",
    this.middleName: "M",
    this.lastName: "Da",
    this.emailId: "ankit.d@gmail.com",
    this.mobNo: "9898989898",
    this.maCompleted: true,
    this.city: "Pune",
    this.country: "India",
    this.khojiShivir: "ASD1",
    this.tejsthan: "Pune",
  }) : super(key: key);
  String firstName,
      middleName,
      lastName,
      emailId,
      mobNo,
      khojiShivir,
      tejsthan,
      city,
      country;
  bool maCompleted;

  @override
  _setpasswordPageState createState() => _setpasswordPageState();
}

// ignore: camel_case_types
class _setpasswordPageState extends State<setpasswordPage> {
  final _setKey = GlobalKey<FormState>();
  final _password = TextEditingController();
  final _repassword = TextEditingController();
  bool conditionvar = false;
  @override
  void initState() {
    super.initState();
    conditionvar = false;
    _passwordVisible1 = false;
    _passwordVisible2 = false;
  }

  moveToLogin(context) async {
    setState(() {
      conditionvar = true;
    });

    await Future.delayed(Duration(milliseconds: 800));
    await Navigator.pushNamed(context, AppRoutes.loginRoute);
    setState(() {
      conditionvar = false;
    });
  }

  moveToForm(context) async {
    setState(() {
      conditionvar = true;
    });

    await Future.delayed(Duration(milliseconds: 800));
    await Navigator.pushNamed(context, AppRoutes.formRoute);
    setState(() {
      conditionvar = false;
    });
  }

// Submit function
  submit(context) async {
    if (_setKey.currentState!.validate()) {
      setState(() {
        conditionvar = true;
      });
    }
    print(_password.text);
    await Future.delayed(Duration(milliseconds: 800));
    var response = await pushInfo();
    if (response != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DummyPage()));
    }
  }

  // calling api
  Future<http.Response> pushInfo() async {
    var api = PackageApp.baseUrl +
        'tgf/khoji/register'; // {https://localhost:8080/ :: Need to be used from configuration file}

    var url = Uri.parse(api);
    // data object
    Map data = {
      "firstName": widget.firstName,
      "middleName": widget.middleName,
      "lastName": widget.lastName,
      "emailId": widget.emailId,
      "mobileNumber": widget.mobNo,
      "password": _password.text,
      "maCompleted": widget.maCompleted,
      "khojiShivir": widget.khojiShivir,
      "tejasthan": widget.tejsthan,
      "city": widget.city,
      "country": widget.country,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    print(data);
    return response;
  }

  bool _passwordVisible1 = true;
  bool _passwordVisible2 = true;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: _setKey,
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                // main image
                Container(
                  child: Image(
                    image: NetworkImage(
                        'https://alexwebdevelop.com/wp-content/uploads/2019/08/php-login-and-authentication-the-definitive-guide.png'),
                    width: 300,
                    height: 150,
                  ),
                ),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "REGISTER NOW",
                  style: TextStyle(
                    color: Color(0xFF4a417f),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //password page
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _password,
                    obscureText: !_passwordVisible1,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible1 = !_passwordVisible1;
                          });
                        },
                      ),
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a password *";
                      } else if (!(value.contains(RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')))) {
                        return "Please enter a valid password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Re enter password field
                Container(
                  width: 350,
                  child: TextFormField(
                    controller: _repassword,
                    obscureText: !_passwordVisible2,
                    decoration: InputDecoration(
                      labelText: "Re-Enter Password",
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible2 = !_passwordVisible2;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    //validation for same password
                    validator: (value) {
                      if (_password.text != _repassword.text) {
                        return "Re-entered password must be same as before";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //Register button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Material(
                        borderRadius:
                            BorderRadius.circular(conditionvar ? 50 : 8),
                        color: Color(0xFF4a417f),
                        child: InkWell(
                          onTap: () {
                            if (_password.text == _repassword.text &&
                                _password.text != "") {
                              submit(context);
                            }
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
                                    "REGISTER",
                                    style: TextStyle(
                                      color: Theme.of(context).canvasColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
