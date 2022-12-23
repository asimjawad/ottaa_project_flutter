import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ottaa_project_flutter/application/common/app_images.dart';
import 'package:ottaa_project_flutter/application/common/extensions/translate_string.dart';
import 'package:ottaa_project_flutter/application/router/app_routes.dart';
import 'package:ottaa_project_flutter/application/theme/app_theme.dart';
import 'package:ottaa_project_flutter/presentation/screens/profile/ui/profile_chooser_button_widget.dart';
import 'package:ottaa_ui_kit/widgets.dart';

class ProfileHelpScreen extends StatelessWidget {
  const ProfileHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: OTTAAAppBar(
        title: Text("profile.help.help".trl),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActionCard(
                title: "profile.help.title1".trl,
                subtitle: '',
                trailingImage: const AssetImage(AppImages.kProfileHelpIcon1),
                onPressed: () => context.push(AppRoutes.profileFAQScreen),
              ),
              const SizedBox(
                height: 16,
              ),
              ActionCard(
                title: "profile.help.title2".trl,
                subtitle: '',
                trailingImage: const AssetImage(AppImages.kProfileHelpIcon2),
                onPressed: () async {
                  bool? wantsCall = await BasicBottomSheet.show<bool>(context,
                      title: "Soporte",
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Mail:", style: textTheme.headline3),
                            const SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO: Openurl
                              },
                              child: Text(
                                "support@ottaaproject.com",
                                style: textTheme.headline3?.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          "¿Desea comunicarse por teléfono con soporte técnico?",
                          textAlign: TextAlign.center,
                          style: textTheme.headline3?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                      okButtonText: "Llamar",
                      cancelButtonText: "Cancelar",
                      cancelButtonEnabled: true);

                  if (wantsCall == true) {
                    //TODO: call behaviour
                  }
                },
                imageSize: const Size(129, 96),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
