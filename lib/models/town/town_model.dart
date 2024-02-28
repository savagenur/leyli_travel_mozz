class TownModel {
  final String? name;
  final String? countryCode;
  final double? latitude;
  final double? longitude;
  final String? description;
  final List<String>? attractions;
  final String? imageUrl;

  TownModel({
    this.name,
    this.countryCode,
    this.latitude,
    this.longitude,
    this.description,
    this.attractions,
    this.imageUrl,
  });

  factory TownModel.fromJson(Map<String, dynamic> json) {
    return TownModel(
      name: json['name'],
      countryCode: json['country_code'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      description: json['description'],
      attractions: json['attractions'] != null
          ? List<String>.from(json['attractions'])
          : null,
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country_code': countryCode,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'attractions': attractions,
      'image_url': imageUrl,
    };
  }
}
