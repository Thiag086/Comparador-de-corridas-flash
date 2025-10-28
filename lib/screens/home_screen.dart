import 'package:flutter/material.dart';
import '../models/ride_estimate.dart';
import '../services/ride_service.dart';
import '../widgets/estimate_card.dart';
import '../widgets/location_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RideService _rideService = RideService();
  List<RideEstimate> _estimates = [];
  bool _isLoading = false;
  String _startLocation = 'Rua A, 123 (Simulado)';
  String _endLocation = 'Avenida B, 456 (Simulado)';

  // Coordenadas simuladas para que a lógica de preço funcione
  final double _startLat = -23.5505;
  final double _startLon = -46.6333;
  final double _endLat = -23.5614;
  final double _endLon = -46.6562;

  // Variáveis para simular a mudança de local
  bool _isDefaultLocation = true;

  @override
  void initState() {
    super.initState();
    _fetchEstimates();
  }

  Future<void> _fetchEstimates() async {
    setState(() {
      _isLoading = true;
      _estimates = [];
    });

    try {
      final estimates = await _rideService.fetchEstimates(
        _startLat,
        _startLon,
        _endLat,
        _endLon,
      );
      setState(() {
        _estimates = estimates;
      });
    } catch (e) {
      // Em um app real, aqui teríamos um tratamento de erro mais robusto
      print('Erro ao buscar estimativas: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparador de Corridas Flash'),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildLocationInput(),
          const Divider(height: 1, thickness: 1, color: Colors.grey),
          Expanded(
            child: _buildResultsList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _fetchEstimates,
        backgroundColor: _isLoading ? Colors.grey : Colors.green,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildLocationInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          LocationInput(
            icon: Icons.my_location,
            label: 'Origem',
            value: _startLocation,
            onTap: _toggleLocation,
          ),
          const SizedBox(height: 10),
          LocationInput(
            icon: Icons.location_on,
            label: 'Destino',
            value: _endLocation,
            onTap: _toggleLocation,
          ),
          const SizedBox(height: 10),
          Text(
            'Atenção: Os preços são simulados. Toque nos locais para simular mudança de rota. Toque em "Atualizar" para recalcular.',
            style: TextStyle(color: Colors.red.shade700, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _toggleLocation() {
    setState(() {
      _isDefaultLocation = !_isDefaultLocation;
      if (_isDefaultLocation) {
        _startLocation = 'Rua A, 123 (Simulado)';
        _endLocation = 'Avenida B, 456 (Simulado)';
      } else {
        _startLocation = 'Shopping Center (Simulado)';
        _endLocation = 'Aeroporto Internacional (Simulado)';
      }
    });
    _fetchEstimates();
  }

  Widget _buildResultsList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_estimates.isEmpty) {
      return const Center(
        child: Text('Toque no botão para buscar as estimativas de preço.'),
      );
    }

    // O primeiro item da lista é o mais barato, devido à ordenação no RideService
    final bestPriceEstimate = _estimates.isNotEmpty ? _estimates.first : null;

    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: _estimates.length,
      itemBuilder: (context, index) {
        final estimate = _estimates[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: EstimateCard(
            estimate: estimate,
            isBestPrice: estimate == bestPriceEstimate,
          ),
        );
      },
    );
  }
}
