import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:humantek_test/features/forgetPassword/presentation/bloc/forget_password_bloc.dart';
import 'package:humantek_test/features/forgetPassword/presentation/screen/set_new_password_view.dart';

class ForgetPasswordFormView extends StatefulWidget {
  const ForgetPasswordFormView({super.key});

  @override
  State<ForgetPasswordFormView> createState() => _ForgetPasswordFormViewState();
}

class _ForgetPasswordFormViewState extends State<ForgetPasswordFormView> {
  TextEditingController emailController = TextEditingController();

  bool isObscure = true;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordFailureState) {
          print('on screen: submission failure');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.replaceAll('Exception:', '')),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is ForgetPasswordSuccessState) {
          print('on screen: success');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SetNewPasswordView(),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Set new Password"),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Forget Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 7,
                        sigmaY: 7,
                      ),
                      child: const SizedBox(
                        height: 250,
                        width: 360,
                      ),
                    ),
                    Container(
                      // height: 280,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.20),
                          )
                        ],
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1.0,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.4),
                            Colors.white.withOpacity(0.2),
                          ],
                          stops: const [0.0, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: _key,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Forget Password",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null) return "Enter Email";
                                    if (value.isEmpty ||
                                        !RegExp(
                                          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                                        ).hasMatch(value)) {
                                      return "Enter Email correctly";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                    ),
                                    labelText: 'Email',
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        state is! ForgetPasswordLoadingState
                                            ?
                                            // () =>
                                            context
                                                .read<ForgetPasswordBloc>()
                                                .add(
                                                  ForgetPasswordButtonPressed(
                                                    email: emailController.text,
                                                  ),
                                                )
                                            : null;
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16.0,
                                        right: 12.0,
                                        bottom: 16.0,
                                        left: 12.0,
                                      ),
                                      child: state is ForgetPasswordLoadingState
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : const Text(
                                              'Continue',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
