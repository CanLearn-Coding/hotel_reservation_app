import 'package:flutter/material.dart';
import '/utils/colors.dart'; // ganti sesuai project kamu

class HotelDetailPage extends StatefulWidget {
  final Map<String, dynamic> hotel;

  const HotelDetailPage({super.key, required this.hotel});

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = widget.hotel["images"];
    final String name = widget.hotel["name"];
    final String location = widget.hotel["location"];
    final double rating = widget.hotel["rating"];
    final String description = widget.hotel["description"];
    final List<String> facilities = widget.hotel["facilities"];

    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.maroon,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              // TODO: arahkan ke halaman booking
            },
            child: const Text("Book Now"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== SLIDER FOTO (PageView) ======
            SizedBox(
              height: 260,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() => currentIndex = index);
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        images[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  // Indicator dots
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: currentIndex == i ? 22 : 8,
                          decoration: BoxDecoration(
                            color: currentIndex == i
                                ? AppColors.maroon
                                : AppColors.lightRed,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ====== Nama + Lokasi + Rating ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.maroon,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppColors.darkMaroon, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: const TextStyle(
                          color: AppColors.darkMaroon,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (i) => Icon(
                          Icons.star,
                          size: 20,
                          color: i < rating
                              ? AppColors.red
                              : AppColors.lightRed,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: AppColors.darkMaroon,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ====== Deskripsi ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Description",
                style: TextStyle(
                  color: AppColors.maroon,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: AppColors.darkMaroon,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ====== Fasilitas ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Facilities",
                style: TextStyle(
                  color: AppColors.maroon,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: facilities.map((f) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.lightRed, width: 1),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check,
                            size: 18, color: AppColors.maroon),
                        const SizedBox(width: 6),
                        Text(
                          f,
                          style: const TextStyle(
                            color: AppColors.darkMaroon,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
