import 'package:bloc/bloc.dart';
import 'package:clients/src/repository/user_repository.dart';
import 'bloc.dart';

class ApiBloc extends Bloc<UserEvent, ApiState> {
  final UserRepository _userRepository;

  ApiBloc(this._userRepository) : super(LoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final user = await _userRepository.getUsers();
        emit(LoadedState(usermodel: user));
      } catch (eror) {
        emit(ErrorState('EROR : ${eror.toString()}'));
       
      }
    });
  }
}
