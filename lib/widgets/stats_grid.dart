import 'package:flutter/material.dart';
import 'package:plague_track/api/dataModel.dart';
import 'package:plague_track/api/fetchData.dart';

class StatsGrid extends StatelessWidget {
  final _getData = new FetchData();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData.getData(),
      builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
        if (snapshot.hasData) {
          List<Data> parseData = snapshot.data;
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      _buildStatCard('Total Kasus', parseData[0].positif.toString(), Colors.orange),
                      _buildStatCard('Meninggal', parseData[0].meninggal.toString(), Colors.red),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      _buildStatCard('Sembuh', parseData[0].sembuh.toString(), Colors.green),
                      _buildStatCard('Reaktif', parseData[0].reaktif.toString(), Colors.lightBlue),
                      _buildStatCard('Dirawat', 'N/A', Colors.purple),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
