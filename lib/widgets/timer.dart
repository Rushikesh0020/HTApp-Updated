import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tgf_style_guide_v2/utils/colors.dart';

// ignore: must_be_immutable
class CountdownTimer extends StatefulWidget {
  CountdownTimer({
    Key? key,
    required this.title,
  }) : super(key: key);
  String title;

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int minutes = 20;
  int seconds = 00;
  late Timer timer;
  int buttonState = 0;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds == 0 && minutes > 0) {
        setState(() {
          buttonState = 1;
          minutes--;
          seconds = 60;
        });
      }
      if (minutes > -1 && seconds > 0) {
        setState(() {
          buttonState = 1;
          seconds--;
        });
      }
      if (minutes == 0 && seconds == 0) {
        setState(() {
          buttonState = 2;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      buttonState = 0;
      timer.cancel();
      minutes = 20;
      seconds = 00;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      // height: 104,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: CustomeColors.secondaryColor, width: 0.8),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title.toUpperCase(),
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: CustomeColors.neutralColor,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                minutes < 10 ? "0" + "$minutes" : "$minutes",
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: CustomeColors.neutralColor,
                ),
              ),
              Text(
                "m",
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: CustomeColors.neutralColor,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                ":",
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: CustomeColors.neutralColor,
                ),
              ),
              Text(
                seconds < 10 ? "0" + "$seconds" : "$seconds",
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: CustomeColors.neutralColor,
                ),
              ),
              Text(
                "s",
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: CustomeColors.neutralColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Stack(
            children: [
              Visibility(
                visible: buttonState == 0,
                child: InkWell(
                  onTap: () {
                    startTimer();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: CustomeColors.primaryColorDark, width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Text(
                      "START",
                      style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: CustomeColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: buttonState == 1,
                child: InkWell(
                  onTap: () {
                    resetTimer();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: CustomeColors.primaryColorDark, width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Text(
                      "RESET",
                      style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: CustomeColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: buttonState == 2,
                child: InkWell(
                  onTap: () {
                    resetTimer();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: CustomeColors.primaryColorDark, width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Text(
                      "DONE",
                      style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: CustomeColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
