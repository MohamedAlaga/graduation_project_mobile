import 'package:aabkr/controllers/corus_info.dart';
import 'package:aabkr/controllers/get_next_video_id.dart';
import 'package:aabkr/env_globals.dart';
import 'package:aabkr/views/Page12.dart';
import 'package:aabkr/views/Page13.dart';
import 'package:aabkr/views/Page9.dart';
import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/png_button.dart';
import 'package:aabkr/views/components/common/s_image.dart';
import 'package:aabkr/views/data.dart';
import 'package:aabkr/views/video-card.dart';
import 'package:flutter/material.dart';

class Lmore extends StatelessWidget {
  final String content;
  final String currentVideoId;
  const Lmore({Key? key, required this.content, required this.currentVideoId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PNG_button(
                    png_Logo: 'arrow_back .png',
                    func: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const V_List(),
                          ),
                          (route) => false);
                    },
                  ),
                  const SizedBox(
                    width: 38,
                  ),
                  const stork_text(
                      w_sized: FontWeight.w700,
                      Y_offdet: 6,
                      Stext: 'تعلم اكثر عن الموضوع',
                      s_ctext: Colors.white,
                      sfamily: 'AA-GALAXY',
                      sT_Sized: 32),
                  const SizedBox(
                    width: 68,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const S_Image(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Column(
                    children: [SizedBox(height: 20,),
                      C_Text(
                          w_font: FontWeight.w600,
                          text: content,
                          ffamily: 'OMNES-ARABIC',
                          fsized: 20,
                          fcolor: Colors.black),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 68),
                            child: button(
                                b_border: 14,
                                bHieght: 48,
                                bWidth: 130,
                                bText: 'السابق',
                                bcolor: Color.fromARGB(255, 255, 95, 132),
                                b_fun: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const V_List(),
                                      ),
                                      (route) => false);
                                },
                                bF_Text: 32),
                          ),
                          
                          button(
                              b_border: 14,
                              bHieght: 48,
                              bWidth: 130,
                              bText: 'التالي',
                              bcolor: Color.fromARGB(255, 31, 204, 123),
                              b_fun: () {
                                var tempVideo = allSystemVideos[
                                    getNextVideoIndex(currentVideoId)];
                                watchVideo(
                                    tempVideo["id"].toString(),
                                    extractVideoId(tempVideo['url']),
                                    tempVideo["title"],
                                    tempVideo["description"],
                                    context);
                              },
                              bF_Text: 32)
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
