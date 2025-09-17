import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/core/resources/app_colors.dart';
import 'package:task_app/core/shared_extensions.dart';
import 'package:task_app/presentation/auth/widgets/custom_text_form_field_widget.dart';
import 'package:task_app/routes/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context).textTheme;

    void signUpUser() {
      if (formKey.currentState!.validate()) {}
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: theme.bodyLarge?.copyWith(fontSize: 50),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFieldWidget(
                controller: nameController,
                hintText: 'Name',
                validator: (final value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
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
                onPressed: signUpUser,
                child: Text(
                  'Sign Up',
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
                  text: 'Already have an account? ',
                  style: theme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go(loginScreen);
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
