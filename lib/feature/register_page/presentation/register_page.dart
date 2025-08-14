import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';
import 'package:warranty_saver/core/presentation/common/widgets/buttons/clickable_text.dart';
import 'package:warranty_saver/core/presentation/common/widgets/buttons/custom_register_button.dart';
import 'package:warranty_saver/di/di.dart';
import 'package:warranty_saver/feature/register_page/domain/cubit/register_page_cubit.dart';
import 'package:warranty_saver/feature/register_page/domain/cubit/register_page_state.dart';
import 'package:warranty_saver/gen/locale_keys.g.dart';

class RegisterPage extends StatefulWidget {
  static const pageName = 'register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterPageCubit _registerPageCubit;

  @override
  void initState() {
    super.initState();
    _registerPageCubit = getIt<RegisterPageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<RegisterPageCubit, RegisterPageState>(
        bloc: _registerPageCubit,
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.splash_page_warranty_saver.tr(),
                    style: CustomTextStyles.of(context).bold30.apply(color: Colors.black),
                  ),
                  const Spacer(),
                  CustomRegisterButton(onPressed: () {}, text: 'Register'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Or if you already have an account ',
                        style: CustomTextStyles.of(context).regular14.apply(color: Colors.black),
                      ),
                      ClickableText(
                        text: 'Login',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
