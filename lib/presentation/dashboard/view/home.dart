import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../l10n/app_localizations.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../../auth/model/user_details_response.dart';
import '../../auth/states/auth_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authCubit = sl<AuthCubit>();
  UserDetailsResponseModel? userDetailsResponseModel;

  @override
  initState() {
    super.initState();
    authCubit.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocListener(
        bloc: authCubit,
        listener: (context, state) {
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
