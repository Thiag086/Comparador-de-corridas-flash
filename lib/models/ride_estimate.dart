class RideEstimate {
  final String serviceName;
  final String category;
  final double minPrice;
  final double maxPrice;
  final double durationMinutes;

  RideEstimate({
    required this.serviceName,
    required this.category,
    required this.minPrice,
    required this.maxPrice,
    required this.durationMinutes,
  });
}
