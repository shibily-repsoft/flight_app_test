import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityCheckerHelper {
  Future<bool> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();
    return _handleResult(connectivityResult);
  }

  static Stream<List<ConnectivityResult>> listenToConnectivityChanged() {
    return Connectivity().onConnectivityChanged;
  }

  bool _handleResult(List<ConnectivityResult> connectivityResult) {
    return connectivityResult.isNotEmpty &&
        connectivityResult.any((r) => r != ConnectivityResult.none);
  }
}