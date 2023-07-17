part of 'contests_bloc.dart';

abstract class ContestsState extends Equatable {
  const ContestsState();

  @override
  List<Object> get props => [];
}

class ContestsLoading extends ContestsState {}

class ContestsLoaded extends ContestsState {
  final List<Contest> contests;

  const ContestsLoaded({
    this.contests = const <Contest>[],
  });

  @override
  List<Object> get props => [contests];
}
