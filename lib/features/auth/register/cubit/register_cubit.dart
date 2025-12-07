import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/features/auth/register/data/model/register_request_model.dart';
import '../data/services/register_service.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterService registerService;

  RegisterCubit(this.registerService) : super(RegisterInitial());

  Future<void> register(RegisterRequestModel model) async {
  emit(RegisterLoading());

  try {
    await registerService.register(model);
    emit(RegisterSuccess());
  } catch (e) {
    emit(RegisterFailure(e.toString().replaceAll("Exception: ", "")));
  }
}

}
