import 'package:flutter/material.dart';
import 'package:aabkr/views/components/common/setting_dialoge.dart';
import 'package:aabkr/views/components/common/dialog_button.dart';
class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingDialoge(
                outlinecolor: Color(0xFFF9295A),
                buttons: Row(
                  children: [
                    DialogButton(
                      title: "الغاء",
                      outlinecolor: Color(0xFF1FCC7B),
                    ),
                    SizedBox(
                      width: 75,
                    ),
                    DialogButton(title: "حذف",outlinecolor:Color(0xFFF9295A))
                  ],
                ),
              );
  }
}