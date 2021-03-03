import 'package:flutter/material.dart';
import 'package:plague_track/api/dataModel.dart';
import 'package:plague_track/api/fetchData.dart';

class Maintenance extends StatelessWidget {
  final _getData = new FetchData();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData.getData(),
      builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
        if (snapshot.hasData) {
          List<Data> parsData = snapshot.data;
          return ListView.builder(
            itemCount: parsData.length,
            itemBuilder: (context, index){
              return Container(
                child: Text(parsData[index].positif.toString()),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
  
}