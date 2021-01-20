import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:convert';
import 'dart:async';

import '../jsonmodels/financeresponse.dart';
import '../services/config.dart';

Future<FinancesResponse> userFinances(String token) async {
  var jwtDecoded = JwtDecoder.decode(token);
  var userId = jwtDecoded['sub'];

  var res = await http.get("$API_URL/users/$userId/finances",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200 || res.statusCode == 401) {
    return FinancesResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<FinancesResponse> getFinances(String token) async {

  var res = await http.get("$API_URL/finances",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200 || res.statusCode == 401) {
    return FinancesResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<FinancesResponse> getFinance(String token, financeId) async {

  var res = await http.get("$API_URL/finances/$financeId",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200 || res.statusCode == 401) {
    return FinancesResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<FinanceResponse> newFinance(String token, data) async {
  var res = await http.post(
    "$API_URL/finances",
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    body: data,
  );

  print(res.statusCode);

  if (res.statusCode == 201 || res.statusCode == 422) {
    return FinanceResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}

Future<ModFinanceResponse> editFinance(String token, String financeId, data) async {
  var res = await http.put(
    "$API_URL/finances/$financeId",
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    body: data,
  );

  if (res.statusCode == 200 || res.statusCode == 422) {
    return ModFinanceResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}


Future<ModFinanceResponse> deleteFinance(String token, String financeId) async {
  var res = await http.delete(
    "$API_URL/finances/$financeId",
    headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
  );

  if (res.statusCode == 200 || res.statusCode == 404) {
    return ModFinanceResponse.fromJson(jsonDecode(res.body));
  } else {
    throw Exception("Error Occured");
  }
}