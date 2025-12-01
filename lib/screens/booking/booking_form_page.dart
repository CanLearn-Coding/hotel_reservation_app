import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class BookingFormPage extends StatefulWidget {
  const BookingFormPage({super.key});

  @override
  State<BookingFormPage> createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  DateTime? checkIn;
  DateTime? checkOut;
  int guests = 1;

  // DATE PICKERS
  Future<void> pickCheckIn() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    if (picked != null) setState(() => checkIn = picked);
  }

  Future<void> pickCheckOut() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: checkIn ?? DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: (checkIn ?? DateTime.now()).add(const Duration(days: 1)),
    );
    if (picked != null) setState(() => checkOut = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.maroon,
        title: const Text("Booking Form", style: TextStyle(color: AppColors.white)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =======================
              // NAMA
              // =======================
              const Text("Nama Tamu", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextFormField(
                controller: _nameController,
                decoration: inputStyle("Masukkan nama lengkap"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              const SizedBox(height: 20),

              // =======================
              // EMAIL
              // =======================
              const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextFormField(
                controller: _emailController,
                decoration: inputStyle("Alamat email"),
                validator: (v) =>
                    v!.isEmpty || !v.contains("@") ? "Masukkan email valid" : null,
              ),
              const SizedBox(height: 20),

              // =======================
              // PHONE
              // =======================
              const Text("Nomor Telepon", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: inputStyle("08xxxxxxxxxx"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              const SizedBox(height: 20),

              // =======================
              // CHECK-IN
              // =======================
              const Text("Check-in", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: pickCheckIn,
                child: containerPicker(
                  checkIn == null
                      ? "Pilih tanggal"
                      : "${checkIn!.day}/${checkIn!.month}/${checkIn!.year}",
                ),
              ),

              const SizedBox(height: 20),

              // =======================
              // CHECK-OUT
              // =======================
              const Text("Check-out", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: pickCheckOut,
                child: containerPicker(
                  checkOut == null
                      ? "Pilih tanggal"
                      : "${checkOut!.day}/${checkOut!.month}/${checkOut!.year}",
                ),
              ),

              const SizedBox(height: 20),

              // =======================
              // GUESTS SELECTOR
              // =======================
              const Text("Jumlah Tamu", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightRed),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: guests > 1
                          ? () => setState(() => guests--)
                          : null,
                      icon: const Icon(Icons.remove),
                    ),

                    Expanded(
                      child: Center(
                        child: Text(
                          "$guests Tamu",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () => setState(() => guests++),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // =======================
              // SUBMIT BUTTON
              // =======================
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.maroon,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        checkIn != null &&
                        checkOut != null) {
                      Navigator.pushNamed(context, '/summary'); // nanti ke summary
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Mohon lengkapi semua data"),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Lanjut ke Pembayaran",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // =========================
  // INPUT STYLE TEMPLATE
  // =========================
  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.lightRed),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.maroon, width: 2),
      ),
    );
  }

  // =========================
  // DATE PICKER STYLED BOX
  // =========================
  Widget containerPicker(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightRed),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: AppColors.maroon),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
