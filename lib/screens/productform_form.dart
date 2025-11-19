import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:snitch_mobile/widgets/left_drawer.dart';
import 'package:snitch_mobile/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "Lainnya";
  String _thumbnail = "";
  bool _isFeatured = false;

  final List<String> _categories = [
    "Jersey",
    "Sepatu",
    "Bola",
    "Aksesoris",
    "Lainnya",
  ];

  @override
  Widget build(BuildContext context) {
    // ✅ hubungkan dengan CookieRequest
    final request = context.watch<CookieRequest>();

    // Biar bisa jalan di Chrome & Emulator
    final String baseUrl =
        kIsWeb ? "http://localhost:8000" : "http://10.0.2.2:8000";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === NAME ===
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty";
                  }
                  if (value.length < 3) {
                    return "Name must be at least 3 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // === PRICE ===
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _price = int.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Price cannot be empty";
                  }
                  final parsed = int.tryParse(value);
                  if (parsed == null) {
                    return "Price must be a number";
                  }
                  if (parsed <= 0) {
                    return "Price must be greater than 0";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // === DESCRIPTION ===
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _description = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty";
                  }
                  if (value.length < 10) {
                    return "Description must be at least 10 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // === CATEGORY ===
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                ),
                value: _category,
                items: _categories
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    _category = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),

              // === THUMBNAIL ===
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Thumbnail URL (optional)",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _thumbnail = value),
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (!value.startsWith("http://") &&
                      !value.startsWith("https://")) {
                    return "Enter a valid URL (http/https)";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // === IS FEATURED ===
              SwitchListTile(
                title: const Text("Mark as Featured Product"),
                value: _isFeatured,
                activeColor: Colors.pink,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),
              const SizedBox(height: 24),

              // === SAVE BUTTON ===
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // 🔥 kirim ke Django pakai JSON
                      final response = await request.postJson(
                        "$baseUrl/create-product-flutter/",
                        jsonEncode({
                          "name": _name,
                          "price": _price,
                          "description": _description,
                          "thumbnail": _thumbnail,
                          "category": _category,
                          "is_featured": _isFeatured,
                        }),
                      );

                      if (!mounted) return;

                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Product successfully saved!"),
                          ),
                        );

                        // Balik ke home
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Something went wrong, please try again.",
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
