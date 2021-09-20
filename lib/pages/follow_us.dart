import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tgf_style_guide_v2/main.dart';
import 'social_media_btns.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUsPage extends StatefulWidget {
  const FollowUsPage({
    Key? key,
  }) : super(key: key);

  @override
  _FollowUsPageState createState() => _FollowUsPageState();
}

class _FollowUsPageState extends State<FollowUsPage> {
  Future<void> _launchLink(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 22.0,
                  ),
                  Text(
                    'TEJGYAN FOUNDATION',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFFFC9219),
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Creating A Highly Evolved Society',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Center(
                child: Image(
                  image: NetworkImage(
                      'https://www.holidify.com/images/cmsuploads/compressed/48404184_2235799913110326_4172514351007137792_n_20190611114512.jpg'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading:
                        Icon(CupertinoIcons.phone_fill, color: Colors.black),
                    title: Text(
                      '9921008060',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    leading:
                        Icon(CupertinoIcons.mail_solid, color: Colors.black),
                    title: GestureDetector(
                      onTap: () {
                        _launchLink('mailto:mail@tejgyan.org');
                      },
                      child: Text(
                        'mail@tejgyan.org',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4A417F)),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.location_solid,
                        color: Colors.black),
                    title: GestureDetector(
                      onTap: () {
                        _launchLink(
                            'https://www.google.com/maps/place/Manan+Ashram/@18.4115372,73.8085978,17z/data=!3m1!4b1!4m5!3m4!1s0x3bc294ecd9beb06d:0xaf9be022739f5bb5!8m2!3d18.4115372!4d73.8107865');
                      },
                      child: Text(
                        'MaNaN Ashram, Sanas Nagar, Nandoshi Gaon, Kirkatwadi Phata, Sinhagad Road,Pune',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.globe, color: Colors.black),
                    title: GestureDetector(
                      onTap: () {
                        _launchLink('https://info.tejgyan.org/Home');
                      },
                      child: Text(
                        'www.tejgyan.org',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4A417F)),
                      ),
                    ),
                  ),
                  ListTile(
                    leading:
                        Icon(FontAwesomeIcons.addressBook, color: Colors.black),
                    title: Text(
                      'Save our contact number',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Text(
                    'Please click relevant icons to easily connect with us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SocialMediaBtns(),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
