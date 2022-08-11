import 'dart:html';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:http/http.dart';
import 'card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String sel = 'USD';
  CoinData coinData = CoinData(one: 'BTC', two: 'USD');
  CoinData ethData = CoinData(one: 'ETH', two: 'USD');
  CoinData xrp = CoinData(one: 'XRP', two: 'USD');
  CoinData etc = CoinData(one: 'ETC', two: 'USD');
  CoinData trx = CoinData(one: 'TRX', two: 'USD');

  @override
  String selectedCurrency = 'USD';
  List<DropdownMenuItem<String>> filllist() {
    List<DropdownMenuItem<String>> list = [];
    for (int i = 0; i < currenciesList.length; i++) {
      var newvar = DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      );
      list.add(newvar);
    }
    return list;
  }

  String bitcoinvalue = '?';
  String ethereum = '?';
  String ripple = '?';
  String ethc = '?';
  String tron = '?';
  void getData() async {
    double ro = await coinData.re();
    double rth = await ethData.re();
    double xr = await xrp.re();
    double eth = await etc.re();
    double tr = await trx.re();
    setState(() {
      ethereum = rth.toString();
      bitcoinvalue = ro.toString();
      ripple = xr.toString();
      ethc = eth.toString();
      tron = tr.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              card('BTC', bitcoinvalue, selectedCurrency),
              card('ETH', ethereum, selectedCurrency),
              card('XRP', ripple, selectedCurrency),
              card('ETC', ethc, selectedCurrency),
              card('TRX', tron, selectedCurrency),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: filllist(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                  coinData.two = selectedCurrency;
                  ethData.two = selectedCurrency;
                  xrp.two = selectedCurrency;
                  etc.two = selectedCurrency;
                  trx.two = selectedCurrency;
                  getData();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
