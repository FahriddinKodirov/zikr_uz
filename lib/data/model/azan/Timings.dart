class Timings{
  final String Fajr;
  final String Sunrise;
  final String Dhuhr;
  final String Asr;
  final String Sunset;
  final String Maghrib;
  final String Isha;
  final String Imsak;
  final String Midnight;
  final String Firstthird;
  final String Lastthird;

  Timings({
     required this.Fajr,
     required this.Sunrise,
     required this.Dhuhr,
     required this.Asr,
     required this.Sunset,
     required this.Maghrib,
     required this.Isha,
     required this.Imsak,
     required this.Midnight,
     required this.Firstthird,
     required this.Lastthird,
  });

  factory Timings.fromJson(Map<String, dynamic> json){
    return Timings(
        Fajr: json['Fajr'], 
        Sunrise: json['Sunrise'], 
        Dhuhr: json['Dhuhr'], 
        Asr: json['Asr'],
        Sunset: json['Sunset'], 
        Maghrib: json['Maghrib'], 
        Isha: json['Isha'], 
        Imsak: json['Imsak'],
        Midnight: json['Midnight'], 
        Firstthird: json['Firstthird'], 
        Lastthird: json['Lastthird'], 
        );
        
  }
}