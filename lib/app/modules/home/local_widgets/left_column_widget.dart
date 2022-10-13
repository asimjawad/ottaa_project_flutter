import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ottaa_project_flutter/app/modules/home/local_widgets/empty_text_dialog_widget.dart';
import 'package:ottaa_project_flutter/app/routes/app_routes.dart';
import 'package:ottaa_project_flutter/app/theme/app_theme.dart';
import 'package:ottaa_project_flutter/app/modules/home/home_controller.dart';
import 'package:ottaa_project_flutter/app/utils/CustomAnalytics.dart';

class LeftColumnWidget extends StatelessWidget {
  LeftColumnWidget({Key? key}) : super(key: key);
  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double verticalSize = MediaQuery.of(context).size.height;
    double horizontalSize = MediaQuery.of(context).size.width;
    return Container(
      height: verticalSize * 0.5,
      width: horizontalSize * 0.10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(
            child: GestureDetector(
              onTap: () async{
                // showDialog(
                //   context: context,
                //   barrierDismissible: false,
                //   barrierColor: Colors.transparent,
                //   builder: (context) {
                //     return EmptyTextDialogWidget(
                //       text: "we_are_working_on_this_feature".tr,
                //     );
                //   },
                // );
                // await _homeController.startTimerForDialogueExit();
                // CustomAnalyticsEvents.setEventWithParameters("Touch",
                //     CustomAnalyticsEvents.createMyMap('Principal', 'Games'));
                Get.toNamed(AppRoutes.ONBOARDING);
              },
              child: Center(
                  child: Icon(
                // Icons.gamepad,
                Icons.videogame_asset,
                color: Colors.white,
                size: horizontalSize / 12,
              )),
            ),
          ),
          FittedBox(
            child: GestureDetector(
              onTap: () {
                CustomAnalyticsEvents.setEventWithParameters(
                    "Touch",
                    CustomAnalyticsEvents.createMyMap(
                        'Principal', 'Group Galery'));
                if (_homeController.sentencePicts.isEmpty) {
                  Get.toNamed(AppRoutes.PICTOGRAMGROUP);
                } else {
                  if (_homeController.sentencePicts.last.texto.es ==
                      "agregar") {
                    _homeController.toId = 0;
                    _homeController.fromAdd = true;
                    Get.toNamed(AppRoutes.PICTOGRAMGROUP);
                  } else {
                    _homeController.toId =
                        _homeController.sentencePicts.last.id;
                    _homeController.fromAdd = true;
                    Get.toNamed(AppRoutes.PICTOGRAMGROUP);
                  }
                }
              },
              child: Center(
                child: Icon(
                  Icons.image,
                  color: Colors.white,
                  size: horizontalSize / 10,
                ),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: kOTTAAOrangeNew,
        borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
      ),
    );
  }
}
