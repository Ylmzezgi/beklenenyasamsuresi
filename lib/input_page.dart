import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasamsuresi/sabitler.dart';

import 'icon_cinsiyet.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 15.0;
  double sporSayisi = 3;
  int boy = 170;
  int kilo=65;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: MyContainer(
                  child: buildRowOutlineButton("BOY"),
                ),
              ),
              Expanded(
                child: MyContainer(child: buildRowOutlineButton("KİLO"),),
              ),
            ],
          )),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text("Haftada Kaç Gün Spor Yapıyorsunuz?",
                      style: kMetinStili),
                  Text(sporSayisi.round().toString(), style: ksayiStili),
                  Slider(
                      min: 0,
                      max: 7,
                      value: sporSayisi,
                      onChanged: (double newValue) {
                        setState(() {
                          sporSayisi = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: <Widget>[
                  Text("Günde kaç sigara içiyorsunuz?", style: kMetinStili),
                  Text('${icilenSigara.round()}', style: ksayiStili),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Expanded(
                  child: Row(
            children: <Widget>[
              Expanded(
                child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = 'ERKEK';
                    });
                  },
                  renk: seciliCinsiyet == 'ERKEK'
                      ? Colors.lightBlue[100]
                      : Colors.white,
                  child: IconCinsiyet(
                    cinsiyet: 'Kadın',
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
              Expanded(
                child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = 'KADIN';
                    });
                  },
                  renk: seciliCinsiyet == 'KADIN'
                      ? Colors.lightBlue[100]
                      : Colors.white,
                  child: IconCinsiyet(
                    cinsiyet: 'Erkek',
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
            ],
          ))),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RotatedBox(
                        quarterTurns: -1,
                        child: Text(label, style: kMetinStili)),
                    SizedBox(width: 5),
                    RotatedBox(
                        quarterTurns: -1,
                        child: Text(label=='BOY'?boy.toString():kilo.toString(), style: ksayiStili)),
                    SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                label=='BOY'?boy++:kilo++;
                              });
                            },
                            child: Icon(FontAwesomeIcons.plus, size: 10)),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              label=='KİLO'?kilo--:boy--;
                            });
                          },
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 10,
                          ),
                        )
                      ],
                    )
                  ],
                );
  }
}
