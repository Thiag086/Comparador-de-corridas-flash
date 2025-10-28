import 'package:flutter/material.dart';
import '../models/ride_estimate.dart';

class EstimateCard extends StatelessWidget {
  final RideEstimate estimate;
  final bool isBestPrice;

  const EstimateCard({
    Key? key,
    required this.estimate,
    this.isBestPrice = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceRange =
        'R\$ ${estimate.minPrice.toStringAsFixed(2)} - R\$ ${estimate.maxPrice.toStringAsFixed(2)}';

    return Card(
      elevation: isBestPrice ? 8 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: isBestPrice
            ? const BorderSide(color: Colors.green, width: 3)
            : BorderSide.none,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isBestPrice ? Colors.green.shade100 : Colors.blueGrey.shade50,
          child: isBestPrice
              ? const Icon(Icons.star, color: Colors.green)
              : const Icon(Icons.directions_car, color: Colors.blueGrey),
        ),
        title: Text(
          '${estimate.serviceName} - ${estimate.category}',
          style: TextStyle(
            fontWeight: isBestPrice ? FontWeight.bold : FontWeight.normal,
            color: isBestPrice ? Colors.green.shade800 : Colors.black,
          ),
        ),
        subtitle: Text(
          'Tempo: ${estimate.durationMinutes.toStringAsFixed(0)} min',
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              priceRange,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isBestPrice ? Colors.green.shade700 : Colors.blue.shade700,
              ),
            ),
            if (isBestPrice)
              const Text(
                'MELHOR PREÇO!',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
