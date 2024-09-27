import 'package:flutter/material.dart';

class PlantInfo extends StatelessWidget {
  final String scientificName;
  final String familyName;
  final String commonName;
  final String localName;
  final String origin;
  final String distributionInThailand;
  final String distributionInOtherCountries;
  final String ecology;
  final String floweringTime;
  final String fruitingTime;
  final String propagation;

  PlantInfo({
    required this.scientificName,
    required this.familyName,
    required this.commonName,
    required this.localName,
    required this.origin,
    required this.distributionInThailand,
    required this.distributionInOtherCountries,
    required this.ecology,
    required this.floweringTime,
    required this.fruitingTime,
    required this.propagation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Scientific Name: $scientificName'),
            Text('Family Name: $familyName'),
            Text('Common Name: $commonName'),
            Text('Local Name: $localName'),
            Text('Origin: $origin'),
            Text('Distribution in Thailand: $distributionInThailand'),
            Text('Distribution in Other Countries: $distributionInOtherCountries'),
            Text('Ecology: $ecology'),
            Text('Flowering Time: $floweringTime'),
            Text('Fruiting Time: $fruitingTime'),
            Text('Propagation: $propagation'),
          ],
        ),
      ),
    );
  }
}