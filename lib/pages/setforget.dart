import 'package:flutter/material.dart';
import 'package:tgf_style_guide_v2/utils/routes.dart';
import 'package:tgf_style_guide_v2/pages/loginPage.dart';

class setforgetPage extends StatefulWidget {
  setforgetPage({Key? key}) : super(key: key);

  @override
  _setforgetPageState createState() => _setforgetPageState();
}

class _setforgetPageState extends State<setforgetPage> {
  final _password = TextEditingController();
  final _repassword = TextEditingController();
  var conditionvar;
  @override
  void initState() {
    super.initState();
    conditionvar = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              child: Image(
                image: NetworkImage(
                    'https://alexwebdevelop.com/wp-content/uploads/2019/08/php-login-and-authentication-the-definitive-guide.png'),
                width: 300,
                height: 150,
              ),
            ),
            Text(
              "Hello!",
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
              "Forget Password",
              style: TextStyle(
                color: Color(0xFF4a417f),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            // Password field
            Container(
              width: 350,
              child: TextFormField(
                controller: _password,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
                // password validation
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid password *";
                  } else if (!(value.contains(RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')))) {
                    return "Please enter a valid password";
                  }
                },
              ),
            ),

            SizedBox(
              height: 20,
            ),
            // retenter password field
            Container(
              width: 350,
              child: TextFormField(
                controller: _repassword,
                decoration: InputDecoration(
                  labelText: "Re-Enter Password",
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
                // validation for re enter password
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a valid password *";
                  } else if (!(value.contains(RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')))) {
                    return "Please enter a valid password";
                  }
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Submit button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Material(
                    borderRadius: BorderRadius.circular(conditionvar ? 50 : 8),
                    color: Color(0xFF4a417f),
                    child: InkWell(
                      onTap: () {
                        //redirect to login page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
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
                                color: Theme.of(context).canvasColor,
                              )
                            : Text(
                                "SUBMIT",
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
          ],
        ),
      ),
    );
  }
}
