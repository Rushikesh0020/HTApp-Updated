import 'package:tgf_style_guide_v2/main.dart';
import 'package:tgf_style_guide_v2/models/bookCard.dart';
import 'package:tgf_style_guide_v2/models/eventCard.dart';
import 'package:tgf_style_guide_v2/models/imageCarousel.dart';
import 'package:tgf_style_guide_v2/models/upcomingEvents.dart';
import 'package:tgf_style_guide_v2/widgets/cardapi.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class StringSet {
  static String appName = 'Packeage Demo';
  static String dummyPage = 'Dummy Page';
}

class UrlSet {
  static List<String> eventUrl = [
    "https://wallpapercave.com/wp/wp8797477.jpg",
    "https://cdn.mos.cms.futurecdn.net/owjXYxW94bpABbKc2YDgtD.jpg",
    "https://cdn.dribbble.com/users/1431538/screenshots/3045907/drib-1.png?compress=1&resize=800x600",
    "https://cdn.dribbble.com/users/904433/screenshots/6259018/functionnal_dribbble.png?compress=1&resize=800x600",
    "https://cdn.dribbble.com/users/904433/screenshots/14261388/media/bdbb96a765304e031b934c74aef8586e.png?compress=1&resize=1600x1200",
    "https://cdn.dribbble.com/users/260954/screenshots/4041525/azure_icon1.jpg?compress=1&resize=800x600",
    "https://cdn.dribbble.com/users/67912/screenshots/11404013/media/497d876cb292e448338f51e680c44fab.png?compress=1&resize=1600x1200",
  ];

  static List<String> ytUrls = [
    "https://www.youtube.com/watch?v=4KIRj66gffw",
    "https://www.youtube.com/watch?v=XUetzVq16E4",
    "https://www.youtube.com/watch?v=5On6vueaERc",
    "https://www.youtube.com/watch?v=J9wmk3d2-sQ",
  ];
}

class ListSet {
  static List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static var detailGetter;
  static var imgPager;
  static var newCard;

  ListSet() {
    newCard = getNewCard();
    for(int i = 0; i<newCard.length;i++){
      nextEvents.add(
        NextEvents(
         thumbnail:newCard[i]['thumbnail'] , 
         releaseTitle:newCard[i]['releaseTitle'],
         category: newCard[i]['category'],
         description: newCard[i]['description'],
         url: newCard[i]['url'],
         ),
      );
    }


    detailGetter = getEvents();
    for(int i = 0; i<detailGetter.length;i++){
      eventCardInfo.add(
        EventCard(
         imgUrl:detailGetter[i]['thumbnail'] , 
         eventTitle:detailGetter[i]['eventTitle'],
         location:detailGetter[i]['location'],
         registerationLink:detailGetter[i]['registerationLink'],
         totalSeats:detailGetter[i]['totalSeats'],
         eventStartDatetime:detailGetter[i]['eventStartDatetime'],
         eventEndDatetime:detailGetter[i]['eventEndDatetime'],
         ),
      );
    }
   

    imgPager = getYTVids();
    print("length");
    print(imgPager.length);
    
    for (int i = 0; i < imgPager.length; i++) {
      imgCarinfo.add(
        ImgCar(
            imgUrl: imgPager[i]["contentThumbnail"],
            vidUrl: imgPager[i]["contentLink"],
            desLink: imgPager[i]['contentEmbeddedLink']
           
      )
      );
      print("abcde");

      print(imgCarinfo[i].desLink);
    }
    
  }

  getEvents() async {
    var url =
        Uri.parse('https://htapp.sampurnaswasthya.com/tgf/upcoming-events');
    var response = await http.get(url);
    var events = jsonDecode(response.body);
    var eventList = [];
    for (int i = 0; i < events.length; i++) {
      eventList.add(events[i]);
    }
    print(eventList);
    return eventList;
  }

