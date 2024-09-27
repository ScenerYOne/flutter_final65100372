class Plant {
  final int id;
  final String plantName;
  final String plantScientific;
  final String plantImage;

  Plant({
    required this.id,
    required this.plantName,
    required this.plantScientific,
    required this.plantImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plantName': plantName,
      'plantScientific': plantScientific,
      'plantImage': plantImage,
    };
  }
}