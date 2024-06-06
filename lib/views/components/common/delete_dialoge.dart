import 'package:flutter/material.dart';
import 'package:aabkr/views/components/common/setting_dialoge.dart';
import 'package:aabkr/views/components/common/dialog_button.dart';

class DeleteDialog extends StatelessWidget {
   DeleteDialog({super.key});
  TextEditingController control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SettingDialoge(
      outlinecolor: const Color(0xFFF9295A),
      buttons: Row(
        children: [
          DialogButton(
            title: "الغاء",
            outlinecolor: const Color(0xFF1FCC7B),
            func: () {},
          ),
          const SizedBox(
            width: 75,
          ),
          DialogButton(
            title: "حذف",
            outlinecolor: const Color(0xFFF9295A),
            func: () {},
          )
        ],
      ),controler:control ,
    );
  }
}
