import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AppIndexChanged>(_onIndexChanged);
  }

  void _onIndexChanged(AppIndexChanged event, Emitter<AppState> emit) {
    emit(
      state.copyWith(
        index: event.index,
      )
    );
  }
}
