import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository _userRepository;

  SignupBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignupInitial()) {
    on<SignupRequired>((event, emit) async {
      emit(SignupProcess());
      try {
        MyUser user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUserData(user);
        emit(SignupSuccess());
      } catch (e) {
        emit(SignupFailure());
      }
    });
  }
}
