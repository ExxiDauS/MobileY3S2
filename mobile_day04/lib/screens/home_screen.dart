import 'package:flutter/material.dart';
import '../models/travel_spot.dart';
import '../widgets/travel_card.dart';

class HomeScreen extends StatelessWidget {

  final List<TravelSpot> spots = [
    TravelSpot(name: 'Grand Palace', location: 'Bangkok, Thailand', imageUrl: 'https://lh3.googleusercontent.com/gps-cs-s/AG0ilSykojZvyjbQS9COhpWDBPp7hanz7I1vM5NVYnR1vl2eTYPIvO-3iFm8HPXsRGCtkO2ndPhrOTO7DIgmFjxg_OTvE9UvlgFJ3wjeKnQGIOaeZO4Ag2vXHIcNLhvjXofnGcsS_HfC=s680-w680-h510-rw'),
    TravelSpot(name: 'Phuket Beaches', location: 'Phuket, Thailand', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGNGHCx3Vp-z2s018omAf5mb60vzJMGnn1Aw&s'),
    TravelSpot(name: 'Chiang Mai Temples', location: 'Chiang Mai, Thailand', imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/30/03/1c/60/caption.jpg?w=600&h=400&s=1'),
  ];

HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Thailand Travel Spots'),),
      body: ListView.builder(
      itemCount: spots.length,
      itemBuilder: (context, index) {
        return TravelCard(spot: spots[index]);
      },
      ),
    );
  }
}