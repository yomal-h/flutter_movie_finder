import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_finder/core/constants.dart';
import 'package:movie_finder/core/widgets/primary_button.dart';
import 'package:movie_finder/features/movie_flow/movie_flow_controller.dart';

class RatingScreen extends ConsumerWidget {
  const RatingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
        ),
      ),
      body: Column(
        children: [
          Text(
            'Select a minimum rating\nranging from 1-10',
            style: theme.textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${ref.watch(movieFlowControllerProvider).rating}',
                style: theme.textTheme.headline2,
              ),
              const Icon(
                Icons.star_rounded,
                color: Colors.amber,
                size: 62,
              )
            ],
          ),
          const Spacer(),
          Slider(
            value: ref.watch(movieFlowControllerProvider).rating.toDouble(),
            onChanged: (value) {
              ref
                  .read(movieFlowControllerProvider.notifier)
                  .updateRating(value.toInt());
            },
            min: 1,
            max: 10,
            divisions: 9,
            label: '${ref.watch(movieFlowControllerProvider).rating}',
          ),
          const Spacer(),
          PrimaryButton(
              onPressed:
                  ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: 'Continue'),
          const SizedBox(
            height: kMediumSpacing,
          )
        ],
      ),
    );
  }
}
