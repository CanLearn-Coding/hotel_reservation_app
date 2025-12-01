import 'package:flutter/material.dart';
import '/utils/colors.dart'; // ganti path sesuai project
import 'hotel_detail_page.dart'; // kalau mau navigasi ke detail

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _promoIndex = 0;

  final List<String> promoImages = [
    "https://picsum.photos/800/400?random=1",
    "https://picsum.photos/800/400?random=2",
    "https://picsum.photos/800/400?random=3",
  ];

  final List<Map<String, dynamic>> hotels = [
    {
      "name": "Maroon Luxury Hotel",
      "location": "Jakarta",
      "rating": 4.6,
      "image": "https://picsum.photos/600/300?random=11",
    },
    {
      "name": "Red Palace Resort",
      "location": "Bandung",
      "rating": 4.3,
      "image": "https://picsum.photos/600/300?random=12",
    },
    {
      "name": "Crimson Stay Inn",
      "location": "Bali",
      "rating": 4.8,
      "image": "https://picsum.photos/600/300?random=13",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.maroon,
        elevation: 0,
        title: const Text(
          "Hotel+",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      // ========================= BODY =========================
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 16),

          // ========================= SEARCH BAR =========================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onTap: () {
                // TODO: arahkan ke SearchPage
              },
              decoration: InputDecoration(
                hintText: "Search hotels...",
                prefixIcon: const Icon(Icons.search, color: AppColors.maroon),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.lightRed),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.maroon, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ========================= CAROUSEL PROMO =========================
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: promoImages.length,
                  onPageChanged: (i) => setState(() => _promoIndex = i),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          promoImages[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),

                // Dots Indicator
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      promoImages.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: _promoIndex == i ? 22 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color:
                              _promoIndex == i ? AppColors.maroon : AppColors.lightRed,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ========================= LIST HOTEL =========================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              "Recommended Hotels",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.maroon,
              ),
            ),
          ),
          const SizedBox(height: 12),

          ...hotels.map((hotel) {
            return GestureDetector(
              onTap: () {
                // TODO: Navigate ke detail hotel
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Foto hotel
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                        hotel["image"],
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotel["name"],
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColors.maroon,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: AppColors.darkMaroon, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                hotel["location"],
                                style: const TextStyle(
                                  color: AppColors.darkMaroon,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 18, color: AppColors.red),
                              const SizedBox(width: 4),
                              Text(
                                hotel["rating"].toString(),
                                style: const TextStyle(
                                  color: AppColors.darkMaroon,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),

        ],
      ),
    );
  }
}
