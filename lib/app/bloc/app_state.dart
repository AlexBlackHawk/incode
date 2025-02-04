part of 'app_bloc.dart';

final class AppState extends Equatable {
  const AppState({
    this.index = 0,
  });

  final int index;

  AppState copyWith({
    int? index,
  }) {
    return AppState(
      index: index ?? this.index,
    );
  }

  @override
  List<Object> get props => [
    index,
  ];
}
