# snitch_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tugas 7
Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
->Widget tree adalah struktur hierarki yang menggambarkan bagaimana semua elemen tampilan disusun dalam sebuah aplikasi Flutter. Setiap komponen antarmuka, seperti teks, tombol, gambar, dan layout, merupakan sebuah widget yang saling berhubungan. Dalam widget tree, hubungan antarwidget bekerja dengan sistem parent-child (induk-anak). Parent widget berfungsi sebagai wadah atau pengatur bagi widget anak-anaknya, sementara child widget mengikuti aturan dan tata letak yang ditetapkan oleh parent. Contohnya, dalam aplikasi ini, Scaffold menjadi parent bagi AppBar, Body, dan SnackBar.

Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
->Dalam proyek Snitch Football Shop, saya menggunakan berbagai widget Flutter untuk membangun antarmuka aplikasi. Widget MaterialApp berperan sebagai pembungkus utama yang mengatur tema, judul, dan halaman awal aplikasi. Widget Scaffold digunakan untuk membuat kerangka dasar halaman seperti AppBar di bagian atas, area isi (body), dan area tampilan pesan sementara (SnackBar).
Untuk tata letak, digunakan Column untuk menyusun elemen secara vertikal, Row untuk menampilkan beberapa elemen sejajar secara horizontal, serta Padding dan Center untuk memberikan jarak dan memusatkan konten. Card digunakan untuk menampilkan informasi NPM, nama, dan kelas dalam bentuk kotak dengan efek bayangan, sedangkan GridView.count digunakan untuk menampilkan tiga tombol dalam format grid tiga kolom. Selain itu, Icon dan Text menampilkan ikon serta teks pada setiap tombol, InkWell memberikan efek dan aksi saat tombol ditekan, dan SnackBar menampilkan pesan sementara seperti “Kamu telah menekan tombol All Products.” Terakhir, ThemeData dan ColorScheme digunakan untuk mengatur warna tema aplikasi agar setiap tombol memiliki warna berbeda sesuai fungsinya, sedangkan Material memberikan efek khas desain Material pada tombol.


Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
->Widget MaterialApp berfungsi sebagai pintu utama atau “root” aplikasi Flutter berbasis Material Design. Melalui widget ini, pengembang dapat menentukan tema global (ThemeData), halaman awal (home), serta konfigurasi dasar seperti warna dan navigasi. MaterialApp penting karena semua komponen Material Design, seperti Scaffold atau SnackBar, membutuhkan konteks yang disediakan oleh MaterialApp. Tanpa widget ini, tampilan khas Flutter seperti AppBar dan tombol tidak akan menggunakan gaya Material Design. Oleh karena itu, MaterialApp hampir selalu digunakan sebagai widget paling atas dalam struktur aplikasi.

Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
->StatelessWidget adalah widget yang tidak memiliki state atau kondisi internal yang dapat berubah selama aplikasi berjalan. Artinya, tampilan widget ini bersifat tetap dan hanya dibangun sekali ketika dipanggil. Sebaliknya, StatefulWidget memiliki state yang dapat berubah-ubah, dan setiap kali perubahan terjadi, tampilan akan diperbarui dengan memanggil ulang metode build().
Dalam proyek ini, saya menggunakan StatelessWidget karena seluruh tampilan bersifat statis—hanya menampilkan informasi dan tombol yang tidak berubah walaupun ditekan. Namun, jika di masa depan aplikasi dikembangkan menjadi lebih interaktif (misalnya, tombol menambah produk ke daftar), maka StatefulWidget bisa digunakan untuk mengatur perubahan tersebut.

Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
->BuildContext adalah objek penting dalam Flutter yang merepresentasikan posisi atau lokasi suatu widget di dalam widget tree. Ia memungkinkan widget untuk berinteraksi dengan widget lain di atasnya (parent) atau di bawahnya (child).
BuildContext digunakan di metode build() untuk mengakses berbagai informasi dari hierarki widget, seperti tema (Theme.of(context)), ukuran layar (MediaQuery.of(context)), dan scaffold (ScaffoldMessenger.of(context)). Tanpa BuildContext, widget tidak akan tahu di mana posisinya dalam struktur aplikasi dan tidak bisa berinteraksi dengan elemen-elemen lain. Dengan kata lain, BuildContext adalah “identitas lokasi” setiap widget di dalam pohon tampilan.

Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
->Konsep hot reload di Flutter memungkinkan pengembang memperbarui tampilan aplikasi secara instan tanpa kehilangan state atau kondisi aplikasi yang sedang berjalan. Misalnya, jika kita mengubah warna tombol atau teks, cukup melakukan hot reload dan perubahan langsung terlihat tanpa harus menutup aplikasi.
Berbeda dengan hot restart, yang akan memulai ulang seluruh aplikasi dari awal dan menghapus semua state yang sedang aktif. Fitur ini digunakan ketika ada perubahan yang lebih mendasar, seperti mengubah variabel global, struktur widget utama, atau logika di fungsi main().
Kedua fitur ini mempercepat proses pengembangan karena pengembang tidak perlu membangun ulang aplikasi sepenuhnya setiap kali mengedit kode.
