part of 'contests_filter_bloc.dart';

abstract class ContestsFilterEvent extends Equatable {
  const ContestsFilterEvent();

  @override
  List<Object> get props => [];
}

class UpdateContestsFilter extends ContestsFilterEvent {
  final ContestFilter filter;

  const UpdateContestsFilter({this.filter = const ContestFilter()});

  @override
  List<Object> get props => [filter];
}
