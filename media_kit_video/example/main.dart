import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

void main(){
  runApp(ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  ExampleAppState createState() => ExampleAppState();
}

class  ExampleAppState extends State<ExampleApp> {
  late final VideoController controller;
  late final Player player;

  @override
  void initState() {
    super.initState();

    player = Player();
    controller = VideoController(player);
  }
  @override
   Widget build(BuildContext context) {
    return MaterialVideoControlsTheme(
      normal: MaterialVideoControlsThemeData(
        shiftSubtitlesOnControlsVisibilityChange: true,
        volumeGesture: true,
        brightnessGesture: true,
        seekGesture: true,
        displaySeekBar: true,
        seekOnDoubleTap: true,
        speedUpOnLongPress: true,
        topButtonBarMargin: EdgeInsetsDirectional.only(top: 24, start: 32, end: 32),
        topButtonBar: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 24),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_new_outlined, size: 32),
            ),
          ),
          Expanded(
            child: Text(
              "title",
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, size: 32),
          ),
        ],
        bottomButtonBarMargin: EdgeInsets.only(bottom: 24, left: 48, right: 48),
        bottomButtonBar: [
          MaterialPositionIndicator(),
        ],
        seekBarMargin: EdgeInsets.only(bottom: 24, left: 48, right: 48),
      ),
      fullscreen: const MaterialVideoControlsThemeData(
        volumeGesture: true,
        brightnessGesture: true,
        seekGesture: true,
        displaySeekBar: true,
        seekOnDoubleTap: true,
        bottomButtonBar: [
          MaterialPositionIndicator(),
        ],
      ),
      child: Scaffold(
        body: Video(
              controller: controller,
              aspectRatio: 16 / 9,
              pauseUponEnteringBackgroundMode: false,
              subtitleViewConfiguration: SubtitleViewConfiguration(),
              onEnterFullscreen: () {
                return SystemChrome.setEnabledSystemUIMode(
                  SystemUiMode.leanBack,
                  overlays: [],
                );
              },
              onExitFullscreen: () {
                return Future.value();
              },
            ),
        
      ),
    );
  }

}