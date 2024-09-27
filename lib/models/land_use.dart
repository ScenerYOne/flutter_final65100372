class LandUse {
  final int id;
  final int plantID;
  final int componentID;
  final int landUseTypeID;
  final String landUseDescription;

  LandUse({
    required this.id,
    required this.plantID,
    required this.componentID,
    required this.landUseTypeID,
    required this.landUseDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'plantID': plantID,
      'componentID': componentID,
      'landUseTypeID': landUseTypeID,
      'landUseDescription': landUseDescription,
    };
  }
}