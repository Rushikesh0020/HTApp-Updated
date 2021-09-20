import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tgf_style_guide_v2/pages/dummy.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

var temp;
var samayList = {};

Future<dynamic> getSamayNewTimings() async {
  var url = Uri.parse('http://10.0.2.2:8080/tgf/get/samay-sampana/1');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  temp = jsonDecode(response.body);
  print(temp.length);
  print(temp['samay808PM']);
  return temp;
}

var timingsList;
void timingsAppend(temp) {
  timingsList.add(temp['samay404AM']);
  timingsList.add(temp['samay505AM']);
  timingsList.add(temp['samay606AM']);
  timingsList.add(temp['samay707AM']);
  timingsList.add(temp['samay808AM']);
  timingsList.add(temp['samay909AM']);
  timingsList.add(temp['samay1010AM']);
  timingsList.add(temp['samay1111AM']);
  timingsList.add(temp['samay1212PM']);
  timingsList.add(temp['samay101PM']);
  timingsList.add(temp['samay202PM']);
  timingsList.add(temp['samay303PM']);
  timingsList.add(temp['samay404PM']);
  timingsList.add(temp['samay505PM']);
  timingsList.add(temp['samay606PM']);
  timingsList.add(temp['samay707PM']);
  timingsList.add(temp['samay808PM']);
  timingsList.add(temp['samay909PM']);
  timingsList.add(temp['samay1010PM']);
  timingsList.add(temp['samay1111PM']);
  timingsList.add(temp['samay1212AM']);
}

class FilterChipDisplay extends StatefulWidget {
  FilterChipDisplay() {
    getSamayNewTimings();
    print('Hello New : ${temp}');
  }

  @override
  _FilterChipDisplayState createState() => _FilterChipDisplayState();
}

YoutubePlayerController _controller = YoutubePlayerController(
  initialVideoId: 'K18cpp_-gP8',
  params: YoutubePlayerParams(
    playlist: ['0AEO4Qs64wY', 'oW07gWEDSNc'], // Defining custom playlist
    // startAt: Duration(seconds: 30),
    showControls: true,
    showFullscreenButton: true,
  ),
);

class _FilterChipDisplayState extends State<FilterChipDisplay> {
  void mapChipValues() {
    samayList['updatedBy'] = 1;
    samayList['userId'] = ("${samayTimings['userId']}");
    samayList['samay404AM'] = ("${samayTimings['samay404AM']}");
    samayList['samay505AM'] = ("${samayTimings['samay505AM']}");
    samayList['samay606AM'] = ("${samayTimings['samay606AM']}");
    samayList['samay707AM'] = ("${samayTimings['samay707AM']}");
    samayList['samay808AM'] = ("${samayTimings['samay808AM']}");
    samayList['samay909AM'] = ("${samayTimings['samay909AM']}");
    samayList['samay1010AM'] = ("${samayTimings['samay1010AM']}");
    samayList['samay1111AM'] = ("${samayTimings['samay1111AM']}");
    samayList['samay1212PM'] = ("${samayTimings['samay1212PM']}");
    samayList['samay101PM'] = ("${samayTimings['samay101PM']}");
    samayList['samay202PM'] = ("${samayTimings['samay202PM']}");
    samayList['samay303PM'] = ("${samayTimings['samay303PM']}");
    samayList['samay404PM'] = ("${samayTimings['samay404PM']}");
    samayList['samay505PM'] = ("${samayTimings['samay505PM']}");
    samayList['samay606PM'] = ("${samayTimings['samay606PM']}");
    samayList['samay707PM'] = ("${samayTimings['samay707PM']}");
    samayList['samay808PM'] = ("${samayTimings['samay808PM']}");
    samayList['samay909PM'] = ("${samayTimings['samay909PM']}");
    samayList['samay1010PM'] = ("${samayTimings['samay1010PM']}");
    samayList['samay1111PM'] = ("${samayTimings['samay1111PM']}");
    samayList['samay1212AM'] = false;

    print('Fn End SamayList: ${samayList} ');
  }

