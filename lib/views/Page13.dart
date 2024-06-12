import 'package:aabkr/views/Page12.dart';
import 'package:aabkr/views/Page32.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class conentv extends StatelessWidget {
  const conentv(
      {super.key,
      required this.videoId,
      required this.videoTitle,
      required this.videoDis,
      required this.videoDbId});

  final String videoId;
  final String videoTitle;
  final String videoDis;
  final String videoDbId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: const YoutubePlayerFlags(
                    showLiveFullscreenButton: true,
                    enableCaption: true,
                    autoPlay: true,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    C_Text(
                        w_font: FontWeight.w600,
                        text: videoTitle,
                        ffamily: 'OMNES-ARABIC',
                        fsized: 20,
                        fcolor: Colors.black),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      fit: BoxFit.fill,
                      "assets/pics/Rectangle 10.png",
                      width: 800,
                      height: 332,
                    ),
                    Positioned.fill(
                      top: 14,
                      left: 16,
                      right: 16,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: SingleChildScrollView(
                            child: C_Text(
                                w_font: FontWeight.w600,
                                text: videoDis,
                                ffamily: 'OMNES-ARABIC',
                                fsized: 18,
                                fcolor: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    bText: 'السابق',
                    bcolor: Color.fromARGB(255, 255, 95, 132),
                    b_fun: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const V_List(),), (route) => false);
                    },
                    bF_Text: 32,
                    bHieght: 48,
                    bWidth: 130,
                    b_border: 14,
                  ),
                  const SizedBox(
                    width: 96,
                  ),
                  button(
                    bText: 'التالي',
                    bcolor: Color.fromRGBO(31, 204, 123, 1),
                    b_fun: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  Lmore(content: videoDis,currentVideoId: videoDbId),), (route) => false);
                    },
                    bF_Text: 32,
                    bHieght: 48,
                    bWidth: 130,
                    b_border: 14,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
