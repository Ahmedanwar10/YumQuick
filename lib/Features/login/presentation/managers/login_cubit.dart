import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yum_quick/Features/login/data/models/login_data_model/data.dart';
import 'package:yum_quick/Features/login/data/models/login_data_model/login_data_model.dart';
import 'package:yum_quick/Features/login/data/repositories/login_repo.dart';

part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await loginRepo.login(email: email, password: password);
    result.fold(
        (l) => emit(LoginFailure(errorMessage: l.errorMessage)),
        (r) => emit(LoginSuccess(
              loginDataModel: r,
            )));
  }
}