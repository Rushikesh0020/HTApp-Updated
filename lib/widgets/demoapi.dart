// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';





// Future<void> getEvents()
// async {
//   var url = Uri.parse('https://temnp-2f275-default-rtdb.firebaseio.com/Ambarstha.json');
//   var response = await http.get(url);
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//   // print('Actual Data: ${response.bo)
//   var temp=jsonDecode(response.body);
//   // print("My Id: ${temp['id']}");
//   print(temp["Khoji7"]);
//   print(temp.length);
//   for(int i=0;i<2;i++) {
//     print(temp[i]);
//   }
//   return temp;
// }

// Future<http.Response> fetchAlbum() {
//   return http.get(Uri.parse('https://temnp-2f275-default-rtdb.firebaseio.com/Ambarstha.json'));
// }

// void main() {
//   getEvents();
//   fetchAlbum();
// }