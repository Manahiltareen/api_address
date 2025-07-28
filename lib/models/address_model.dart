class Address {
  final int id;
  final int userId;
  final String label;
  final String addressLine;
  final String city;
  final String state;
  final String postalCode;
  final String? phoneNumber;
  final String latitude;
  final String longitude;
  final String createdAt;
  final String updatedAt;

  Address({
    required this.id,
    required this.userId,
    required this.label,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.postalCode,
    this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      label: json['label'] as String,
      addressLine: json['addressLine'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postalCode'] as String,
      phoneNumber: json['phone_number'] as String?, 
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'label': label,
      'addressLine': addressLine,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'phone_number': phoneNumber,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}