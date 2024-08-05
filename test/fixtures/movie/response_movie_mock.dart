import 'dart:convert';

import 'package:movieflix/features/home/data/models/upcoming/response_movie_model.dart';

const jsonResponseMovieMock = '''{
  "page": 1,
  "total_pages": 51,
  "total_results": 1019,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/5g2n3ilC8DpYv4diJeuQ1vKG2Kb.jpg",
      "genre_ids": [
        16,
        10751,
        35,
        28
      ],
      "id": 519182,
      "original_language": "en",
      "original_title": "Despicable Me 4",
      "overview": "Nesta sequência, o vilão mais amado do planeta retorna e agora Gru, Lucy, Margo, Edith e Agnes dão as boas-vindas a um novo membro da família: Gru Jr., que pretende atormentar seu pai. Enquanto se adapta com o pequeno, Gru enfrenta um novo inimigo, Maxime Le Mal, forçando sua namorada Valentina e a família a fugir do perigo.",
      "popularity": 3557.455,
      "poster_path": "/65QQjZNrVfTiuGp3chxx8dkfHDG.jpg",
      "release_date": "2024-06-20",
      "title": "Meu Malvado Favorito 4",
      "video": false,
      "vote_average": 7.2,
      "vote_count": 510
    },
    {
      "adult": false,
      "backdrop_path": "/Akv9GlCCMrzcDkVz4ad8MdLl9DK.jpg",
      "genre_ids": [
        16,
        35,
        10751,
        12
      ],
      "id": 748783,
      "original_language": "en",
      "original_title": "The Garfield Movie",
      "overview": "Garfield, o mundialmente famoso gato de interior que odeia segundas-feiras e adora lasanha, está prestes a ter uma aventura selvagem ao ar livre! Depois de um reencontro inesperado com seu pai há muito perdido – o desalinhado gato de rua Vic – Garfield e seu amigo canino Odie são forçados a deixar sua vida perfeitamente mimada para se juntarem a Vic em um assalto hilariante e de alto risco.",
      "popularity": 1773.945,
      "poster_path": "/eJhCZ3pPjNLKxdNezjrQaQsfENP.jpg",
      "release_date": "2024-04-30",
      "title": "Garfield - Fora de Casa",
      "video": false,
      "vote_average": 7.2,
      "vote_count": 669
    }
  ]
}''';

ResponseMovieModel responseMovieMock =
    ResponseMovieModel.fromJson(jsonDecode(jsonResponseMovieMock));
