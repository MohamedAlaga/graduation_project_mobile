import 'package:aabkr/views/components/common/common_text.dart';
import 'package:flutter/material.dart';

class stork_text extends StatelessWidget {
  const stork_text({
    required this.Y_offdet,
    required this.w_sized,
    required this.Stext,
    required this.s_ctext,
    required this.sfamily,
    required this.sT_Sized,
    super.key,
  });
  final String Stext;
  final Color s_ctext;
  final String sfamily;
  final double sT_Sized;
  final FontWeight w_sized;
  final double Y_offdet;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          Stext,
          style: TextStyle(
            shadows: [Shadow(color: Colors.black, offset: Offset(0, Y_offdet))],
            fontSize: sT_Sized,
            fontFamily: sfamily,
            fontWeight: w_sized,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = Colors.black,
          ),
        ),
        C_Text(
          text: Stext,
          ffamily: sfamily,
          fsized: sT_Sized,
          fcolor: s_ctext,
          w_font: w_sized,
        )
      ],
    );
  }
}
