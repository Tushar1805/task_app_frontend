import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_project_template/core/custom_exception.dart';
import 'package:flutter_project_template/core/resources/shared_app_strings.dart';
import 'package:flutter_project_template/core/utils/core_utils.dart';
import 'package:flutter_project_template/datasource/states/data_state.dart';

class BaseCubit extends Cubit<DataState> {
  BaseCubit() : super(InitialState());

  void handleExceptions(final Object e) {
    final message = e is CustomException
        ? e
        : e is NoInternetException
            ? SharedAppStrings.noInternetString
            : SharedAppStrings.someErrorOccurredString;

    customPrint('ERROR: $message: $e');

    emit(ErrorState(message.toString()));
  }
}
