import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/png_button.dart';
import 'package:aabkr/views/components/common/s_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Page9.dart';

class community extends StatelessWidget {
  const community({super.key});

  Future<void> _launchURL() async {
    const url = 'https://discord.gg/aVC8gGZr';
    if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(25.0),
          child: S_Image(),
        ),
        leading: PNG_button(
          png_Logo: 'arrow_back .png',
          func: () {
            Navigator.pop(context);
          },
        ),
        title: const stork_text(
          w_sized: FontWeight.w700,
          Stext: 'المجتمع',
          s_ctext: Colors.white,
          sfamily: 'AA-GALAXY',
          sT_Sized: 38,
          Y_offdet: 6,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 250, 237),
        surfaceTintColor: Colors.transparent,
        elevation: 10,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: C_Text(
                  w_font: FontWeight.w600,
                  text:
                      'مجتمع المنصه علي ديسكورد يجتمع عليه كل العباقرةللتواصل و التعارف و مشاركه الافكار',
                  ffamily: 'OMNES-ARABIC',
                  fsized: 20,
                  fcolor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      fit: BoxFit.fill,
                      "assets/pics/rec12.svg",
                      width: 150,
                      height: 220,
                    ),
                    Positioned.fill(
                      top: 11,
                      left: 15,
                      right: 15,
                      bottom: 11,
                      child: Align(
                        alignment: Alignment.center,
                        child: YoutubePlayer(
                          controller: YoutubePlayerController(
                            initialVideoId: 'gLpt8bfF_uk',
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
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const C_Text(
                w_font: FontWeight.w600,
                text: '1- اتبع الخطوات المشروحة في الفيديو🧐 ',
                ffamily: 'OMNES-ARABIC',
                fsized: 20,
                fcolor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const C_Text(
                w_font: FontWeight.w600,
                text: '2- التزم بأداب واخلاقيات المجتمع📃',
                ffamily: 'OMNES-ARABIC',
                fsized: 20,
                fcolor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const C_Text(
                w_font: FontWeight.w600,
                text: '3- شارك رأيك بحرية و تفاعل باستمرار 💭',
                ffamily: 'OMNES-ARABIC',
                fsized: 20,
                fcolor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const C_Text(
                w_font: FontWeight.w600,
                text: '4- كون صداقات وتواصل بدون خوف😊',
                ffamily: 'OMNES-ARABIC',
                fsized: 20,
                fcolor: Colors.black,
              ),
              const SizedBox(
                height: 40,
              ),
              button(
                bText: 'الانضمام الي المجتمع',
                bcolor: const Color.fromRGBO(31, 204, 123, 1),
                b_fun: _launchURL,
                bF_Text: 32,
                bHieght: 48,
                bWidth: 312,
                b_border: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}