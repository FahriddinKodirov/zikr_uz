class UserFields {
  static String id = "id";
  static String latitude = "latitude";
  static String longitude = "longitude";
  static String time = "time";
}

class LocationModel{
  final int? id;
  final double? latitude;
  final double? longitude;
  final double? time;

  LocationModel({
     this.id,
     required this.latitude,
     required this.longitude,
     required this.time
  });

  factory LocationModel.fromJson(Map<String, dynamic> json){
    return LocationModel(
        id: json['id']  as int? ?? 0, 
        latitude: json['latitude']  as double? ?? 0.0, 
        longitude: json['longitude']  as double? ?? 0.0, 
        time: json['time']  as double? ?? 0.0,
        );
  }

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.latitude: latitude,
        UserFields.longitude: longitude,
        UserFields.time: time,
      };
  
   LocationModel copyWith({
    int? id,
    double? latitude,
    double? longitude,
    double? time,
  }) {
    return LocationModel(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      time: time ?? this.time,
    );
  }
}