import 'package:clean_flutter_template/shared/domain/entities/user.dart';
import 'package:clean_flutter_template/shared/themes/app_colors.dart';
import 'package:clean_flutter_template/shared/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../../shared/helpers/errors/errors.dart';
import '../../../../../../../shared/helpers/utils/screen_helper.dart';
import '../../../../../../../shared/widgets/footer_widget.dart';
import '../../../../../../../shared/widgets/text_field_widget.dart';
import '../../../../../../../shared/widgets/title_pages_widget.dart';
import '../../controller/create_user_controller.dart';
import '../states/create_user_state.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  var controller = Modular.get<CreateUserController>();
  final formKey = GlobalKey<FormState>();

  Widget _buildError(Failure error) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Text(error.message,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.white,
              )),
    );
  }

  Widget _buildSuccess(User user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Text(S.of(context).successCreateUser('', user.name),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.white,
              )),
    );
  }

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
            children: [
              const LogoWidget(),
              TitlePagesWidget(text: S.of(context).createPageTitle),
              Observer(builder: (_) {
                var state = controller.state;

                if (state is ErrorCreateState) {
                  return _buildError(state.error);
                } else if (state is SuccessCreateState) {
                  return _buildSuccess(state.user);
                } else {
                  return const SizedBox.shrink();
                }
              }),
              Observer(builder: (_) {
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(
                        title: S.of(context).fieldName,
                        hintText: S.of(context).fieldHintName,
                        onChanged: controller.setUserName,
                        validation: controller.validateUserName,
                      ),
                      TextFieldWidget(
                        title: S.of(context).fieldEmail,
                        hintText: S.of(context).fieldHintEmail,
                        onChanged: controller.setUserEmail,
                        validation: controller.validateUserEmail,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 250,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await controller.createUser();
                              }
                            },
                            child: controller.state is LoadingCreateState
                                ? CircularProgressIndicator(
                                    color: AppColors.white,
                                  )
                                : Text(
                                    S.of(context).registerTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: AppColors.white),
                                  )),
                      ),
                    ],
                  ),
                );
              }),
              const Spacer(),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    ));
  }
}
