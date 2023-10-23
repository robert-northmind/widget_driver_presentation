import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:widget_driver_presentation/speaker_info.dart';

import 'slides/slides.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        background: FlutterDeckBackgroundConfiguration(
          light: FlutterDeckBackground.solid(Color.fromARGB(255, 163, 223, 23)),
          dark: FlutterDeckBackground.solid(Color.fromARGB(255, 98, 25, 48)),
        ),
        controls: FlutterDeckControlsConfiguration(
          nextKey: LogicalKeyboardKey.arrowRight,
          previousKey: LogicalKeyboardKey.arrowLeft,
          openDrawerKey: LogicalKeyboardKey.period,
        ),
        footer: FlutterDeckFooterConfiguration(
          showSlideNumbers: true,
          showSocialHandle: true,
        ),
        header: FlutterDeckHeaderConfiguration(
          showHeader: false,
        ),
        showProgress: true,
        transition: FlutterDeckTransition.fade(),
      ),
      speakerInfo: Speaker.getInfo,
      slides: const [
        TitleSlide(),
        SplitSlide(),
      ],
    );
  }
}

class SplitSlide extends FlutterDeckSlideWidget {
  const SplitSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/split-slide',
            header: FlutterDeckHeaderConfiguration(
              title: 'Split slide template',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) {
        return Text(
          'Here goes the LEFT section content of the slide',
          style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
        );
      },
      rightBuilder: (context) {
        return Text(
          'Here goes the RIGHT section content of the slide',
          style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
        );
      },
    );
  }
}
