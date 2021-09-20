import 'dart:convert';
import 'package:http/http.dart' as http;

getEvents() async {
    var url =
        Uri.parse('https://htapp.sampurnaswasthya.com/tgf/new-releases');
    var response = await http.get(url);
    var events = jsonDecode(response.body);
    var eventList = [];
    for (int i = 0; i < events.length; i++) {
      eventList.add(events[i]);
    }
    return eventList;
  }
 
Future<void> main() async {
  var temp = await getEvents();
  var result = {
   
  };
  print(temp.length);
  print(temp);
}

//1. Carausel
//2. 