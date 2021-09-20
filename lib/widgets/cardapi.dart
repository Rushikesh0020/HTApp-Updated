import 'dart:convert';

import 'package:http/http.dart' as http;

//  Future<void> getEvents()
//  async {
//    var url = Uri.parse('http://127.0.0.1:8080/tgf/upcoming-events');
//    var response = await http.get(url);
//    print('Response status: ${response.statusCode}');
//    print('Response body: ${response.body}');
//    var temp=jsonDecode(response.body);
//    return temp;
// }

// class cardApigetter {
getEvents() async {
  var url = Uri.parse('https://htapp.sampurnaswasthya.com/tgf/upcoming-events');
  var response = await http.get(url);
  var events = jsonDecode(response.body);
  var eventList = [];
  for (int i = 0; i < events.length; i++) {
    eventList.add(events[i]);
  }
  return eventList;
}
// }

Future<void> main() async {
  var temp = await getEvents();
  var result = {
    "eventId": temp[0]["eventId"],
    "eventTitle": temp[0]["eventTitle"],
    "eventSubtitle": temp[0]["eventSubtitle"],
    "description": temp[0]["description"],
    "eventStartDatetime": temp[0]["eventStartDatetime"],
    "eventEndDatetime": temp[0]["eventEndDatetime"],
    "activateDatetime": temp[0]["activateDatetime"],
    "deactivateDatetime": temp[0]["deactivateDatetime"],
    "category": temp[0]["category"],
    "registerationLink": temp[0]["registerationLink"],
    "totalSeats": temp[0]["totalSeats"],
    "khojiType": temp[0]["khojiType"],
    "thumbnail": temp[0]["thumbnail"],
    "location": temp[0]["location"]
  };
  print(temp.length);
  print(temp[0]);
}
