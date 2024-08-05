import 'dart:convert';

import 'package:movieflix/features/details/data/models/cast/response_cast_model.dart';

const jsonResponseCastMovieMock = '''{
    "id": 519182,
    "cast": [
        {
            "adult": false,
            "gender": 2,
            "id": 4495,
            "known_for_department": "Acting",
            "name": "Steve Carell",
            "original_name": "Steve Carell",
            "popularity": 71.67,
            "profile_path": "/dzJtsLspH5Bf8Tvw7OQC47ETNfJ.jpg",
            "cast_id": 6,
            "character": "Felonious Gru / Chet (voice)",
            "credit_id": "62101d6cd100b600419a339e",
            "order": 0
        },
        {
            "adult": false,
            "gender": 1,
            "id": 41091,
            "known_for_department": "Acting",
            "name": "Kristen Wiig",
            "original_name": "Kristen Wiig",
            "popularity": 60.382,
            "profile_path": "/p4QYkJ7EboyhzQcexH86SgCOki7.jpg",
            "cast_id": 11,
            "character": "Lucy Gru / Blanche (voice)",
            "credit_id": "62102273e0ca7f00436fab9d",
            "order": 1
        }
    ]
}''';

ResponseCastModel responseCastMovieMock =
    ResponseCastModel.fromJson(jsonDecode(jsonResponseCastMovieMock));
