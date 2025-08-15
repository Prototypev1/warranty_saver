import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';
import 'package:warranty_saver/core/presentation/common/utils/helpers/helper.dart';
import 'package:warranty_saver/core/presentation/common/widgets/buttons/clickable_text.dart';
import 'package:warranty_saver/core/presentation/common/widgets/buttons/custom_register_button.dart';
import 'package:warranty_saver/core/presentation/common/widgets/input_fields/custom_input_field.dart';
import 'package:warranty_saver/di/di.dart';
import 'package:warranty_saver/feature/home_page/presentation/home_page.dart';
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  bool _pwdVisible = false;
  bool _repeatPwdVisible = false;
  bool _emailValid = false;
  bool _pwdValid = false;
  bool _pwdsMatch = false;

  @override
  void initState() {
    super.initState();
    _registerPageCubit = getIt<RegisterPageCubit>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<RegisterPageCubit, RegisterPageState>(
          bloc: _registerPageCubit,
          listener: (context, state) {
            if (state is RegisterPageStateSuccess) {
              context.goNamed(HomePage.pageName);
            } else if (state is RegisterPageStateError) {
              //TODO(Marko) Create a custom error message here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is RegisterPageStateLoading;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.splash_page_warranty_saver.tr(),
                    style: CustomTextStyles.of(context).bold30.apply(color: Colors.black),
                  ),
                  const Spacer(),
                  CustomTextField(
                    controller: _emailController,
                    labelText: LocaleKeys.input_fields_email.tr(),
                    hintText: LocaleKeys.input_fields_example_email.tr(),
                    cursorColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    enabledBorderColor: Colors.grey.shade700,
                    prefixIcon: const Icon(Icons.email, color: Colors.black),
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    validator: Helper.validateEmail,
                    textInputAction: TextInputAction.next,
                    onChanged: (v) {
                      _emailValid = Helper.validateEmail(v) == null;
                      setState(() {});
                    },
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    labelText: LocaleKeys.input_fields_password.tr(),
                    hintText: LocaleKeys.input_fields_example_password.tr(),
                    cursorColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    enabledBorderColor: Colors.grey.shade700,
                    prefixIcon: Icon(Icons.password_rounded, color: Colors.black),
                    obscureText: !_pwdVisible,
                    suffixIcon: IconButton(
                      icon: Icon(_repeatPwdVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black),
                      onPressed: () => setState(() => _pwdVisible = !_pwdVisible),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    textInputAction: TextInputAction.next,
                    validator: (v) =>
                        Helper.validatePassword(v) ?? (_passwordController.text == v ? null : 'Passwords do not match'),
                    onChanged: (v) {
                      _pwdValid = Helper.validatePassword(v) == null;
                      _pwdsMatch = v == _repeatPasswordController.text;
                      setState(() {});
                    },
                  ),
                  CustomTextField(
                    controller: _repeatPasswordController,
                    labelText: LocaleKeys.input_fields_repeat_password.tr(),
                    hintText: LocaleKeys.input_fields_example_password.tr(),
                    cursorColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    enabledBorderColor: Colors.grey.shade700,
                    prefixIcon: Icon(Icons.password_rounded, color: Colors.black),
                    obscureText: !_repeatPwdVisible,
                    suffixIcon: IconButton(
                      icon: Icon(_pwdVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black),
                      onPressed: () => setState(() => _repeatPwdVisible = !_repeatPwdVisible),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    textInputAction: TextInputAction.done,
                    validator: (v) =>
                        Helper.validatePassword(v) ?? (_passwordController.text == v ? null : 'Passwords do not match'),
                    onChanged: (v) {
                      _pwdsMatch = v == _passwordController.text;
                      setState(() {});
                    },
                  ),
                  const Spacer(),
                  CustomRegisterButton(
                    isLoading: isLoading,
                    onPressed: (!isLoading && _emailValid && _pwdValid && _pwdsMatch)
                        ? () {
                            final emailError = Helper.validateEmail(_emailController.text);
                            final pwdError = Helper.validatePassword(_passwordController.text);
                            if (emailError != null || pwdError != null || !_pwdsMatch) return;
                            _registerPageCubit.registerUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          }
                        : null,
                    text: LocaleKeys.buttons_register.tr(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        LocaleKeys.register_page_got_account.tr(),
                        style: CustomTextStyles.of(context).regular14.apply(color: Colors.black),
                      ),
                      const SizedBox(width: 2),
                      ClickableText(
                        text: LocaleKeys.buttons_login.tr(),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
