import 'package:flutter/material.dart';
import 'package:tgf_style_guide_v2/pages/validators.dart';
import 'package:tgf_style_guide_v2/pages/formPage.dart';
import 'package:tgf_style_guide_v2/utils/routes.dart';

class DonePage extends StatefulWidget {
  DonePage({Key? key}) : super(key: key);

  @override
  _DonePageState createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  final mobNo = TextEditingController();
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
            Container(
              child: Image(
                image: NetworkImage(
                    'https://alexwebdevelop.com/wp-content/uploads/2019/08/php-login-and-authentication-the-definitive-guide.png'),
                width: 300,
                height: 150,
              ),
            ),
            Text(
              "Hello",
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
              "Forgot Password",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container for Email ID
            Container(
              width: 300,
              child: TextFormField(
                controller: mobNo,
                decoration: InputDecoration(
                  labelText: "Enter your Registered Email ID",
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
                // Validation for email id
                validator: (value) {
                  if (!isEmail(value!)) {
                    return "Enter Email ID correctly";
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                        //Navigation to formpage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FormPage()), //here instead of FormPage() there was otp()
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
                                "Send OTP",
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
