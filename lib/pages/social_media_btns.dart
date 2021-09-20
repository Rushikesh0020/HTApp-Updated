import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class SocialMediaBtns extends StatefulWidget {
  const SocialMediaBtns({
    Key? key,
  }) : super(key: key);

  @override
  _SocialMediaBtnsState createState() => _SocialMediaBtnsState();
}

class _SocialMediaBtnsState extends State<SocialMediaBtns> {
  // To open links in app or browser
  Future<void> _launchUniversalLink(String url) async {
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
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.whatsapp,
                  color: Color(0xFF25D366)),
              iconSize: 40.0,
              color: Color(0xFF3b5998),
              tooltip: 'Tejgyan WhatsApp',
              onPressed: () {
                _launchUniversalLink(
                    'https://api.whatsapp.com/send/?phone=%2B919921008060&text&app_absent=0');
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.telegram,
                  color: Color(0xFF0088cc)),
              iconSize: 40.0,
              color: Color(0xFF3b5998),
              tooltip: 'Tejgyan Telegram Page',
              onPressed: () {
                _launchUniversalLink('https://t.me/thetejgyan');
              },
            ),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.youtube,
                color: Color(0xFFFF0000),
              ),
              iconSize: 40.0,
              color: Color(0xFF3b5998),
              tooltip: 'Tejgyan Youtube Page',
              onPressed: () {
                _launchUniversalLink(
                    'https://www.youtube.com/channel/UC6hJtatVsQwfjd5C8Q-ZbRA');
              },
            ),
            IconButton(
              icon: const Icon(Icons.facebook),
              iconSize: 40.0,
              color: Color(0xFF3b5998),
              tooltip: 'Tejgyan Facebook Page',
              onPressed: () {
                _launchUniversalLink('https://www.facebook.com/Tejgyan/');
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.instagram,
                color: Color(0xFFE1306C),
              ),
              iconSize: 40.0,
              color: Color(0xFF3b5998),
              tooltip: 'Tejgyan Instagram',
              onPressed: () {
                _launchUniversalLink('https://www.instagram.com/thetejgyan/');
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.twitter),
              iconSize: 40.0,
              color: Color(0xFF3b5998),
              tooltip: 'Tejgyan Twitter Page',
              onPressed: () {
                _launchUniversalLink('https://twitter.com/Sirshree');
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.linkedin,
                  color: Color(0xFF0e76a8)),
              iconSize: 40.0,
              color: Color(0xFF3b5998),
              tooltip: 'Tejgyan LinkedIn Page',
              onPressed: () {
                _launchUniversalLink(
                    'https://www.linkedin.com/in/tejgyan-foundation-2365b941/');
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.pinterest,
                  color: Color(0xFFE60023)),
              iconSize: 40.0,
              color: Color(0xFF3b5998),
              tooltip: 'Tejgyan Pinterest Page',
              onPressed: () {
                _launchUniversalLink('https://in.pinterest.com/tejgyan/');
              },
            ),
          ],
        ),
      ],
    );
  }
}
