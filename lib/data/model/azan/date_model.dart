class Date{
  final String readable;

  Date({
     required this.readable,
  });

  factory Date.fromJson(Map<String, dynamic> json){
    return Date(
        readable: json['readable'],
        );
        
  }
}