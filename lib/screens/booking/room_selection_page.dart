import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class RoomSelectionPage extends StatelessWidget {
  const RoomSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        title: const Text(
          "Select a Room",
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.maroon,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildRoomCard(
            context: context,
            title: "Standard Room",
            price: 350000,
            facilities: ["WiFi", "AC", "Shower"],
            imageUrl:
                "https://images.unsplash.com/photo-1600585154340-be6161a56a0c", // contoh gambar
          ),
          _buildRoomCard(
            context: context,
            title: "Deluxe Room",
            price: 550000,
            facilities: ["WiFi", "AC", "TV", "Shower"],
            imageUrl:
                "https://images.unsplash.com/photo-1611892440504-42a792e24d32",
          ),
          _buildRoomCard(
            context: context,
            title: "Executive Suite",
            price: 750000,
            facilities: ["WiFi", "AC", "Bathtub", "Breakfast"],
            imageUrl:
                "https://images.unsplash.com/photo-1507089947368-19c1da9775ae",
          ),
        ],
      ),
    );
  }

  // 🔥 ROOM CARD BUILDER
  Widget _buildRoomCard({
    required BuildContext context,
    required String title,
    required int price,
    required List<String> facilities,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // CONTENT
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITLE
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.maroon,
                  ),
                ),
                const SizedBox(height: 6),

                // PRICE
                Text(
                  "Rp $price / night",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.darkMaroon,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                // FACILITIES
                Wrap(
                  spacing: 8,
                  children: facilities
                      .map(
                        (f) => Chip(
                          label: Text(f),
                          backgroundColor: AppColors.lightRed.withOpacity(0.2),
                          labelStyle:
                              const TextStyle(color: AppColors.darkMaroon),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 16),

                // BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/booking-form");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.maroon,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Choose Room",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}