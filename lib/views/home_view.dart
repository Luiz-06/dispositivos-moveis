import 'package:flutter/material.dart';
import 'hotel_details_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static final List<Map<String, dynamic>> _hotels = [
    {
      'name': 'Pet Paradise Resort',
      'address': 'Av. Paulista, 1000 - São Paulo, SP',
      'price': 'R\$ 120,00',
      'rating': 4.8,
      'image': 'https://images.unsplash.com/photo-1587559070757-f72a388edbba?w=500', 
      'description': 'Um resort completo com piscina para cães e área de agility.',
      'lat': -23.5644, 
      'lng': -46.6523,
    },
    {
      'name': 'Cantinho do Gato',
      'address': 'Copacabana Palace - Rio de Janeiro, RJ',
      'price': 'R\$ 85,00',
      'rating': 4.5,
      'image': 'https://images.unsplash.com/photo-1548802673-380ab8ebc7b7?w=500',
      'description': 'Especializado em felinos, com arranhadores em todos os quartos.',
      'lat': -22.9671, 
      'lng': -43.1789,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotéis Disponíveis"),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _hotels.length,
        itemBuilder: (context, index) {
          final hotel = _hotels[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetailsView(hotelData: hotel),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      hotel['image'],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => 
                        const SizedBox(height: 150, child: Center(child: Icon(Icons.broken_image))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              hotel['name'],
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 20),
                                Text(" ${hotel['rating']}", style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(hotel['address'], style: TextStyle(color: Colors.grey[600])),
                        const SizedBox(height: 8),
                        Text(
                          "A partir de ${hotel['price']}/noite",
                          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}