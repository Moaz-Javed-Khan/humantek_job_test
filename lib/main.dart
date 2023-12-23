import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:humantek_test/features/forgetPassword/Data/datasource/forget_password_remote_datasource.dart';
import 'package:humantek_test/features/forgetPassword/Data/repositories/forget_password_repository_imple.dart';
import 'package:humantek_test/features/forgetPassword/presentation/bloc/forget_password_bloc.dart';
import 'package:humantek_test/features/login/Data/datasource/login_remote_datasource.dart';
import 'package:humantek_test/features/login/Data/repositories/login_repository_imple.dart';
import 'package:humantek_test/features/login/presentation/screen/signin_view.dart';
import 'package:humantek_test/features/login/presentation/bloc/login_bloc.dart';
import 'package:humantek_test/features/signup/Data/datasource/signup_remote_datasource.dart';
import 'package:humantek_test/features/signup/Data/repositories/signup_repository_imple.dart';
import 'package:humantek_test/features/signup/presentation/bloc/signup_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      'pk_test_51O4h5dI6fkbmsqprxRlQRFiyTGjLbIVXxWM3YLqXetrGGQvTknqLq8XbtdIdXJKr2KsARZkkJOV4LnWHyfDqTdVS00xiiGCGx5';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            loginRepo: LoginRepositoryImple(
              remotedatasources: LoginRemoteDatasourceImpl(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => SignupBloc(
            signupRepo: SignupRepositoryImple(
              remotedatasources: SignupRemoteDatasourceImpl(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordBloc(
            forgetPasswordRepo: ForgetPasswordRepositoryImple(
              remotedatasources: ForgetPasswordRemoteDatasourceImpl(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'HumanTek Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.orange,
          ),
          useMaterial3: true,
        ),
        home: const SigninView(),
      ),
    );
  }
}
