import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_finder/core/constants.dart';
import 'package:movie_finder/core/widgets/primary_button.dart';
import 'package:movie_finder/features/movie_flow/genre/list_card.dart';
import 'package:movie_finder/features/movie_flow/movie_flow_controller.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({
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
      body: Center(
        child: Column(
          children: [
            Text(
              'Let\'s start with a genre',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: ref.watch(movieFlowControllerProvider).genres.when(
                      data: (genres) {
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              vertical: kListItemSpacing),
                          itemCount: genres.length,
                          itemBuilder: ((context, index) {
                            final genre = genres[index];
                            return ListCard(
                              genre: genre,
                              onTap: () => ref
                                  .read(movieFlowControllerProvider.notifier)
                                  .toggleSelected(genre),
                            );
                          }),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: kListItemSpacing,
                            );
                          },
                        );
                      },
                      error: ((error, stackTrace) {
                        return const Text('Something went wrong on our end');
                      }),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )),
            PrimaryButton(
                onPressed:
                    ref.read(movieFlowControllerProvider.notifier).nextPage,
                text: 'Continue'),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
