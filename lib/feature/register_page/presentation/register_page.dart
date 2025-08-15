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
          listener: (context, state) {},
          builder: (context, state) {
            if (state is RegisterPageStateInitial) {
              final canSubmit =
                  Helper.validateEmail(_emailController.text) == null &&
                  Helper.validatePassword(_passwordController.text) == null &&
                  _passwordController.text.isNotEmpty &&
                  _passwordController.text == _repeatPasswordController.text;
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
                      labelText: 'Email',
                      hintText: 'exampleemail@gmail.com',
                      cursorColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      enabledBorderColor: Colors.grey.shade700,
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      prefixIcon: const Icon(Icons.email, color: Colors.black),
                      validator: Helper.validateEmail,
                      textInputAction: TextInputAction.next,
                      onChanged: (v) {
                        _emailValid = Helper.validateEmail(v) == null;
                        setState(() {});
                      },
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'example password',
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
                          Helper.validatePassword(v) ??
                          (_passwordController.text == v ? null : 'Passwords do not match'),
                      onChanged: (v) {
                        _pwdValid = Helper.validatePassword(v) == null;
                        _pwdsMatch = v == _repeatPasswordController.text;
                        setState(() {});
                      },
                    ),
                    CustomTextField(
                      controller: _repeatPasswordController,
                      labelText: 'Repeat Password',
                      hintText: 'example password',
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
                      onChanged: (v) {
                        _pwdsMatch = v == _passwordController.text;
                        setState(() {});
                      },
                      validator: (v) =>
                          Helper.validatePassword(v) ??
                          (_passwordController.text == v ? null : 'Passwords do not match'),
                    ),
                    const Spacer(),
                    CustomRegisterButton(
                      onPressed: (_emailValid && _pwdValid && _pwdsMatch)
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
                      isLoading: state is RegisterPageStateLoading,
                      text: 'Register',
                    ),
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
              );
            } else if (state is RegisterPageStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RegisterPageStateSuccess) {
              return const Center(child: Text('Registration Successful!'));
            } else if (state is RegisterPageStateError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
