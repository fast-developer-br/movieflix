class ApiConsts {
  final String _apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDE5ZThlY2Y0ZTA2ZjE1NWUyNDczNWI5ZjM1ZjNhYiIsIm5iZiI6MTcyMjcxNjY0Ni42MjYxMjQsInN1YiI6IjYxNWI4Mzk3YjFmNjhkMDA0NDQ5YjA1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3xdO3dmVrBLVk7e3nRjK2G4rpwp-6Tgysc8lopJArhM';

  String get getApiToken => _apiToken;

  static const baseURL = 'https://api.themoviedb.org';
  static String imageURL(String image) =>
      'http://image.tmdb.org/t/p/w500$image';

  static const listUpcomingMovies = '$baseURL/3/movie/upcoming';
  static const listPopularMovies = '$baseURL/3/movie/popular';
  static const listTopRatedMovies = '$baseURL/3/movie/top_rated';
  static const searchMovie = '$baseURL/3/search/movie';

  static String castMovie(int movieId) => '$baseURL/3/movie/$movieId/credits';
}
