import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Page9.dart';

class conentv extends StatelessWidget {
  const conentv({
    super.key,
    required this.videoId,
  });
  final String videoId;

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
              const Padding(
                padding:  EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    C_Text(
                        w_font: FontWeight.w600,
                        text: 'مراجعة ممتعة عن تطور التكنولوجيا 😮',
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
                    const Positioned.fill(
                      top: 14,
                      left: 16,
                      right: 16,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: C_Text(
                              w_font: FontWeight.w600,
                              text:
                                  'بدأ الانسان التفكير في  التكنولوجيا عندما اكتشف كيفية استخدام الأدوات البسيطة لتلبية احتياجاته اليومية.علي مر العصور ،تطورت تفكيره ليشمل ابتكا الآلت و الأجهزة المتقدمه، حيث اكتسب فهما أعمق للطبية وز العلوم ،مما ساهمفي تطوير تكنولوجيا نحسين حياته.تمثل التكنولوجيا الحديثة نتاجا لتفكيره في تحسين الحياة من خلال التقدم العلمي،ومن خلالها يمكن للانسان الوصول الي مستويات جديدة من الانتاجية و الفعالية.',
                              ffamily: 'OMNES-ARABIC',
                              fsized: 18,
                              fcolor: Colors.black)),
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
                      Navigator.maybePop(context);
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => information()),
                      );
                    },
                    bF_Text: 32,
                    bHieght: 48,
                    bWidth: 130,
                    b_border: 14,
                  )
                ],
              )
              ,const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
