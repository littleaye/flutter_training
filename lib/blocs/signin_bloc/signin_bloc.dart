import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final UserRepository _userRepository;

  SigninBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SigninInitial()) {
    on<SigninRequired>((event, emit) async {
      emit(SigninProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SigninSuccess());
      } on FirebaseAuthException catch (e) {
        emit(SigninFailure(message: e.code));
      } catch (e) {
        emit(const SigninFailure());
      }
    });

    on<SignoutRequired>(
      (event, emit) async {
        await _userRepository.logOut();
      },
    );
  }
}
