import 'package:aabkr/views/Page13.dart';
import 'package:aabkr/views/Page32.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/data.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final int vindex;

  const VideoCard({Key? key, required this.video, required this.vindex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => conentv(
                  videoId: video.title,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => conentv(
                            videoId: video.id,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        width: double.infinity,
                        height: 240,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 31, 204, 123),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2),
                            boxShadow: const [
                               BoxShadow(
                                offset: Offset(0, 4),
                                color: Colors.black,
                              ),
                            ]),
                        child: Ink(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 18,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16,right: 16),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.network(
                                      video.thumbnailUrl,
                                      width: double.infinity,
                                      height: 160,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              C_Text(
                                  w_font: FontWeight.w600,
                                  text: video.title,
                                  ffamily: 'OMNES-ARABIC',
                                  fsized: 15,
                                  fcolor: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    width: 50,
                    height: 50,
                    top: -16,
                    right: 8,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 255, 210, 0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black, offset: Offset(0, 4))
                            ]),
                        child: C_Text(
                            w_font: FontWeight.w600,
                            text: (vindex + 1).toString(),
                            ffamily: 'OMNES-ARABIC',
                            fsized: 36,
                            fcolor: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: button(
                    b_border: 20,
                    bHieght: 56,
                    bWidth: double.infinity,
                    bText: 'تعلم اكثر عن التكنولوجيا',
                    bcolor:const Color.fromARGB(255, 255, 95, 132),
                    b_fun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Lmore()),
                      );
                    },
                    bF_Text: 28),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
