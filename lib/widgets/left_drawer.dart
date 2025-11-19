import 'package:flutter/material.dart';
import 'package:snitch_mobile/screens/menu.dart';
import 'package:snitch_mobile/screens/productform_form.dart';        // FIXED
import 'package:snitch_mobile/screens/productlist_form.dart';       // FIXED
import 'package:snitch_mobile/screens/product_entry_list.dart';     // JSON list

// Tambahan untuk logout (tidak mengubah kode lain)
import 'package:snitch_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // For logout
    final request = context.watch<CookieRequest>();
    final String baseUrl =
        kIsWeb ? "http://localhost:8000" : "http://10.0.2.2:8000";

    return Drawer(
      child: ListView(
        children: [
          // HEADER
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            child: Column(
              children: [
                Text(
                  'Snitch Product',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Semua produk ada di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // ============================
          // HALAMAN UTAMA
          // ============================
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),

          // ============================
          // TAMBAH PRODUK
          // ============================
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProductFormPage()),
              );
            },
          ),

          // ============================
          // LIHAT PRODUK (Non-JSON)
          // ============================
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('Lihat Produk Manual'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProductListPage()),
              );
            },
          ),

          // ============================
          // PRODUCT LIST (JSON)
          // ============================
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Product List (Django JSON)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryListPage(),
                ),
              );
            },
          ),

          const Divider(),

          // ============================
          // 🔥 LOGOUT BUTTON (TAMBAHAN)
          // ============================
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () async {
              final response = await request.logout("$baseUrl/auth/logout/");
              String message = response["message"];

              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("$message See you again, $uname."),
                    ),
                  );

                  // redirect ke LoginPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
