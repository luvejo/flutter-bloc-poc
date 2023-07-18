import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/blocs/contests/contests_bloc.dart';
import 'package:todo/models/contest.dart';
import 'package:todo/models/contest_filter.dart';
import 'package:todo/utils/list.dart';

part 'contests_filter_event.dart';
part 'contests_filter_state.dart';

class ContestsFilterBloc
    extends Bloc<ContestsFilterEvent, ContestsFilterState> {
  final ContestsBloc _contestsBloc;

  ContestsFilterBloc({
    required ContestsBloc contestsBloc,
  })  : _contestsBloc = contestsBloc,
        super(ContestsFilterLoading()) {
    on<UpdateContestsFilter>(_onUpdateContestsFilter);

    contestsBloc.stream.listen((event) {
      add(
        const UpdateContestsFilter(),
      );
    });
  }

  void _onUpdateContestsFilter(
    UpdateContestsFilter event,
    Emitter<ContestsFilterState> emit,
  ) {
    final state = _contestsBloc.state;

    if (state is ContestsLoaded) {
      List<Contest> contests = state.contests.where((contest) {
        if (event.filter.savedOnly && !contest.isSaved) return false;

        final bool genresMatch;
        if (event.filter.genres.isEmpty) {
          genresMatch = true;
        } else {
          genresMatch = intersection([
            contest.genres,
            event.filter.genres,
          ]).isNotEmpty;
        }

        return genresMatch &&
            (contest.viaEmail == event.filter.viaEmail ||
                contest.viaPostalMail == event.filter.viaPostalMail);
      }).toList();

      emit(
        ContestsFilterLoaded(
          filteredContests: contests,
          filter: event.filter,
        ),
      );
    }
  }
}
