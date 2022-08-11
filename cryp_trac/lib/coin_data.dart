import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String one;
  String two;
  CoinData({required this.one, required this.two});
  Uri converter() {
    return Uri(
        scheme: 'https',
        host: 'rest.coinapi.io',
        path: '/v1/exchangerate/$one/$two/',
        queryParameters: {'apikey': '7C4A33E3-D81A-48E8-B3D7-C70D04441602'});
  }

  Future<dynamic> re() async {
    Response res = await get(converter());
    var decoded = jsonDecode(res.body);
    print(res.statusCode);
    print(decoded);
    return decoded['rate'];
  }
}
