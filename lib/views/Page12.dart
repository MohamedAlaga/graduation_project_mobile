import 'package:aabkr/controllers/checkPass.dart';
import 'package:aabkr/views/Page23.dart';
import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/degree.dart';
import 'package:aabkr/views/components/common/dialog_button.dart';
import 'package:aabkr/views/components/common/final_but.dart';
import 'package:aabkr/views/components/common/png_button.dart';
import 'package:aabkr/views/components/common/proggress_bar.dart';
import 'package:aabkr/views/components/common/s_image.dart';
import 'package:aabkr/views/components/common/setting_dialoge.dart';
import 'package:aabkr/views/components/common/svg_button.dart';
import 'package:aabkr/views/data.dart';
import 'package:aabkr/views/page25.dart';
import 'package:aabkr/views/video-card.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// replace information widget

class V_List extends StatelessWidget {
  const V_List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController control = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 237),
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(25.0),
          child: S_Image(),
        ),
        leading: Column(
          children: [
            const SizedBox(height: 7),
            PNG_button(png_Logo: 'Gear.png', func:() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingDialoge(
                          buttons: DialogButton(
                            title: "الدخول الي الاعدادات",
                            func: () async {
                              int pass =
                                  await checkPassController(control.text);
                              control.text = '';
                              if (pass == 1) {
                                Navigator.pop(context);
                                var prefs =
                                    await SharedPreferences.getInstance();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Page25(
                                          token: prefs
                                              .getString('token')
                                              .toString())),
                                );
                              } else if (pass == 0) {
                                       AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.topSlide,
                                          title: "بيانات المستخدم غير صحيحة",
                                          btnOkText: "حسنا",
                                          btnOkOnPress: () {}).show();
                              } else {AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.topSlide,
                                            title: "حدث خطأ ما، يرجى المحاولة مرة أخرى",
                                            btnOkText: "حسنا",
                                            btnOkOnPress: (){}
                                          ).show();}
                            },
                          ),
                          controler: control,
                        );
                      });}),
            const SizedBox(
              height: 1,
            ),
            const C_Text(
                w_font: FontWeight.w700,
                text: 'الاعدادات',
                ffamily: 'OMNES-ARABIC',
                fsized: 11,
                fcolor: Color.fromARGB(255, 234, 159, 63)),
          ],
        ),
        title: const stork_text(
            w_sized: FontWeight.w700,
            Y_offdet: 6,
            Stext: 'انا الكمبيوتر',
            s_ctext: Colors.white,
            sfamily: 'AA-GALAXY',
            sT_Sized: 36),
        actions:  [
          InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => community()));},
            child: const Column(
              children: [
                SizedBox(height: 7),
                SVG_button(svg_Logo: 'Frame 43.svg', svg_widget: community()),
                SizedBox(
                  height: 1,
                ),
                C_Text(
                    w_font: FontWeight.w700,
                    text: 'المجتمع',
                    ffamily: 'OMNES-ARABIC',
                    fsized: 11,
                    fcolor: Color.fromARGB(255, 234, 159, 63)),
              ],
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 250, 237),
        surfaceTintColor: Colors.transparent,
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                    ),
                    child: progres_bar(percentage: 25),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final video = videos[index];
                      final int xvindex = index;

                      return VideoCard(
                        video: video,
                        vindex: xvindex,
                      );
                    }, childCount: videos.length),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, left: 16),
                    child: ConditionalWidget(value: 50),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 16, left: 16, top: 16, bottom: 16),
                    child: FCondition(value: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}