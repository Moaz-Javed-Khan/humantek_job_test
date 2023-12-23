import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:humantek_test/features/home/presentation/home_view.dart';
import 'package:humantek_test/features/login/presentation/screen/signin_view.dart';
import 'package:humantek_test/features/signup/presentation/bloc/signup_bloc.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFailureState) {
          print('on screen: submission failure');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.replaceAll('Exception:', '')),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is SignupSuccessState) {
          print('on screen: success');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Accont Created"),
            ),
          );
        }
      },
      builder: (context, state) {
        return Center(
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 24.0,
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "SIGN UP",
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
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty
                                    // ||
                                    //     !RegExp(
                                    //       r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
                                    //     ).hasMatch(value)
                                    ) {
                                  return "Enter Password correctly";
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                              obscureText: isObscure,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    state is! SignupLoadingState
                                        ?
                                        // () =>
                                        context.read<SignupBloc>().add(
                                              SignupButtonPressed(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
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
                                  child: state is SignupLoadingState
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : const Text(
                                          'Signup',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SigninView(),
                                    ),
                                  );
                                },
                                child: const Text("Already have an Account?"),
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
        );
      },
    );
  }
}
