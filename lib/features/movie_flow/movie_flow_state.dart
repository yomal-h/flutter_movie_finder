import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_finder/features/movie_flow/genre/genre.dart';
import 'package:movie_finder/features/movie_flow/result/movie.dart';

// const movieMock = Movie(
//   title: 'Batman',
//   overview:
//       'lorem ipm hggt iopjj yui gfr ffr ht  h th tththh h hthhtht yyyjhjj  yjyjyj  yjyj  yht hth tt   htgrrgrgrrg rgr gr g rg rgrg',
//   voteAverage: 4.8,
//   genres: [Genre(name: 'Action'), Genre(name: 'Fantasy')],
//   releaseDate: '24-05-2018',
//   backdropPath: '',
//   posterPath: '',
// );

// const genresMock = [
//   Genre(name: 'Action'),
//   Genre(name: 'Comedy'),
//   Genre(name: 'Drama'),
//   Genre(name: 'Thriller'),
//   Genre(name: 'Romance'),
//   Genre(name: 'Adventure'),
//   Genre(name: 'Sci-Fi'),
// ];

@immutable
class MovieFlowState {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final AsyncValue<List<Genre>> genres;
  final AsyncValue <Movie> movie;

  const MovieFlowState({
    required this.pageController,
    this.rating = 5,
    this.yearsBack = 10,
    required this.genres,
    required this.movie,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    AsyncValue<List<Genre>>? genres,
    AsyncValue <Movie>? movie,
  }) {
    return MovieFlowState(
        pageController: pageController ?? this.pageController,
        rating: rating ?? this.rating,
        yearsBack: yearsBack ?? this.yearsBack,
        genres: genres ?? this.genres,
        movie: movie ?? this.movie);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieFlowState &&
        other.pageController == pageController &&
        other.rating == rating &&
        other.yearsBack == yearsBack &&
        other.genres == genres &&
        other.movie == movie;
  }

  @override
  // TODO: implement hashCode
  int get hashCode {
    return pageController.hashCode ^
        rating.hashCode ^
        yearsBack.hashCode ^
        genres.hashCode ^
        movie.hashCode;
  }
}