  Future<void> postSamay() async {
    // var url = Uri.parse('https://temnp-2f275-default-rtdb.firebaseio.com/Ambarstha1.json');
    var url = Uri.parse('http://10.0.2.2:8080/tgf/update-samay-sampanna');
    // var url = Uri.parse('http://10.0.2.2:8080/tgf/samay-sampanna');

    var request = jsonEncode(samayList);
    var response = await http.put(url, body: request, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
    print('Hello Server: ${response.statusCode}');
  }

  // var samayList = [];
  // static var samayList = new Map();

  // @override
  // void initState() {
  //   super.initState();
  //   getTimings();
  // }

  // void getTimings() async {

  //   samayTimings = await getsamay();
  //   // print('Hello Rushi ${samayList['samay404AM']}');
  // }

  int alarmId = 1;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.bars,
              color: Colors.black,
              size: 16.0,
            ),
            onPressed: () {}),
        title: Text(
          "Samaya Sampana",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                FontAwesomeIcons.search,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: () {
                //
              }),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.bell,
                color: Colors.black,
                size: 16.0,
              ),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'HOW SAMAY SAMPANA WORKS',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pharetra metus cursus tortor et n pharetra metus cursus tortor et  ',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            YoutubePlayerIFrame(
              controller: _controller,
              aspectRatio: 16 / 9,
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'SAMAY SAMPANA SETTINGS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select suitable timings for Samay Sampana reminder',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.0,
                        color: Colors.black54),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Stack(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 3.0,
                          children: <Widget>[
                            filterChipWidget(
                              samayLabel: 'samay404AM',
                              chipName: '04:04',
                              selectChip: samayTimings['samay404AM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay505AM',
                              chipName: '05:05',
                              selectChip: samayTimings['samay505AM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay606AM',
                              chipName: '06:06',
                              selectChip: samayTimings['samay606AM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay707AM',
                              chipName: '07:07',
                              selectChip: samayTimings['samay707AM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay808AM',
                              chipName: '08:08',
                              selectChip: samayTimings['samay808AM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay909AM',
                              chipName: '09:09',
                              selectChip: samayTimings['samay909AM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay1010AM',
                              chipName: '10:10',
                              selectChip: samayTimings['samay1010AM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay1111AM',
                              chipName: '11:11',
                              selectChip: samayTimings['samay1111AM'] || false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xFFFCAE56),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Text('Morning'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 5.0,
                          children: <Widget>[
                            filterChipWidget(
                              samayLabel: 'samay1212PM',
                              chipName: '12:12',
                              selectChip: samayTimings['samay1212PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay101PM',
                              chipName: '01:01',
                              selectChip: samayTimings['samay101PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay202PM',
                              chipName: '02:02',
                              selectChip: samayTimings['samay202PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay303PM',
                              chipName: '03:03',
                              selectChip: samayTimings['samay303PM'] || false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFCAE56),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Text('Afternoon'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 5.0,
                          children: <Widget>[
                            filterChipWidget(
                              samayLabel: 'samay404PM',
                              chipName: '04:04',
                              selectChip: samayTimings['samay404PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay505PM',
                              chipName: '05:05',
                              selectChip: samayTimings['samay505PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay606PM',
                              chipName: '06:06',
                              selectChip: samayTimings['samay606PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay707PM',
                              chipName: '07:07',
                              selectChip: samayTimings['samay707PM'] || false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xFFFCAE56),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Text('Evening'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 5.0,
                          children: <Widget>[
                            filterChipWidget(
                              samayLabel: 'samay808PM',
                              chipName: '08:08',
                              selectChip: samayTimings['samay808PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay909PM',
                              chipName: '09:09',
                              selectChip: samayTimings['samay909PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay1010PM',
                              chipName: '10:10',
                              selectChip: samayTimings['samay1010PM'] || false,
                            ),
                            filterChipWidget(
                              samayLabel: 'samay1111PM',
                              chipName: '11:11',
                              selectChip: samayTimings['samay1111PM'] || false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xFFFCAE56),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 3.0),
                    child: Text('Night'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Color(0xFF4A417F),
                    minimumSize: Size(164, 40),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    side: BorderSide(color: Color(0xFF4A417F), width: 1.5),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    print('Cancel Pressed!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PackageApp()),
                    );
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4A417F),
                    minimumSize: Size(164, 40),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    print('Save Pressed!');
                    mapChipValues();
                    print(samayList);
                    postSamay();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PackageApp()),
                    );
                  },
                  child: Text('Save'),
                ),
              ],
            ),
            SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _titleContainer(String myTitle) {
  return Text(
    myTitle,
    style: TextStyle(
        color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
  );
}

class filterChipWidget extends StatefulWidget {
  final String chipName;
  final String samayLabel;
  bool selectChip;

  filterChipWidget(
      {Key? key,
      required this.chipName,
      required this.samayLabel,
      this.selectChip: false})
      : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;
  int alarmId = 1;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      side: widget.selectChip
          ? BorderSide(width: 1.0, color: Color(0xFF312AFF).withOpacity(0.62))
          : BorderSide(width: 1.0, color: Color(0xFF8A8A8A).withOpacity(0.62)),
      label: Text(widget.chipName),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
      ),
      selected: _isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      backgroundColor: widget.selectChip
          ? Color(0xFFC0BEFF).withOpacity(0.62)
          : Color(0xFFD4D4D4).withOpacity(0.32),
      onSelected: (isSelected) {
        setState(() {
          print(isSelected);
          widget.selectChip = !widget.selectChip;
          // samayList[widget.samayLabel] =  widget.selectChip;
          samayTimings[widget.samayLabel] = widget.selectChip;
          print(widget.samayLabel);
          print(samayTimings[widget.samayLabel]);
          // if (widget.selectChip == true) {
          //   // widget.selectChip = !widget.selectChip;

          //   print('Alarm Initialted');
          //   AndroidAlarmManager.periodic(
          //       Duration(seconds: 60), alarmId, fireAlarm);
          // } else {
          //   AndroidAlarmManager.cancel(alarmId);
          //   print('Alarm Timer Canceled');
          // }
        });
      },
      selectedColor: Color(0xFFC0BEFF).withOpacity(0.62),
    );
  }
}

// void fireAlarm() {
//   FlutterRingtonePlayer.playNotification();
//   print('Alarm Fired at ${DateTime.now()}');
// }
