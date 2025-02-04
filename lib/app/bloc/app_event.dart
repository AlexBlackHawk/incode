part of 'app_bloc.dart';

final class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

final class AppIndexChanged extends AppEvent {
  const AppIndexChanged({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}
