import 'package:flutter/material.dart';
import '../helpers/database_helper.dart';
import '../models/land_use.dart';

class LandUseScreen extends StatelessWidget {
  final int plantID;

  LandUseScreen({required this.plantID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การใช้ประโยชน์'),
      ),
      body: FutureBuilder<List<LandUse>>(
        future: DatabaseHelper().getLandUsesByPlantID(plantID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('ไม่พบการใช้ประโยชน์'));
          } else {
            return ListView(
              children: [
                PlantInfo(
                  scientificName: 'Mangifera indica (L.)',
                  familyName: 'ANACARDIACEAE',
                  commonName: 'Mango',
                  localName: 'มะม่วง',
                  origin: 'อินเดีย พม่า',
                  distributionInThailand: 'เชียงใหม่ ฉะเชิงเทรา ฯลฯ',
                  distributionInOtherCountries: 'จีน อียิปต์',
                ),
                ...snapshot.data!.map((landUse) => ListTile(
                  title: Text(landUse.landUseDescription),
                )).toList(),
              ],
            );
          }
        },
      ),
    );
  }
}

class PlantInfo extends StatelessWidget {
  final String scientificName;
  final String familyName;
  final String commonName;
  final String localName;
  final String origin;
  final String distributionInThailand;
  final String distributionInOtherCountries;

  PlantInfo({
    required this.scientificName,
    required this.familyName,
    required this.commonName,
    required this.localName,
    required this.origin,
    required this.distributionInThailand,
    required this.distributionInOtherCountries,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ชื่อวิทยาศาสตร์: $scientificName'),
        Text('วงศ์: $familyName'),
        Text('ชื่อสามัญ: $commonName'),
        Text('ชื่อท้องถิ่น: $localName'),
        Text('แหล่งกำเนิด: $origin'),
        Text('การกระจายในประเทศไทย: $distributionInThailand'),
        Text('การกระจายในประเทศอื่นๆ: $distributionInOtherCountries'),
      ],
    );
  }
}