  static final List<EventCard> eventCardInfo = [
    // EventCard(
    //     eventTitle: "abcde",
    //     imgUrl: "https://wallpapercave.com/wp/wp8797477.jpg",
    //     startDate: "2021-09-01",
    //     days: 2,
    //     startTime: "11:00:00",
    //     hrs: 4,
    //     capacity: 1000,
    //     bookedSeats: 234,
    //     mode: "Online"),
    // EventCard(
    //     eventTitle: "Ethical Hacking",
    //     imgUrl: "https://cdn.mos.cms.futurecdn.net/owjXYxW94bpABbKc2YDgtD.jpg",
    //     startDate: "2021-09-03",
    //     days: 4,
    //     startTime: "11:00:00",
    //     hrs: 6,
    //     capacity: 1000,
    //     bookedSeats: 546,
    //     mode: "In-person"),
    // EventCard(
    //     eventTitle: "SQL Basics",
    //     imgUrl:
    //         "https://cdn.dribbble.com/users/1431538/screenshots/3045907/drib-1.png?compress=1&resize=800x600",
    //     startDate: "2021-09-07",
    //     days: 3,
    //     startTime: "11:00:00",
    //     hrs: 3,
    //     capacity: 1000,
    //     bookedSeats: 485,
    //     mode: "In-person"),
    // EventCard(
    //     eventTitle: "Java Script Adv",
    //     imgUrl:
    //         "https://cdn.dribbble.com/users/904433/screenshots/6259018/functionnal_dribbble.png?compress=1&resize=800x600",
    //     startDate: "2021-09-10",
    //     days: 6,
    //     startTime: "11:00:00",
    //     hrs: 5,
    //     capacity: 1000,
    //     bookedSeats: 465,
    //     mode: "Online"),
    // EventCard(
    //     eventTitle: "Flutter Dev",
    //     imgUrl:
    //         "https://cdn.dribbble.com/users/904433/screenshots/14261388/media/bdbb96a765304e031b934c74aef8586e.png?compress=1&resize=1600x1200",
    //     startDate: "2021-09-16",
    //     days: 2,
    //     startTime: "11:00:00",
    //     hrs: 7,
    //     capacity: 1000,
    //     bookedSeats: 213,
    //     mode: "In-person"),
    // EventCard(
    //     eventTitle: "Microsoft Azure",
    //     imgUrl:
    //         "https://cdn.dribbble.com/users/260954/screenshots/4041525/azure_icon1.jpg?compress=1&resize=800x600",
    //     startDate: "2021-09-18",
    //     days: 3,
    //     startTime: "11:00:00",
    //     hrs: 3,
    //     capacity: 1000,
    //     bookedSeats: 878,
    //     mode: "In-person"),
    // EventCard(
    //     eventTitle: "Kubernetes Adv",
    //     imgUrl:
    //         "https://cdn.dribbble.com/users/67912/screenshots/11404013/media/497d876cb292e448338f51e680c44fab.png?compress=1&resize=1600x1200",
    //     startDate: "2021-09-21",
    //     days: 5,
    //     startTime: "11:00:00",
    //     hrs: 1,
    //     capacity: 1000,
    //     bookedSeats: 659,
    //     mode: "Online"),
  ];

  getYTVids() async {
    var url =
        Uri.parse('https://htapp.sampurnaswasthya.com/tgf/youtube/videos');
    var response = await http.get(url);
    var vids = jsonDecode(response.body);
    var vidList = [];
    for (int i = 0; i < vids.length; i++) {
      vidList.add(vids[i]);
    }
    print(vidList);
    return vidList;
  }

  static final List<ImgCar> imgCarinfo = [];
  static final List<BookCardIn> bookCardInfo = [
    BookCardIn(
      bookName: "Quantum Computer",
      imgUrl:
          "https://pragprog.com/titles/nmquantum/quantum-computing/nmquantum.jpg",
      min: 238,
    ),
    BookCardIn(
      bookName: "NLP for Hacker",
      imgUrl:
          "https://images.manning.com/360/480/resize/book/a/2ae1c03-bef7-4ea7-ba50-84d857b7ccea/Ivanov_NLP_hires.jpg",
      min: 200,
    ),
    BookCardIn(
      bookName: "Flutter Apps",
      imgUrl:
          "https://cdn.syncfusion.com/content/images/downloads/ebook/flutter-succinctly.png",
      min: 576,
    ),
    BookCardIn(
      bookName: "Azure IoT Revealed",
      imgUrl:
          "https://media.springernature.com/w306/springer-static/cover-hires/book/978-1-4842-5470-7",
      min: 20,
    ),
    BookCardIn(
      bookName: "Kubernetes </pro>",
      imgUrl: "https://m.media-amazon.com/images/I/51KUl03BJ6L.jpg",
      min: 563,
    ),
  ];

 getNewCard() async {
    var url =
        Uri.parse('https://htapp.sampurnaswasthya.com/tgf/new-releases');
    var response = await http.get(url);
    var rcards = jsonDecode(response.body);
    var cardList = [];
    for (int i = 0; i < rcards.length; i++) {
      cardList.add(rcards[i]);
    }
    print(cardList);
    return cardList;
  }
  static final List<NextEvents> nextEvents = [
    // NextEvents(
    //     title: "सबका नाम देव",
    //     itemType: "E-Book",
    //     imgUrl:
    //         "https://www.gethappythoughts.org/shop/image/cache/catalog/Capture-Sant%20Namdev-front-550x550h.JPG",
    //     description:
    //         "संत नामदवे का जीवन चरित्र और नाम रहस्य सिखावनियाँ, चमत्कार, यात्राएँ और भक्ति सूत्र।",
    //     bookUrl: "https://bit.ly/3DpKdlT"),
    // NextEvents(
    //     title: "पॉवर ऑफ वन",
    //     itemType: "E-Book",
    //     imgUrl:
    //         "https://www.gethappythoughts.org/shop/image/cache/catalog/ek-ki-shakti-power-of-one-hi-550x550h.png",
    //     description:
    //         "अपने मैं को सँभालते-सँभालते जब इंसान के अंदर संघर्ष बहुत ज़्यादा बढ़ जाता है तब उसकी क्षमता जवाब देने लगती है।",
    //     bookUrl:
    //         "https://www.gethappythoughts.org/shop/ek-ki-shakti-power-of-one-hi"),
  ];

  static final List<EventCard> eventCardDb = [];

}
