import 'package:flutter_deck/flutter_deck.dart';

abstract class Speaker {
  static FlutterDeckSpeakerInfo getInfo = const FlutterDeckSpeakerInfo(
    name: 'Robert Magnusson',
    description: 'passionate software engineer',
    socialHandle: 'robert@northmind.io',
    imagePath: 'assets/me.jpg',
  );
}
