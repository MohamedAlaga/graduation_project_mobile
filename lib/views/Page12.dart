import 'package:aabkr/views/Page23.dart';
import 'package:aabkr/views/Page9.dart';
import 'package:aabkr/views/components/common/S_Text.dart';
import 'package:aabkr/views/components/common/common_text.dart';
import 'package:aabkr/views/components/common/degree.dart';
import 'package:aabkr/views/components/common/final_but.dart';
import 'package:aabkr/views/components/common/proggress_bar.dart';
import 'package:aabkr/views/components/common/s_image.dart';
import 'package:aabkr/views/components/common/svg_button.dart';
import 'package:aabkr/views/data.dart';
import 'package:aabkr/views/video-card.dart';
import 'package:flutter/material.dart';

// replace information widget

class V_List extends StatelessWidget {
  const V_List({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // PNG_button(png_Logo: 'Gear.png'),
                    SVG_button(
                        svg_Logo: 'Frame 44.svg', svg_widget: information()),
                    SizedBox(
                      height: 1,
                    ),
                    C_Text(
                        w_font: FontWeight.w700,
                        text: 'الاعدادات',
                        ffamily: 'OMNES-ARABIC',
                        fsized: 11,
                        fcolor: Color.fromARGB(255, 234, 159, 63)),
                  ],
                ),
                SizedBox(
                  width: 75,
                ),
                stork_text(
                    w_sized: FontWeight.w700,
                    Y_offdet: 6,
                    Stext: 'انا الكمبيوتر',
                    s_ctext: Colors.white,
                    sfamily: 'AA-GALAXY',
                    sT_Sized: 36),
                SizedBox(
                  width: 75,
                ),
                Column(
                  children: [
                    SVG_button(
                        svg_Logo: 'Frame 43.svg', svg_widget: community()),
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
              ],
            ),
          ),
          S_Image(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                    ),
                    child: progres_bar(percentage: 25),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final video = videos[index];
                      final int xvindex = index;

                      return videoCard(
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
