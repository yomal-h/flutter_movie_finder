import 'package:flutter/material.dart';
import 'package:movie_finder/core/constants.dart';
import 'package:movie_finder/core/widgets/primary_button.dart';
import 'package:movie_finder/features/movie_flow/genre/genre.dart';
import 'package:movie_finder/features/movie_flow/result/movie.dart';

class ResultScreen extends StatelessWidget {
  static route({bool fullscreenDialog = true}) => MaterialPageRoute(
        builder: (context) => const ResultScreen(),
        fullscreenDialog: fullscreenDialog,
      );
  const ResultScreen({super.key});

  final double movieHeight = 150;

  final movie = const Movie(
    title: 'Batman',
    overview:
        'lorem ipm hggt iopjj yui gfr ffr ht  h th tththh h hthhtht yyyjhjj  yjyjyj  yjyj  yht hth tt   htgrrgrgrrg rgr gr g rg rgrg',
    voteAverage: 4.8,
    genres: [Genre(name: 'Action'), Genre(name: 'Fantasy')],
    releaseDate: '24-05-2018',
    backdropPath: '',
    posterPath: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CoverImage(),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: -(movieHeight / 2),
                    child: MovieImageDetails(
                      movie: movie,
                      movieHeight: movieHeight,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: movieHeight / 2,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  movie.overview,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )
            ],
          )),
          PrimaryButton(
              onPressed: () => Navigator.of(context).pop(),
              text: 'Find another movie'),
          const SizedBox(
            height: kMediumSpacing,
          )
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Colors.transparent,
              ]).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: const Placeholder(),
      ),
    );
  }
}

class MovieImageDetails extends StatelessWidget {
  const MovieImageDetails(
      {super.key, required this.movieHeight, required this.movie});

  final double movieHeight;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(children: [
        SizedBox(
          width: 100,
          height: movieHeight,
          child: const Placeholder(),
        ),
        const SizedBox(
          width: kMediumSpacing,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: theme.textTheme.headline6,
              ),
              Text(
                movie.genresCommaSeperated,
                style: theme.textTheme.bodyText2,
              ),
              Row(
                children: [
                  Text(
                    '4.8',
                    style: theme.textTheme.bodyText2?.copyWith(
                      color:
                          theme.textTheme.bodyText2?.color?.withOpacity(0.62),
                    ),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    size: 20,
                    color: Colors.amber,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}