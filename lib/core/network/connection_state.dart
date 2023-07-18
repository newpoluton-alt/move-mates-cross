import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ConnectionState {
  Future<bool> get isConnected;
}

class ConnectionStateImpl extends ConnectionState {
  final InternetConnectionChecker internetConnectionChecker;

  ConnectionStateImpl({required this.internetConnectionChecker});

  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
}
