import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/core/di/service_locator.dart';
import 'package:task_app/l10n/app_localizations.dart';
import 'package:task_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:task_app/presentation/auth/model/user_details_response.dart';
import 'package:task_app/presentation/auth/states/auth_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authCubit = sl<AuthCubit>();
  UserDetailsResponseModel? userDetailsResponseModel;

  @override
  void initState() {
    super.initState();
    authCubit.getUserDetails();
  }

  @override
  Widget build(final BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocListener(
        bloc: authCubit,
        listener: (final context, final state) {
          if (state is UserDetailsLoadedState) {
            userDetailsResponseModel = state.data as UserDetailsResponseModel?;
          }
        },
        child: Center(
          child: Text(locale.homeString),
        ),
      ),
    );
  }
}
