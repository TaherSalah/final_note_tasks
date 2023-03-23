import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constance.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            launchUrl(facebook, mode: LaunchMode.externalApplication);
          },
          child: Image.asset(
            'assets/images/facebook.png',
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        InkWell(
          onTap: () {
            launchUrl(linkedin, mode: LaunchMode.externalApplication);
          },
          child: Image.asset(
            'assets/images/linkedin.png',
            height: 50,
            width: 50,
          ),
        ),
     const   SizedBox(
          width: 6,
        ),
        InkWell(
          onTap: () {
            launchUrl(whatsapp, mode: LaunchMode.externalApplication);
          },
          child: Image.asset(
            'assets/images/whatsapp.png',
            height: 50,
            width: 50,
          ),
        ),
    const    SizedBox(
          width: 6,
        ),
        InkWell(
          onTap: () {
            launchUrl(github, mode: LaunchMode.externalApplication);
          },
          child: Image.asset(
            'assets/images/github.png',
            height: 50,
            width: 50,
          ),
        ),
     const     SizedBox(
          width: 6,
        ),
        InkWell(
          onTap: () {
            launchUrl(insta, mode: LaunchMode.externalApplication);
          },
          child: Image.asset(
            'assets/images/instagram.png',
            height: 50,
            width: 50,
          ),
        ),
      ],
    );
  }
}
