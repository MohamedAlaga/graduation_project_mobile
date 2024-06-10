import 'package:aabkr/controllers/mark_video_as_watched.dart';
import 'package:aabkr/views/Page13.dart';
import 'package:aabkr/views/Page32.dart';
import 'package:aabkr/views/components/common/buttons.dart';
import 'package:aabkr/views/data.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

watchVideo(String dbId, String id, String title, String desc,
      BuildContext context) async {
    var watched = await markVideoAsWatched(dbId);
    if (watched == 1) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => conentv(
              videoTitle: title,
              videoId: id,
              videoDis: desc,videoDbId: dbId,
            ),
          ),
          (route) => false);
    } else {
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: "حدث خطأ ما، يرجى المحاولة مرة أخرى",
              btnOkText: "حسنا",
              btnOkOnPress: () {})
          .show();
    }
  }

class videoCard extends StatelessWidget {
  final Video video;
  final int vindex;
  final bool isEnabled;

  const videoCard({
    Key? key,
    required this.video,
    required this.vindex,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: isEnabled
              ? () async {
                  watchVideo(video.dbId, video.id, video.title,
                      video.description, context);
                }
              : null,
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      InkWell(
                        onTap: isEnabled
                            ? () async {
                                watchVideo(video.dbId, video.id, video.title,
                                    video.description, context);
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Container(
                            width: double.infinity,
                            height: 240,
                            decoration: BoxDecoration(
                                color: isEnabled
                                    ? Color.fromARGB(255, 31, 204, 123)
                                    : Color.fromARGB(255, 31, 104, 70),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    color: Colors.black,
                                  ),
                                ]),
                            child: Ink(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: Image.network(
                                          video.thumbnailUrl,
                                          height: 166,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(video.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: isEnabled
                                              ? Colors.white
                                              : const Color.fromARGB(
                                                  255, 179, 179, 179)))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        width: 50,
                        height: 50,
                        top: -8,
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
                                color: isEnabled
                                    ? Color.fromARGB(255, 255, 210, 0)
                                    : Color.fromARGB(255, 145, 127, 51),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black, offset: Offset(0, 4))
                                ]),
                            child: Text(' ${(vindex + 1).toString()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 36,
                                    color: Colors.black)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: button(
                        b_border: 20,
                        bHieght: 56,
                        bWidth: double.infinity,
                        bText: 'تعلم اكثر عن التكنولوجيا',
                        fcolor: isEnabled
                            ? Colors.white
                            : Color.fromARGB(255, 179, 179, 179),
                        bcolor: isEnabled
                            ? Color.fromARGB(255, 255, 95, 132)
                            : Color.fromARGB(255, 138, 53, 72),
                        b_fun: () {
                          if (isEnabled) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Lmore(
                                        content: video.description,currentVideoId: video.dbId,
                                      )),
                            );
                          }
                        },
                        bF_Text: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


////////////////////////////////////////////
///
///
///الكود اللي جاي هو هنضيف الفانكشن اللي علي اساسها هنستخدم الفانكشن بتاعت اللي هتسمع في الداتا بيز
///
///
///
///
///// class videoCard extends StatelessWidget {
//   final Video video;
//   final int vindex;
//   final Function bfun;
//   final Function(int) markAsWatched;

//   const videoCard({
//     Key? key,
//     required this.video,
//     required this.vindex,
//     required this.bfun,
//     required this.markAsWatched,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 10),
//         GestureDetector(
//           onTap: () async {
//             await markAsWatched(video.id);
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => conentv(
//                   video_title: video.title,
//                   videoId: video.name,
//                   video_dis: video.description,
//                 ),
//               ),
//             );
//           },
//           child: Column(
//             children: [
//               Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   InkWell(
//                     onTap: () async {
//                       await markAsWatched(video.id);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => conentv(
//                             video_title: video.title,
//                             videoId: video.name,
//                             video_dis: video.description,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 16, right: 16),
//                       child: Container(
//                         width: double.infinity,
//                         height: 240,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 31, 204, 123),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(
//                             color: Colors.black,
//                             style: BorderStyle.solid,
//                             width: 2,
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: Offset(0, 4),
//                               color: Colors.black,
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: [
//                             SizedBox(height: 18),
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.black,
//                                   width: 2.0,
//                                 ),
//                                 borderRadius: BorderRadius.circular(16.0),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16.0),
//                                 child: Image.network(
//                                   video.thumbnailUrl,
//                                   height: 166,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               video.title,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 15,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     width: 50,
//                     height: 50,
//                     top: -8,
//                     right: 8,
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.black,
//                             width: 2.0,
//                           ),
//                           shape: BoxShape.circle,
//                           color: Color.fromARGB(255, 255, 210, 0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black,
//                               offset: Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: Center(
//                           child: Text(
//                             '${vindex + 1}',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 36,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.all(18),
//                 child: button(
//                   b_border: 20,
//                   bHieght: 56,
//                   bWidth: double.infinity,
//                   bText: 'تعلم اكثر عن التكنولوجيا',
//                   bcolor: Color.fromARGB(255, 255, 95, 132),
//                   b_fun: () async {
//                     await markAsWatched(
//                         video.id); // Call the function and wait for completion
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => conentv(
//                           video_title: video.title,
//                           videoId: video.name,
//                           video_dis: video.description,
//                         ),
//                       ),
//                     );
//                   },
//                   bF_Text: 28,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
