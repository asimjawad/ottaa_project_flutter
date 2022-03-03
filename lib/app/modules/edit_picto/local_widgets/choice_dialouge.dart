import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottaa_project_flutter/app/routes/app_routes.dart';
import '../edit_picto_controller.dart';

class ChoiceDialogue extends GetView<EditPictoController> {
  ChoiceDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.EDITPICTO);
            },
            child: Text('edit'.tr),
          ),
          const SizedBox(
            height: 32,
          ),
          Text('Delete'),
        ],
      ),
    );
  }
}
