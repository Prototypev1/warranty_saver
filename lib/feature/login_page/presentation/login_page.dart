import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';
import 'package:warranty_saver/core/presentation/common/utils/helpers/helper.dart';
import 'package:warranty_saver/core/presentation/common/widgets/buttons/clickable_text.dart';
import 'package:warranty_saver/core/presentation/common/widgets/buttons/custom_register_button.dart';
import 'package:warranty_saver/core/presentation/common/widgets/checkboxes/custom_checkbox.dart';
import 'package:warranty_saver/core/presentation/common/widgets/input_fields/custom_input_field.dart';
import 'package:warranty_saver/di/di.dart';
import 'package:warranty_saver/feature/home_page/presentation/home_page.dart';
import 'package:warranty_saver/feature/login_page/domain/cubit/login_page_cubit.dart';
import 'package:warranty_saver/feature/login_page/domain/cubit/login_page_state.dart';
import 'package:warranty_saver/feature/register_page/presentation/register_page.dart';
import 'package:warranty_saver/gen/locale_keys.g.dart';

class LoginPage extends StatefulWidget {
  static const pageName = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginPageCubit _loginPageCubit;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _pwdVisible = false;
  bool _emailValid = false;
  bool _pwdValid = false;
  bool _accepted = false;

  @override
  void initState() {
    super.initState();
    _loginPageCubit = getIt<LoginPageCubit>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer(
          bloc: _loginPageCubit,
          listener: (context, state) {
            if (state is LoginPageStateSuccess) {
              context.goNamed(HomePage.pageName);
            } else if (state is LoginPageStateError) {
              //TODO(Marko) Create a custom error message here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is LoginPageStateLoading;
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
                      icon: Icon(_pwdVisible ? Icons.visibility : Icons.visibility_off, color: Colors.black),
                      onPressed: () => setState(() => _pwdVisible = !_pwdVisible),
                    ),
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                    textInputAction: TextInputAction.done,
                    validator: (v) => Helper.validatePassword(v) ?? (_passwordController.text == v ? null : 'pwd err'),
                    onChanged: (v) {
                      _pwdValid = Helper.validatePassword(v) == null;
                      setState(() {});
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCheckbox(
                        value: _accepted,
                        onChanged: (v) => setState(() => _accepted = v),
                      ),

                      Expanded(
                        child: Text(
                          LocaleKeys.login_page_keep_logged.tr(),
                          style: CustomTextStyles.of(context).regular14.apply(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomRegisterButton(
                    isLoading: isLoading,
                    onPressed: (!isLoading && _emailValid && _pwdValid && _accepted)
                        ? () {
                            final emailError = Helper.validateEmail(_emailController.text);
                            final pwdError = Helper.validatePassword(_passwordController.text);
                            if (emailError != null || pwdError != null) return;
                            _loginPageCubit.login(
                              email: _emailController.text,
                              password: _passwordController.text,
                              rememberMe: _accepted,
                            );
                          }
                        : null,
                    text: LocaleKeys.buttons_login.tr(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '${LocaleKeys.login_page_no_account.tr()} ',
                        style: CustomTextStyles.of(context).regular14.apply(color: Colors.black),
                      ),
                      const SizedBox(width: 2),
                      ClickableText(
                        text: LocaleKeys.buttons_register.tr(),
                        onPressed: () {
                          print('debug');
                          context.pushNamed(RegisterPage.pageName);
                        },
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
