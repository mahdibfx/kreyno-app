class BuyerLocationUpdated {
  final int reservationId;
  final num latitude;
  final num longitude;
  final bool arrived;
  BuyerLocationUpdated({
    required this.reservationId,
    required this.latitude,
    required this.longitude,
    this.arrived = false,
  });

  factory BuyerLocationUpdated.fromJson(Map<String, dynamic> json) {
    return BuyerLocationUpdated(
      reservationId: json['reservationId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      arrived: json['arrived'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservationId': reservationId,
      'latitude': latitude,
      'longitude': longitude,
      'arrived': arrived,
    };
  }
}
