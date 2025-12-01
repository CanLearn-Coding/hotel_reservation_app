import 'package:flutter/material.dart';
import 'package:hotel_reservation_app/utils/colors.dart';

class BookingHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> bookings = [
    {
      "title": "Premium Studio Room",
      "date": "12 Jan 2025",
      "time": "10:00 - 12:00",
      "status": "Completed",
    },
    {
      "title": "Photography Set A",
      "date": "3 Feb 2025",
      "time": "14:00 - 16:00",
      "status": "Upcoming",
    },
    {
      "title": "Outdoor Session",
      "date": "27 Dec 2024",
      "time": "08:00 - 11:00",
      "status": "Canceled",
    },
  ];

  Color statusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Canceled":
        return Colors.red;
      default:
        return AppColors.maroon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.maroon,
        title: Text(
          "Booking History",
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final item = bookings[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkMaroon.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

              title: Text(
                item["title"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.maroon,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text("${item["date"]} | ${item["time"]}",
                      style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                  SizedBox(height: 8),

                  // Status badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: statusColor(item["status"]).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item["status"],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: statusColor(item["status"]),
                      ),
                    ),
                  ),
                ],
              ),

              trailing: Icon(Icons.chevron_right, color: AppColors.darkMaroon),
              onTap: () {
                // TODO: navigasi ke detail booking
              },
            ),
          );
        },
      ),
    );
  }
}