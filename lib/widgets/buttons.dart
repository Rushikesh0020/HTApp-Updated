import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tgf_style_guide_v2/utils/colors.dart';

// Curved Filled Button
// ignore: must_be_immutable
class CurvedEdgeFillButton extends StatefulWidget {
  CurvedEdgeFillButton({
    Key? key,
    required this.buttonText,
    this.onTapped,
    this.minWidth,
  }) : super(key: key);
  String buttonText;
  GestureTapCallback? onTapped;
  double? minWidth;

  @override
  _CurvedEdgeFillButtonState createState() => _CurvedEdgeFillButtonState();
}

class _CurvedEdgeFillButtonState extends State<CurvedEdgeFillButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      elevation: 3,
      child: InkWell(
        splashColor: CustomeColors.primaryColorDark,
        onTap: widget.onTapped,
        child: Container(
          width: widget.minWidth,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 11),
          decoration: BoxDecoration(
            color: CustomeColors.primaryColorDark,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              widget.buttonText.toUpperCase(),
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: 0.5,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Curved Hollow Button
// ignore: must_be_immutable
class CurvedEdgeHollowButton extends StatefulWidget {
  CurvedEdgeHollowButton({
    Key? key,
    required this.buttonText,
    this.onTapped,
    this.minWidth,
  }) : super(key: key);
  String buttonText;
  GestureTapCallback? onTapped;
  double? minWidth;

  @override
  _CurvedEdgeHollowButtonState createState() => _CurvedEdgeHollowButtonState();
}

class _CurvedEdgeHollowButtonState extends State<CurvedEdgeHollowButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      elevation: 2.5,
      child: InkWell(
        onTap: widget.onTapped,
        child: Container(
          width: widget.minWidth,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.5,
              color: CustomeColors.primaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              widget.buttonText.toUpperCase(),
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                letterSpacing: 0.5,
                color: CustomeColors.primaryColorDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
