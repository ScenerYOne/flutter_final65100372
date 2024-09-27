import 'package:flutter/material.dart';
import 'plant_detail_screen.dart';
import '../helpers/database_helper.dart';
import '../models/plant.dart';

class PlantListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Database'),
      ),
      body: FutureBuilder<List<Plant>>(
        future: DatabaseHelper().getPlants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No plants found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final plant = snapshot.data![index];
                return ListTile(
                  title: Text(plant.plantName),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlantDetailScreen(
                            plantID: plant.id,
                            plantName: plant.plantName,
                          ),
                        ),
                      );
                    },
                    child: Text('View Details'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}