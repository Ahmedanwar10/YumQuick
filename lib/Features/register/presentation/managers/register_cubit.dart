import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yum_quick/Features/register/data/repositories/repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RepoRegister repoRegister;
  RegisterCubit(this.repoRegister) : super(RegisterInitial());
 Future<void> register({required String email,required String password,required String name,required String phone})async{
    emit(RegisterLoading());
    final result = await repoRegister.register(
      email: email,
      password: password,
      name: name,
      phone: phone
      );
    result.fold(
      (l) => emit(RegisterFailure(errorMessage: l.errorMessage)),
      (r) => emit(RegisterSuccess()),
    );
  }
}