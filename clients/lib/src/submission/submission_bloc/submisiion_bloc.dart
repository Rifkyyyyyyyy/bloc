import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

class SubmisiionBloc extends Bloc<SubmissionEvent, SubmissionState> {
  SubmisiionBloc() : super(SubmissionInitial()) {
    on<CreateTicket>((event, emit) {
      emit(TicketCreate());
     
    });
  }
}
