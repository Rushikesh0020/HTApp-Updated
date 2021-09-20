////To Launch links in Browser
// Future<void> _launchInBrowser(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: false,
//         forceWebView: false,
//         headers: <String, String>{'header_key': 'header_value'},
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

////To Launch Browser links inside/within our app 
//   Future<void> _launchInApp(String url) async {
//     if (await canLaunch(url)) {
//       await launch(
//         url,
//         forceSafariVC: true,
//         forceWebView: false,
//         headers: <String, String>{'header_key': 'header_value'},
//       );
//     } else {
//       throw 'Could not launch $url';
//     }
//   }


// class UsersApi {
//   static Future<User> getDemoSamay() async {
//     final url = Uri.parse('http://10.0.2.2:8080/tgf/get/samay-sampana/1');
//     final response = await http.get(url);
//     final body = jsonDecode(response.body);

//     return body.map<User>(User.fromJson);
//   }
// }


// Future<void> main() async {
//   var temp = await getsamay();
//   print(temp['samay404AM']);
//   print(temp['id']);

// }
// void main() async {
//   var re = await getsamay();
//   print(re);
//   print(re["userId"]);
// }


// Future<dynamic> getSamayNewTimings() async {
//   var url = Uri.parse('http://10.0.2.2:8080/tgf/get/samay-sampana/1');
//   var response = await http.get(url);
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//   temp = jsonDecode(response.body);
//   print(temp.length);
//   print(temp['samay808PM']);
//   return temp;
// }
