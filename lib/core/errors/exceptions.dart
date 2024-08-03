class ServerException implements Exception {
  final String error;
  const ServerException({this.error = 'Não foi possível obter os dados'});
}

class NetworkInfoException implements Exception {}
