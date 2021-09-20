import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:tgf_style_guide_v2/utils/routes.dart';
import 'package:tgf_style_guide_v2/pages/setpassword.dart';

class otpPage extends StatefulWidget {
  otpPage({
    Key? key,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.whatsAppNo,
    required this.emailId,
    required this.cityName,
    required this.country,
    required this.tejsthan,
    required this.khojiShivir,
    required this.maCompleted,
    emailAuth,
  }) : super(key: key);
  String firstName,
      middleName,
      lastName,
      whatsAppNo,
      emailId,
      cityName,
      country,
      khojiShivir,
      tejsthan;
  bool maCompleted;

  EmailAuth otpsender = new EmailAuth(sessionName: "Happy Thoughts");

  @override
  _otpPageState createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  @override
  void initState() {
    conditionvar = false;
    sendemail.text = widget.emailId;
  }

  // Controllers for otp page
  final _OtpController = TextEditingController();
  final sendemail = TextEditingController();
  // Email auth service for otp verification
  EmailAuth emailAuth = new EmailAuth(sessionName: "Happy Thoughts");
  // verify function
  void verify() async {
    var res = emailAuth.validateOtp(
        recipientMail: sendemail.value.text,
        userOtp: _OtpController.value.text);

    if (res) {
      print("otp verified");
      goToPasswordPage(context, _OtpController.text);
    } else {
      print("incorrect otp");
    }
  }

  // send otp function
  void _sendOTP() async {
    bool result =
        await emailAuth.sendOtp(recipientMail: widget.emailId, otpLength: 4);
    print(result);
  }

  var conditionvar;

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

  // pushing data to setpassword page
  goToPasswordPage(context, otpValue) {
    if (otpValue != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => setpasswordPage(
            firstName: widget.firstName,
            middleName: widget.middleName,
            lastName: widget.lastName,
            mobNo: widget.whatsAppNo,
            emailId: widget.emailId,
            city: widget.cityName,
            country: widget.country,
            khojiShivir: widget.khojiShivir,
            maCompleted: widget.maCompleted,
            tejsthan: widget.tejsthan,
          ),
        ),
      );
    }
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
            //main image
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
              "Register Now",
              style: TextStyle(
                color: Color(0xFF4a417f),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Sendotp button and calling func
            Container(
              width: 350,
              child: TextFormField(
                controller: sendemail,
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                    child: Text("Send OTP"),
                    onPressed: () => _sendOTP(),
                  ),
                  labelText: "Email Id *",
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                // Validation for email id
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email Id *";
                  } else if (!(value.contains(RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")))) {
                    return "Please enter valid Email address";
                  }
                },
              ),
            ),
            // otp field
            Container(
              width: 350,
              child: TextFormField(
                controller: _OtpController,
                decoration: InputDecoration(
                  labelText: "Enter OTP",
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
                // otp validation
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the OTP *";
                  }
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Text(
              "OTP has been sent and valid for 3 mins",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w600,
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
                      //on tap verify
                      onTap: () {
                        verify();
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
                                "VERIFY",
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
