import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tgf_style_guide_v2/utils/colors.dart';

// Android Slider
// ignore: must_be_immutable
class SliderBar extends StatefulWidget {
  SliderBar(
      {Key? key,
      required this.defaultValue,
      required this.maxValue,
      required this.minValue,
      this.maxWidth: 6000,
      this.gapValue: 1})
      : super(key: key);

  double defaultValue, minValue, maxValue, maxWidth;
  int gapValue;

  @override
  _SliderBarState createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: widget.maxWidth,
        child: Slider(
          value: widget.defaultValue,
          min: widget.minValue,
          max: widget.maxValue,
          activeColor: CustomeColors.primaryColor,
          inactiveColor: Colors.grey[300],
          divisions: (widget.maxValue ~/ widget.gapValue),
          label: widget.defaultValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              widget.defaultValue = value;
            });
          },
        ),
      ),
    );
  }
}

//IOS slider
// ignore: must_be_immutable
class SliderBarIOS extends StatefulWidget {
  SliderBarIOS({
    Key? key,
    required this.defaultValue,
    required this.maxValue,
    required this.minValue,
    this.maxWidth: 6000,
  }) : super(key: key);
  double defaultValue, minValue, maxValue, maxWidth;

  @override
  _SliderBarIOSState createState() => _SliderBarIOSState();
}

class _SliderBarIOSState extends State<SliderBarIOS> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: widget.maxWidth,
        child: CupertinoSlider(
          value: widget.defaultValue,
          min: widget.minValue,
          max: widget.maxValue,
          activeColor: CustomeColors.primaryColor,
          divisions: 100,
          onChanged: (double value) {
            setState(() {
              widget.defaultValue = value;
            });
          },
        ),
      ),
    );
  }
}
