import 'package:ecommerce_tv/data/datasources/remotes/auth_remote_datasource.dart';
import 'package:ecommerce_tv/data/model/requests/login_request_model.dart';
import 'package:ecommerce_tv/data/model/responses/auth_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource _authRemoteDatasource;

  LoginBloc(this._authRemoteDatasource) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await _authRemoteDatasource.login(event.model);
      result.fold(
        (l) => emit(LoginError()),
        (r) => emit(LoginLoaded(model: r)),
      );
    });
  }
}
