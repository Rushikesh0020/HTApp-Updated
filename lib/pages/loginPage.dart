import 'package:flutter/material.dart';
import 'package:tgf_style_guide_v2/pages/dummy.dart';
import 'package:tgf_style_guide_v2/pages/validators.dart';
import 'package:tgf_style_guide_v2/main.dart';
import 'package:tgf_style_guide_v2/pages/formPage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final mobNo = TextEditingController();
  final password = TextEditingController();
  bool conditionvar = false;
  var _value;
  var _value_2;
  var userData;
  var body;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    _value = 0;
    _value_2 = 0;
  }

  moveToForm(context) async {
    await Future.delayed(Duration(milliseconds: 800));
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FormPage(
          emailAddress: password.text,
          mobileNumber: mobNo.text,
        ),
      ),
    );
    setState(
      () {
        conditionvar = false;
      },
    );
  }

  //get function for email and mobile verification
  get(context, var mobile, var email) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        conditionvar = true;
      });

      List parameters = [
        "firstName",
        "middleName",
        "lastName",
        "shivirName",
        "tejsthan"
      ];

      List<String> returnParameters = [];

      //Calling Login API
      var api = PackageApp.baseUrl +
          'tgf/khoji/login/' +
          mobNo.text +
          '/' +
          password.text;
      var url = Uri.parse(api);
      var response = await http.get(url);
      final jsonData;
      //Checking Status code and routing to landing page
      if (response.statusCode == 200) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DummyPage(),
          ),
        );
      }
      //Printing response and stastus code
      print("${response.statusCode}");
      print("${response.body}");
    }
  }

  bool _passwordVisible = true;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          //Main image
                          Container(
                            child: Image(
                              image: NetworkImage(
                                  'https://alexwebdevelop.com/wp-content/uploads/2019/08/php-login-and-authentication-the-definitive-guide.png'),
                              width: 300,
                              height: 150,
                            ),
                          ),

                          Text(
                            "TGF Membership Login",
                            style: TextStyle(
                              color: Color(0xFF4a417f),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Login using your credentials",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Container for Mobile/Email
                          Container(
                            width: 600,
                            child: TextFormField(
                              controller: mobNo,
                              decoration: InputDecoration(
                                labelText: "Email ID / Mobile Number",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                              //Email and mobile number Validation
                              validator: (value) {
                                if (value!.length == 10 && isNumeric(value)) {
                                  return null;
                                } else if (!isEmail(value)) {
                                  return "Enter Email ID / Moblie No. correctly";
                                }

                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Container for Password
                          Container(
                            width: 600,
                            child: TextFormField(
                              enabled: _value_2 != 2,
                              controller: password,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                              //Password Validation
                              validator: (value) {
                                if (_value_2 == 1 || _value_2 == 0) {
                                  if (value!.isEmpty) {
                                    return "Please enter a valid password *";
                                  } else if (!(value.contains(RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')))) {
                                    return "Please enter a valid password";
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(
                                        conditionvar ? 50 : 8),
                                    color: Color(0xFFf5f5f5),
                                    child: InkWell(
                                      onTap: () {
                                        // Navigating to landing page
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DummyPage()),
                                        );
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        width: conditionvar ? 50 : 120,
                                        height: 30,
                                        alignment: Alignment.center,
                                        child: conditionvar
                                            ? Icon(
                                                Icons.done_outlined,
                                                color: Theme.of(context)
                                                    .canvasColor,
                                              )
                                            : Text(
                                                "Forgot password?",
                                                style: TextStyle(
                                                  color: Color(0xFF4a417f),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          // login button code
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Material(
                                  borderRadius: BorderRadius.circular(
                                      conditionvar ? 50 : 8),
                                  color: Color(0xFF4a417f),
                                  child: InkWell(
                                    onTap: () {
                                      //calling get function for submitting
                                      get(
                                        context,
                                        mobNo.text,
                                        password.text,
                                      );
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      width: conditionvar ? 50 : 120,
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: conditionvar
                                          ? Icon(
                                              Icons.done_outlined,
                                              color:
                                                  Theme.of(context).canvasColor,
                                            )
                                          : Text(
                                              "LOG-IN",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .canvasColor,
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
                          SizedBox(
                            height: 40,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('Do not have an account yet?'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Material(
                                  borderRadius: BorderRadius.circular(
                                      conditionvar ? 50 : 8),
                                  color: Color(0xFFf5f5f5),
                                  child: InkWell(
                                    onTap: () {
                                      // navigating to form page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FormPage()),
                                      );
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      width: conditionvar ? 50 : 120,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: conditionvar
                                          ? Icon(
                                              Icons.done_outlined,
                                              color:
                                                  Theme.of(context).canvasColor,
                                            )
                                          : Text(
                                              "Sign Up Now",
                                              style: TextStyle(
                                                color: Color(0xFF4a417f),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
