import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incode/guessing/guessing.dart';

class AffiliationsGuessesInfo extends StatelessWidget {
  const AffiliationsGuessesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuessingBloc, GuessingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AffiliationsGuessBox(
              value: state.total.toString(),
              type: "Total",
            ),
            AffiliationsGuessBox(
              value: state.success.toString(),
              type: "Success",
            ),
            AffiliationsGuessBox(
              value: state.failed.toString(),
              type: "Failed",
            ),
          ],
        );
      },
    );
  }
}