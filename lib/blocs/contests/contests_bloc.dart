import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/models/contest.dart';

part 'contests_event.dart';
part 'contests_state.dart';

class ContestsBloc extends Bloc<ContestsEvent, ContestsState> {
  ContestsBloc() : super(ContestsLoading()) {
    on<LoadContests>(_onLoadContests);
    on<SaveContests>(_onSaveContests);
    on<UpdateContest>(_onUpdateContest);
  }

  void _onLoadContests(LoadContests event, Emitter<ContestsState> emit) {
    emit(ContestsLoaded(contests: event.contests));
  }

  void _onSaveContests(SaveContests event, Emitter<ContestsState> emit) {}

  void _onUpdateContest(UpdateContest event, Emitter<ContestsState> emit) {
    final state = this.state;

    if (state is ContestsLoaded) {
      List<Contest> contests = (state.contests.map((contest) {
        return contest.id == event.contest.id ? event.contest : contest;
      })).toList();

      emit(ContestsLoaded(contests: contests));
    }
  }
}
