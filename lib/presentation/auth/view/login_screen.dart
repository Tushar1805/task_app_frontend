import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/core/resources/app_colors.dart';
import 'package:task_app/core/shared_extensions.dart';
import 'package:task_app/presentation/auth/widgets/custom_text_form_field_widget.dart';
import 'package:task_app/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: theme.bodyLarge?.copyWith(fontSize: 50),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFieldWidget(
                controller: emailController,
                hintText: 'Email',
                validator: (final value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email cannot be empty';
                  } else if (!value.isValidEmail()) {
                    return 'Email is not valid';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormFieldWidget(
                controller: passwordController,
                hintText: 'Password',
                validator: (final value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password cannot be empty';
                  } else if (!value.isValidPassword()) {
                    return 'Password is not valid';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: loginUser,
                child: Text(
                  'Sign In',
                  style: theme.bodyMedium?.copyWith(
                    color: AppColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: theme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go(signUpScreen);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
