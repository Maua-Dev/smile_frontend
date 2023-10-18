import 'package:clean_flutter_template/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../../shared/widgets/footer_widget.dart';
import '../../../../../../../shared/widgets/logo_widget.dart';
import '../../../../../../../shared/widgets/title_pages_widget.dart';
import '../widgets/home_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: ScreenHelper.width(context) < ScreenHelper.breakpointTablet
              ? ScreenHelper.width(context)
              : ScreenHelper.breakpointTablet,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    ScreenHelper.width(context) < ScreenHelper.breakpointTablet
                        ? 16
                        : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoWidget(),
                TitlePagesWidget(text: S.of(context).homePageTitle),
                const SizedBox(height: 32),
                Text(
                  S.of(context).homePageSubtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: ScreenHelper.width(context) <
                              ScreenHelper.breakpointTablet
                          ? 18
                          : 20),
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 16,
                  spacing: 16,
                  children: [
                    HomeButtonWidget(
                        onPressed: () {
                          Modular.to.pushNamed('/create-user/');
                        },
                        text: 'Criar usuário'),
                    HomeButtonWidget(
                        onPressed: () {
                          Modular.to.pushNamed('/get-user/');
                        },
                        text: 'Procurar usuário'),
                    HomeButtonWidget(
                        onPressed: () {
                          Modular.to.pushNamed('/update-user/');
                        },
                        text: 'Update usuário'),
                    HomeButtonWidget(
                        onPressed: () {
                          Modular.to.pushNamed('/delete-user/');
                        },
                        text: 'Deletar usuário'),
                  ],
                ),
                const Spacer(),
                const FooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
