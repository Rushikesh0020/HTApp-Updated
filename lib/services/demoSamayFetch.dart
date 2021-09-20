import 'dart:convert';
import 'package:http/http.dart' as http;

getsamay() async {
  var url = Uri.parse('https://htapp.sampurnaswasthya.com/tgf/samay-sampanna/33');
  var response = await http.get(url);
  var samay = jsonDecode(response.body);
  return samay;
}

