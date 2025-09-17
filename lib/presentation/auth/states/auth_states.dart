import 'package:flutter_project_template/datasource/states/data_state.dart';

class AuthLoadingState extends LoadingState {
  AuthLoadingState(super.loadingMessage);
}

class AuthLoadedState extends LoadedState {
  AuthLoadedState({required super.data});
}

class UserDetailsLoadingState extends LoadingState {
  UserDetailsLoadingState(super.loadingMessage);
}

class UserDetailsLoadedState extends LoadedState {
  UserDetailsLoadedState({required super.data});
}
