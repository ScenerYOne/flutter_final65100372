import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/plant.dart';
import '../models/plant_component.dart';
import '../models/land_use.dart';
import '../models/land_use_type.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'plants.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE plants(id INTEGER PRIMARY KEY, plantName TEXT, plantScientific TEXT, plantImage TEXT)',
        );
        await db.execute(
          'CREATE TABLE plantComponents(id INTEGER PRIMARY KEY, componentName TEXT, componentIcon TEXT)',
        );
        await db.execute(
          'CREATE TABLE landUseTypes(id INTEGER PRIMARY KEY, landUseTypeName TEXT, landUseTypeDescription TEXT)',
        );
        await db.execute(
          'CREATE TABLE landUses(id INTEGER PRIMARY KEY, plantID INTEGER, componentID INTEGER, landUseTypeID INTEGER, landUseDescription TEXT)',
        );

        // Insert initial data
        await db.insert('plants', {'id': 1001, 'plantName': 'Mango', 'plantScientific': 'Mangifera indica', 'plantImage': 'mango.jpg'});
        await db.insert('plants', {'id': 1002, 'plantName': 'Neem', 'plantScientific': 'Azadirachta indica', 'plantImage': 'neem.jpg'});
        await db.insert('plants', {'id': 1003, 'plantName': 'Bamboo', 'plantScientific': 'Bambusa vulgaris', 'plantImage': 'bamboo.jpg'});
        await db.insert('plants', {'id': 1004, 'plantName': 'Ginger', 'plantScientific': 'Zingiber officinale', 'plantImage': 'ginger.jpg'});

        await db.insert('plantComponents', {'id': 1101, 'componentName': 'Leaf', 'componentIcon': 'leaf_icon.png'});
        await db.insert('plantComponents', {'id': 1102, 'componentName': 'Flower', 'componentIcon': 'flower_icon.png'});
        await db.insert('plantComponents', {'id': 1103, 'componentName': 'Fruit', 'componentIcon': 'fruit_icon.png'});
        await db.insert('plantComponents', {'id': 1104, 'componentName': 'Stem', 'componentIcon': 'stem_icon.png'});
        await db.insert('plantComponents', {'id': 1105, 'componentName': 'Root', 'componentIcon': 'root_icon.png'});

        await db.insert('landUseTypes', {'id': 1301, 'landUseTypeName': 'Food', 'landUseTypeDescription': 'Used as food or ingredients'});
        await db.insert('landUseTypes', {'id': 1302, 'landUseTypeName': 'Medicine', 'landUseTypeDescription': 'Used for medicinal purposes'});
        await db.insert('landUseTypes', {'id': 1303, 'landUseTypeName': 'Insecticide', 'landUseTypeDescription': 'Used to repel insects'});
        await db.insert('landUseTypes', {'id': 1304, 'landUseTypeName': 'Construction', 'landUseTypeDescription': 'Used in building materials'});
        await db.insert('landUseTypes', {'id': 1305, 'landUseTypeName': 'Culture', 'landUseTypeDescription': 'Used in traditional practices'});

        await db.insert('landUses', {'id': 2001, 'plantID': 1001, 'componentID': 1103, 'landUseTypeID': 1301, 'landUseDescription': 'Mango fruit is eaten fresh or dried'});
        await db.insert('landUses', {'id': 2002, 'plantID': 1002, 'componentID': 1101, 'landUseTypeID': 1302, 'landUseDescription': 'Neem leaves are used to treat skin infections'});
        await db.insert('landUses', {'id': 2003, 'plantID': 1003, 'componentID': 1104, 'landUseTypeID': 1304, 'landUseDescription': 'Bamboo stems are used in building houses'});
        await db.insert('landUses', {'id': 2004, 'plantID': 1004, 'componentID': 1105, 'landUseTypeID': 1302, 'landUseDescription': 'Ginger roots are used for digestive issues'});
      },
    );
  }

  Future<List<Plant>> getPlants() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('plants');

    return List.generate(maps.length, (i) {
      return Plant(
        id: maps[i]['id'],
        plantName: maps[i]['plantName'],
        plantScientific: maps[i]['plantScientific'],
        plantImage: maps[i]['plantImage'],
      );
    });
  }

  Future<List<LandUse>> getLandUsesByPlantID(int plantID) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'landUses',
      where: 'plantID = ?',
      whereArgs: [plantID],
    );

    return List.generate(maps.length, (i) {
      return LandUse(
        id: maps[i]['id'],
        plantID: maps[i]['plantID'],
        componentID: maps[i]['componentID'],
        landUseTypeID: maps[i]['landUseTypeID'],
        landUseDescription: maps[i]['landUseDescription'],
      );
    });
  }
}