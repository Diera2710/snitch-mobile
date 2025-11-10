import 'package:flutter/material.dart';
import 'package:snitch_mobile/widgets/left_drawer.dart';

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
  String _category = "";
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Produk berhasil tersimpan'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: $_name'),
                                Text('Price: $_price'),
                                Text('Description: $_description'),
                                Text('Category: $_category'),
                                Text('Thumbnail: $_thumbnail'),
                                Text(
                                  'Featured: ${_isFeatured ? "Yes" : "No"}',
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                                _formKey.currentState!.reset();
                              },
                            ),
                          ],
                        ),
                      );
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
