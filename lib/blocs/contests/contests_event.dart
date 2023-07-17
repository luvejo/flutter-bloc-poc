part of 'contests_bloc.dart';

abstract class ContestsEvent extends Equatable {
  const ContestsEvent();

  @override
  List<Object> get props => [];
}

class LoadContests extends ContestsEvent {
  final List<Contest> contests;

  const LoadContests({
    this.contests = const <Contest>[],
  });

  @override
  List<Object> get props => [contests];
}

class SaveContests extends ContestsEvent {
  final List<Contest> contests;

  const SaveContests({
    this.contests = const <Contest>[],
  });

  @override
  List<Object> get props => [contests];
}

class UpdateContest extends ContestsEvent {
  final Contest contest;

  const UpdateContest({
    required this.contest,
  });

  @override
  List<Object> get props => [contest];
}
