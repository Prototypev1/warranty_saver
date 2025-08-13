import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_saver/core/presentation/common/widgets/buttons/custom_register_button.dart';
import 'package:warranty_saver/di/di.dart';
import 'package:warranty_saver/feature/register_page/domain/cubit/register_page_cubit.dart';
import 'package:warranty_saver/feature/register_page/domain/cubit/register_page_state.dart';

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
            body: Column(
              children: [
                CustomRegisterButton(onPressed: () {}, text: 'Register'),
              ],
            ),
          );
        },
      ),
    );
  }
}
