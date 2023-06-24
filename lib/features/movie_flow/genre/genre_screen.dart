import 'package:flutter/material.dart';
import 'package:movie_finder/core/constants.dart';
import 'package:movie_finder/core/widgets/primary_button.dart';
import 'package:movie_finder/features/movie_flow/genre/genre.dart';
import 'package:movie_finder/features/movie_flow/genre/list_card.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen(
      {super.key, required this.nextPage, required this.previousPage});

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = const [
    Genre(name: 'Action'),
    Genre(name: 'Comedy'),
    Genre(name: 'Drama'),
    Genre(name: 'Thriller'),
    Genre(name: 'Romance'),
    Genre(name: 'Adventure'),
    Genre(name: 'Sci-Fi'),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() {
      genres = updatedGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
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
                child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
              itemCount: genres.length,
              itemBuilder: ((context, index) {
                final genre = genres[index];
                return ListCard(
                  genre: genre,
                  onTap: () => toggleSelected(genre),
                );
              }),
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: kListItemSpacing,
                );
              },
            )),
            PrimaryButton(onPressed: widget.nextPage, text: 'Continue'),
            const SizedBox(
              height: kMediumSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
