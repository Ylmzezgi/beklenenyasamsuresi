import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasamsuresi/sabitler.dart';

class IconCinsiyet extends StatelessWidget {
  final IconData? icon;
  final String? cinsiyet;
  IconCinsiyet({this.icon=FontAwesomeIcons.addressBook,this.cinsiyet='Default'});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(cinsiyet!,
            style:kMetinStili ),
      ],
    );
  }
}