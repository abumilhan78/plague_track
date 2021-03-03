import 'dart:convert';

import 'package:http/http.dart';
import 'package:plague_track/api/dataModel.dart';

class FetchData {
  final String url = "http://plaguetrack.herokuapp.com/api/mobile/indo";
  
  Future<List<Data>> getData() async{
    Response res = await get(url);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)['data'];

      List<Data> posDt = body.map((dynamic dt) => Data.fromJson(dt)).toList();
      return posDt;
    }else{
      throw "Tidak dapat menjangkau data";
    }
  }
}