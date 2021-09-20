import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tgf_style_guide_v2/utils/colors.dart';

class TxtStyle {
  int colorHex;
  TxtStyle({Key? key, this.colorHex: 0xff201c38});
// ------------------------------------------------------------------------------------------------CustomeSet -- Headers
  static TextStyle h1 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w300,
      letterSpacing: 1.5,
    ).fontFamily,
    fontSize: 96,
    color: CustomeColors.neutralColor,
  );

  static TextStyle h2 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w300,
      letterSpacing: 0.5,
    ).fontFamily,
    fontSize: 60,
    color: CustomeColors.neutralColor,
  );

  static TextStyle h3 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ).fontFamily,
    fontSize: 48,
    color: CustomeColors.neutralColor,
  );

  static TextStyle h4 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ).fontFamily,
    fontSize: 34,
    color: CustomeColors.neutralColor,
  );

  static TextStyle h5 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ).fontFamily,
    fontSize: 25,
    color: CustomeColors.neutralColor,
  );

  static TextStyle h6 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ).fontFamily,
    fontSize: 20,
    color: CustomeColors.neutralColor,
  );

// -----------------------------------------------------------------------------------------------CustomeSet -- Subtitles
  static TextStyle subtitle1 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ).fontFamily,
    fontSize: 16,
    color: CustomeColors.neutralColor,
  );

  static TextStyle subtitle2 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w300,
      letterSpacing: 0.1,
    ).fontFamily,
    fontSize: 14,
    color: CustomeColors.neutralColor,
  );

// ----------------------------------------------------------------------------------------------------CustomeSet -- Body
  static TextStyle body1 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ).fontFamily,
    fontSize: 16,
    color: CustomeColors.neutralColor,
  );

  static TextStyle body2 = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ).fontFamily,
    fontSize: 14,
    color: CustomeColors.neutralColor,
  );

// ----------------------------------------------------------------------------------------------------CustomeSet -- Button
  static TextStyle button = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ).fontFamily,
    fontSize: 14,
    color: CustomeColors.neutralColor,
  );

// ----------------------------------------------------------------------------------------------------CustomeSet -- Caption
  static TextStyle caption = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ).fontFamily,
    fontSize: 12,
    color: CustomeColors.neutralColor,
  );

// ------------------------------------------------------------------------------------------------CustomeSet -- Overline
  static TextStyle overline = TextStyle(
    fontFamily: GoogleFonts.roboto(
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ).fontFamily,
    fontSize: 10,
    color: CustomeColors.neutralColor,
  );
}
