
import 'package:flutter/material.dart';
import 'package:task_app/core/resources/shared_app_strings.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.loadingMessage});

  final String? loadingMessage;

  @override
  Widget build(final BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (loadingMessage != null) ...[
              Text(
                loadingMessage ?? '',
                textAlign: TextAlign.center,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
            ],
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      );
}

class LoadingWithoutText extends StatelessWidget {
  const LoadingWithoutText({super.key});

  @override
  Widget build(final BuildContext context) => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).primaryColor
                : Colors.white,
          ),
        ),
      );
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key,});

  @override
  Widget build(final BuildContext context) => Container(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).brightness == Brightness.light
                  ? Theme.of(context).primaryColor
                  : Colors.white,
            ),
          ),
        ),
      );
}

class Error extends StatelessWidget {
  const Error({required this.error, super.key, this.onRetryPressed});
  final String error;

  final VoidCallback? onRetryPressed;

  @override
  Widget build(final BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.grey),
              ),
              child: Text(SharedAppStrings.retry),
              onPressed: () => onRetryPressed?.call(),
            ),
          ],
        ),
      );
}
