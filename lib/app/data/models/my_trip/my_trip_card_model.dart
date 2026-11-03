class MyTripCardModel {
  final String tripName;
  final List<String> destinations;
  final DateTime startDate;
  final DateTime endDate;
  final String imagePath;

  const MyTripCardModel({
    required this.tripName,
    required this.destinations,
    required this.startDate,
    required this.endDate,
    required this.imagePath,
  });
}
