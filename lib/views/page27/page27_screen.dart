import 'package:aabkr/views/commonComponents/core/utils/constants.dart';
import 'package:aabkr/views/commonComponents/galaxy_text.dart';
import 'package:aabkr/views/quizPage/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../commonComponents/common_button.dart';
import '../commonComponents/core/utils/size_config.dart';
import '../commonComponents/core/utils/styles.dart';

class Page27 extends StatelessWidget {
  Page27({super.key, this.name = "اسم الطالب"});
  final String name;

  Future<void> _createPdf(BuildContext context) async {
    final pdf = pw.Document();

    // Load the custom font
    final fontData = await rootBundle.load('assets/fonts/Cairo-Bold.ttf');
    final ttf = pw.Font.ttf(fontData);

    final image = await imageFromAssetBundle('assets/pics/cert.png');

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Positioned.fill(
                child: pw.Image(image, fit: pw.BoxFit.fill),
              ),
              pw.Positioned(
              left: 0,
              right: 0,
              top: 250,
              child: pw.Center(
                child: pw.Text(
                  name,
                  style: pw.TextStyle(font: ttf, fontSize: 40),textDirection: pw.TextDirection.rtl,),
                ),
              ),
            ],
          );
        },
      ),
    );
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: GalaxyText(fontSize: 32, text: 'شهادة  المستوى')),
        backgroundColor: Colors.transparent,
        leadingWidth: 50,
        centerTitle: true,
        elevation: 0,
        actions: const [
          SizedBox(
            width: 45,
          )
        ],
        leading: Center(
          child: InkWell(
              onTap: () {Navigator.maybePop(context);},
              child: SvgPicture.asset(
                'assets/pics/arrow_back.svg',
                fit: BoxFit.scaleDown,
              )),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(25.0),
          child:  Image.asset('assets/pics/app_bar_line.png',fit: BoxFit.fill,width: double.infinity,),
    ),
      ),
      backgroundColor: mainPageColor,
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
                top: 20,
                right: 70,
                left: 70,
                child: Row(
                  children: [
                    Text('🥳', style: Styles.style32w600),
                    Text(' مبروووك ', style: Styles.style36black),
                    Text('🥳', style: Styles.style32w600),
                  ],
                )),
            Positioned(
                top: 90,
                right: 16,
                left: 16,
                child: Container(
                  width: 294,
                  height: 203,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.black)),
                  child: Image.asset(
                    'assets/pics/cert.png',
                    width: 294,
                    height: 203,
                    fit: BoxFit.fill,
                  ),
                )),
            Positioned(
              top: 205,
              right: 70,
              left: 70,
              child: Center(
                  child: Text(
                name,
                style: Styles.style32black,
              )),
            ),
            Positioned(
              top: 340,
              right: 68,
              left: 68,
              child: InkWell(
                onTap: () async {
                  await _createPdf(context);
                },
                child: CommonButton(
                    buttonColor: const Color(0xff00dcea), text: 'تحميل الشهادة'),
              ),
            ),
            Positioned(
                top: 449,
                right: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('انت الأن مؤهل للانتقال',
                        style: Styles.style32black),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.05,
                    ),
                    const Text('الي المستوي الثاني',
                        style: Styles.style32black),
                  ],
                )),
            Positioned(
                bottom: 40,
                right: 24,
                left: 22,
                child: CommonButton(
                    fun: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizPage(
                              quizQuestions: [],
                            ),
                          ),
                          (route) => false);
                    },
                    buttonColor: const Color(0xff1fcc7b),
                    text: 'انتقل الي المستوى الثاني')),
          ],
        ),
      ),
    );
  }

  Future<pw.ImageProvider> imageFromAssetBundle(String path) async {
    final ByteData data = await rootBundle.load(path);
    return pw.MemoryImage(data.buffer.asUint8List());
  }
}