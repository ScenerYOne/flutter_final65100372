class PlantComponent {
  final int componentID;
  final String componentName;
  final String componentIcon;

  PlantComponent({required this.componentID, required this.componentName, required this.componentIcon});

  factory PlantComponent.fromMap(Map<String, dynamic> json) => PlantComponent(
    componentID: json['componentID'],
    componentName: json['componentName'],
    componentIcon: json['componentIcon'],
  );

  Map<String, dynamic> toMap() => {
    'componentID': componentID,
    'componentName': componentName,
    'componentIcon': componentIcon,
  };
}