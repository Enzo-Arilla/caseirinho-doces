/*
  Eventos
*/

import 'package:bloc/bloc.dart';

import '../model/user.dart';
import '../provider/rest_provider_user.dart';

class ManagerBloc extends Bloc<ManagerEvent, ManagerState> {
  ManagerBloc() : super(InsertState()) {

    on<RegisterEvent>((RegisterEvent event, emit) {
      event.user;
      RestProviderUser.helper.insertUser(event.user);
    });

    on<LoginEvent>((LoginEvent event, emit) async {

      UserProfile? user = await RestProviderUser.helper.getUserByEmail(event.email);

      if (user != null) {
        UserProfileSingleton.instance.user = user;
      } else {
        // emit(ErrorState("Usuário não encontrado"));
      }

    });

  }
}

abstract class ManagerEvent {}

class RegisterEvent extends ManagerEvent {
  UserProfile user;
  RegisterEvent({required this.user});
}

class LoginEvent extends ManagerEvent {
  String email;
  LoginEvent({required this.email});
}

/*
  Estados
*/

abstract class ManagerState {}

class InsertState extends ManagerState {}
class SelectState extends ManagerState {}