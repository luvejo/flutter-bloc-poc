part of 'contests_filter_bloc.dart';

abstract class ContestsFilterState extends Equatable {
  const ContestsFilterState();

  @override
  List<Object> get props => [];
}

class ContestsFilterLoading extends ContestsFilterState {}

class ContestsFilterLoaded extends ContestsFilterState {
  final List<Contest> filteredContests;
  final ContestFilter filter;

  const ContestsFilterLoaded({
    required this.filteredContests,
    required this.filter,
  });

  @override
  List<Object> get props => [filteredContests, filter];
}
