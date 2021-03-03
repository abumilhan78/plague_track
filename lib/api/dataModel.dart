import 'package:flutter/foundation.dart';

class Data {
  final int positif;
  final int sembuh;
  final int meninggal;
  final int reaktif;

  Data({
    @required this.positif,
    @required this.sembuh, 
    @required this.meninggal,
    @required this.reaktif
  });

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      positif: json['positif'] as int,
      sembuh: json['sembuh'] as int,
      meninggal: json['meninggal'] as int,
      reaktif: json['reaktif'] as int
    );
  }
}