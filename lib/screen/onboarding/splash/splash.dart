import 'dart:async';
import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/screen/onboarding/login/login_responsive.dart';
import 'package:beonchat_admin/service/firebase/firebase_service.dart';
import 'package:beonchat_admin/widget/loader/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key, required this.type}) : super(key: key);

  final int type;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  VideoPlayerController? videoController;
  bool endVideo = false;

  @override
  void initState() {
    initSplash();
    getCurrentAppTheme(context);
    // TODO: implement initState
    super.initState();
  }

  void getCurrentAppTheme(BuildContext context) async {
    Provider.of<AppThemeProvider>(context, listen: false).darkTheme =
        await Provider.of<AppThemeProvider>(context, listen: false)
            .darkThemePreference
            .getBool(key: "theme");
  }

  initSplash() async {
    await FirebaseServices().getFCMToken();

    videoController =
        VideoPlayerController.asset('assets/launch_video_beonchat.mp4');
    await videoController!.initialize().then((value) {
      Timer(const Duration(milliseconds: 200), () {
        setState(() {
          videoController!.play();
          endVideo = true;
        });
      });
    });
    videoController!.addListener(
      () async {
        if (videoController != null &&
            videoController!.value.position ==
                videoController!.value.duration) {
          if (endVideo) {
            setState(() {
              endVideo = false;
            });
            print(
                "============================= video end =============================");
            Navigator.pushNamedAndRemoveUntil(
                context, LoginResponsive.routeName, (route) => false);

            /// next page
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours().black,
      body: Center(
        child: videoController != null && videoController!.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoController!.value.aspectRatio,
                child: VideoPlayer(
                  videoController!,
                ),
              )
            : Loader().showLoader(),
      ),
    );
  }
}
