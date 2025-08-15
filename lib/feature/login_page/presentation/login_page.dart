import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_saver/di/di.dart';
import 'package:warranty_saver/feature/add_page.dart/domain/cubit/login_page_cubit.dart';

class LoginPage extends StatefulWidget {
  static const pageName = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginPageCubit _loginPageCubit;

  @override
  void initState() {
    super.initState();
    _loginPageCubit = getIt<LoginPageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder(
          bloc: _loginPageCubit,
          builder: (context, state) {
            return Column();
          },
        ),
      ),
    );
  }
}
