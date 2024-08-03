import 'package:connectivity_plus/connectivity_plus.dart';

import '../errors/exceptions.dart';

abstract class INetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfo implements INetworkInfo {
  @override
  Future<bool> isConnected() async {
    try {
      return await (Connectivity().checkConnectivity()).then((connectivity) {
        if (connectivity.contains(ConnectivityResult.none)) {
          return false;
        }
        return true;
      });
    } catch (e) {
      throw NetworkInfoException();
    }
  }
}
