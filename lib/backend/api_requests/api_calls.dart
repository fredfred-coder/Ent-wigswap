import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PostWavePaymentCall {
  static Future<ApiCallResponse> call({
    double? localAmount = 1000,
    String? userId = '\"unknown_user\"',
    String? username = ' \"guest\"',
    String? paiementId = '\"unknown_paiement_id\"',
    String? date = '\"2024-11-08T00:00:00Z\"',
    String? currency = '\"XOF\"',
    String? successUrl =
        '\"https://tonapplication.com/votre_paiement_est_accepte\".',
    String? errorUrl = '\"https://tonapplication.com/payement_refuse\"',
    String? status = '\"Pending\"',
    String? currentUserPhoneNumber = '\"\"',
  }) async {
    final ffApiRequestBody = '''
{
  "status": "success",
  "amount": "\${localAmount}",
  "phoneNumber": "\${currentUserPhoneNumber}",
  "userId": "\${userId == null ? 'unknown_user' : userId}",
  "username": "\${username == null ? 'guest' : username}",
  "paiementId": "\${paiementId == null ? 'unknown_paiement_id' : paiementId}",
  "date": "\${currentDate == null ? '2024-11-08T00:00:00Z' : currentDate}",
  "currency": "XOF",
  "success_url": "https://tonapplication.com/votre_paiement_est_accepte",
  "error_url": "https://tonapplication.com/payement_refuse"
}

''';
    return ApiManager.instance.makeApiCall(
      callName: ' PostWavePayment',
      apiUrl: 'https://api.wave.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer wave_sn_prod_i8XQHPTrevjYdYwTF8GQ3hD74mpW88d0dOEYzD5GFrubAP7i7wTmGrRlNmnej_8Nd8bgdFqCtt_JatUhp4WeMzVbr2wINym8Kw',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: true,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.amount''',
      );
  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class GetPayementStatutCall {
  static Future<ApiCallResponse> call({
    String? userId = '\${authUser.uid}',
    String? amount = '\"\"\"',
    double? apiGetAmount = 0,
    String? currentUserPhoneNumber = '\"\"',
    String? currentUserName = '\"\"',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Payement Statut',
      apiUrl:
          'https://api.wave.com/v1/balance?userId=\${currentUserPhoneNumber}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer wave_sn_prod_i8XQHPTrevjYdYwTF8GQ3hD74mpW88d0dOEYzD5GFrubAP7i7wTmGrRlNmnej_8Nd8bgdFqCtt_JatUhp4WeMzVbr2wINym8Kw',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: true,
      alwaysAllowBody: false,
    );
  }

  static dynamic userId(dynamic response) => getJsonField(
        response,
        r'''$.userId''',
      );
  static dynamic localAmount(dynamic response) => getJsonField(
        response,
        r'''$.amount''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
