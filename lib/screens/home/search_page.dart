import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/utils/colors.dart'; // Ganti sesuai path project kamu

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  // Dummy data
  final List<Map<String, String>> hotels = [
    {
      'name': 'Grand Maroon Hotel',
      'location': 'Jakarta',
      'price': 'Rp 850.000 / malam',
      'image': 'https://picsum.photos/400/250?random=1'
    },
    {
      'name': 'Crimson Stay Resort',
      'location': 'Bandung',
      'price': 'Rp 650.000 / malam',
      'image': 'https://picsum.photos/400/250?random=2'
    },
    {
      'name': 'Red Palace Suites',
      'location': 'Yogyakarta',
      'price': 'Rp 720.000 / malam',
      'image': 'https://picsum.photos/400/250?random=3'
    },
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredHotels = hotels
        .where((hotel) =>
            hotel['name']!.toLowerCase().contains(query.toLowerCase()) ||
            hotel['location']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.maroon,
        title: const Text('Search Hotels'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => query = value),
              decoration: InputDecoration(
                hintText: 'Cari hotel, kota, atau lokasi...',
                prefixIcon: const Icon(Icons.search, color: AppColors.maroon),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.red, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.lightRed, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: filteredHotels.isEmpty
                  ? const Center(
                      child: Text(
                        'Tidak ada hasil ditemukan',
                        style: TextStyle(
                          color: AppColors.darkMaroon,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredHotels.length,
                      itemBuilder: (context, index) {
                        final hotel = filteredHotels[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.network(
                                  hotel['image']!,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hotel['name']!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.maroon,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      hotel['location']!,
                                      style: const TextStyle(
                                        color: AppColors.darkMaroon,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      hotel['price']!,
                                      style: const TextStyle(
                                        color: AppColors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.maroon,
                                          foregroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text('Lihat Detail'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
