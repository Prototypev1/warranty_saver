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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

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
                    ),
                    CustomTextField(
                      labelText: 'Password',
                      hintText: 'example password',
                      cursorColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      enabledBorderColor: Colors.grey.shade700,
                      prefixIcon: Icon(Icons.password_rounded, color: Colors.black),

                      suffixIcon: Icon(Icons.visibility_off, color: Colors.black),
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      textInputAction: TextInputAction.next,
                      validator: Helper.validatePassword,
                    ),
                    CustomTextField(
                      labelText: 'Repeat Password',
                      hintText: 'example password',
                      cursorColor: Colors.black,
                      focusedBorderColor: Colors.black,
                      enabledBorderColor: Colors.grey.shade700,
                      prefixIcon: Icon(Icons.password_rounded, color: Colors.black),

                      suffixIcon: Icon(Icons.visibility_off, color: Colors.black),
                      hintStyle: TextStyle(color: Colors.grey.shade700),
                      textInputAction: TextInputAction.done,

                      validator: Helper.validatePassword,
                    ),
                    const Spacer(),
                    CustomRegisterButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _registerPageCubit.registerUser(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
                      },
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
