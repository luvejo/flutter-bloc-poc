import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/contests/contests_bloc.dart';
import 'package:todo/models/contest.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContestsBloc, ContestsState>(
      builder: (context, state) {
        if (state is ContestsLoading) {
          return const CircularProgressIndicator();
        }

        if (state is ContestsLoaded) {
          return Scaffold(
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.contests.length,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return ContestCard(contest: state.contests[index]);
              },
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: Text('Rayos, algo inesperado ha ocurrido.'),
          ),
        );
      },
    );
  }
}

class ContestCard extends StatelessWidget {
  const ContestCard({
    super.key,
    required this.contest,
  });

  final Contest contest;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.amber[50]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              contest.name,
              softWrap: true,
              textWidthBasis: TextWidthBasis.parent,
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {
              context.read<ContestsBloc>().add(
                    UpdateContest(
                      contest: contest.copyWith(isSaved: !contest.isSaved),
                    ),
                  );
            },
            child: Text(
              contest.isSaved ? 'Guardado' : 'Guardar',
              style: TextStyle(
                color: contest.isSaved
                    ? Theme.of(context).disabledColor
                    : Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
