import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _FixeValue = 1000.0;
  double get FixeValue => _FixeValue;
  set FixeValue(double value) {
    _FixeValue = value;
  }

  double _localAmount = 0.0;
  double get localAmount => _localAmount;
  set localAmount(double value) {
    _localAmount = value;
  }

  double _apiGetAmount = 0.0;
  double get apiGetAmount => _apiGetAmount;
  set apiGetAmount(double value) {
    _apiGetAmount = value;
  }

  double _simulatedAmount = 500.0;
  double get simulatedAmount => _simulatedAmount;
  set simulatedAmount(double value) {
    _simulatedAmount = value;
  }

  String _currentUserPhoneNumber = '\'\${currentUserPhoneNumber}';
  String get currentUserPhoneNumber => _currentUserPhoneNumber;
  set currentUserPhoneNumber(String value) {
    _currentUserPhoneNumber = value;
  }

  String _currentUserName = '\${currentUserName}';
  String get currentUserName => _currentUserName;
  set currentUserName(String value) {
    _currentUserName = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}
