import 'package:flutter/material.dart';
import '../models/travel_spot.dart';

class TravelCard extends StatelessWidget {

  final TravelSpot spot;

const TravelCard({super.key, required this.spot});

  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(spot.imageUrl, fit: BoxFit.fill, height: double.infinity, width: double.infinity,),
          ListTile(
            title: Text(spot.name, style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(spot.location),
            trailing: FilledButton(onPressed: () {}, style: FilledButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ), child: Text('Details'),
            ),
          )
        ],
      ),
    );
  }
}