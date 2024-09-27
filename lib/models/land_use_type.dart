class LandUseType {
  final int landUseTypeID;
  final String landUseTypeName;
  final String landUseTypeDescription;

  LandUseType({required this.landUseTypeID, required this.landUseTypeName, required this.landUseTypeDescription});

  factory LandUseType.fromMap(Map<String, dynamic> json) => LandUseType(
    landUseTypeID: json['landUseTypeID'],
    landUseTypeName: json['landUseTypeName'],
    landUseTypeDescription: json['landUseTypeDescription'],
  );

  Map<String, dynamic> toMap() => {
    'landUseTypeID': landUseTypeID,
    'landUseTypeName': landUseTypeName,
    'landUseTypeDescription': landUseTypeDescription,
  };
}