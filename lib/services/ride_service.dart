import 'dart:math';
import '../models/ride_estimate.dart';

class RideService {
  Future<List<RideEstimate>> fetchEstimates(
      double startLat, double startLon, double endLat, double endLon) async {
    // Simulação de delay de rede
    await Future.delayed(const Duration(seconds: 2));

    // Lógica de simulação:
    // A simulação de preços é baseada na distância (simulada pela diferença de coordenadas)
    // e um fator de "demanda" aleatório para simular a variação de preços.

    // Simulação de distância (apenas um fator para variar o preço)
    final distanceFactor =
        sqrt(pow(startLat - endLat, 2) + pow(startLon - endLon, 2));

    // Fator de demanda (simula o "surge" ou preço dinâmico)
    final demandFactor = 1.0 + Random().nextDouble() * 0.5; // Varia de 1.0 a 1.5

    // Preço base simulado
    final basePrice = 15.0 + distanceFactor * 1000;

    final estimates = <RideEstimate>[
      // Uber
      RideEstimate(
        serviceName: 'Uber',
        category: 'Uber X',
        minPrice: (basePrice * 0.9 * demandFactor),
        maxPrice: (basePrice * 1.1 * demandFactor),
        durationMinutes: 15 + Random().nextInt(5).toDouble(),
      ),
      RideEstimate(
        serviceName: 'Uber',
        category: 'Comfort',
        minPrice: (basePrice * 1.2 * demandFactor),
        maxPrice: (basePrice * 1.4 * demandFactor),
        durationMinutes: 15 + Random().nextInt(5).toDouble(),
      ),
      // 99
      RideEstimate(
        serviceName: '99',
        category: '99 Pop',
        minPrice: (basePrice * 0.85 * demandFactor),
        maxPrice: (basePrice * 1.05 * demandFactor),
        durationMinutes: 16 + Random().nextInt(5).toDouble(),
      ),
      RideEstimate(
        serviceName: '99',
        category: '99 Comfort',
        minPrice: (basePrice * 1.15 * demandFactor),
        maxPrice: (basePrice * 1.35 * demandFactor),
        durationMinutes: 16 + Random().nextInt(5).toDouble(),
      ),
      // Outro (ex: InDrive, Táxi)
      RideEstimate(
        serviceName: 'Outro',
        category: 'Táxi Comum',
        minPrice: (basePrice * 1.0 * (1.0 + Random().nextDouble() * 0.2)),
        maxPrice: (basePrice * 1.2 * (1.0 + Random().nextDouble() * 0.2)),
        durationMinutes: 14 + Random().nextInt(5).toDouble(),
      ),
    ];

    // Ordenar do mais barato para o mais caro (usando o preço mínimo para ordenação)
    estimates.sort((a, b) => a.minPrice.compareTo(b.minPrice));

    return estimates;
  }
}
