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

## Tugas 8
Perbedaan Navigator.push() dan Navigator.pushReplacement()
Dalam Flutter, Navigator.push() digunakan untuk menambahkan halaman baru ke atas tumpukan (stack)
navigasi tanpa menghapus halaman sebelumnya. Artinya, pengguna masih bisa kembali ke halaman
sebelumnya menggunakan tombol “back”. Sebaliknya, Navigator.pushReplacement() menggantikan halaman
saat ini dengan halaman baru dan menghapus halaman lama dari stack, sehingga pengguna tidak bisa
kembali ke halaman sebelumnya. Pada aplikasi Football Shop, Navigator.push() digunakan saat berpindah
ke halaman seperti “Create Product” atau “All Products” dari halaman utama, karena pengguna mungkin ingin
kembali ke menu utama setelah mengisi form. Sedangkan Navigator.pushReplacement() digunakan di
bagian Drawer, karena berpindah melalui menu samping seharusnya mengganti halaman utama sepenuhnya
tanpa menumpuk banyak halaman serupa di dalam stack.
Pemanfaatan hierarchy widget seperti Scaffold, AppBar, dan Drawer
Struktur aplikasi Football Shop dibuat konsisten dengan menggunakan hirarki widget utama dari Flutter, yaitu
Scaffold, AppBar, dan Drawer. Widget Scaffold berfungsi sebagai kerangka utama setiap halaman,
menyediakan struktur yang sama untuk AppBar, Drawer, dan konten utama (body). Dengan begitu, semua
halaman seperti MyHomePage, ProductFormPage, dan ProductListPage memiliki tata letak yang seragam.
Widget AppBar menampilkan judul halaman di bagian atas dengan warna pink sebagai identitas visual
aplikasi, sedangkan Drawer digunakan sebagai navigasi samping untuk berpindah antarhalaman seperti
Halaman Utama, Tambah Produk, dan Lihat Produk. Karena Drawer diimplementasikan dalam widget
terpisah (LeftDrawer), navigasi bisa digunakan kembali di setiap halaman tanpa menulis ulang kode,
membuat tampilan aplikasi tetap rapi dan konsisten.
Kelebihan layout widget seperti Padding, SingleChildScrollView, dan ListView
Widget layout seperti Padding, SingleChildScrollView, dan ListView membantu menjaga kenyamanan
tampilan antarmuka dan keteraturan elemen di dalam form. Padding memberikan ruang di sekitar elemen
agar teks dan field tidak menempel pada tepi layar, sehingga tampilan lebih rapi dan mudah dibaca.
SingleChildScrollView digunakan untuk membungkus keseluruhan form agar pengguna bisa menggulir
halaman ke bawah ketika form berisi banyak input, serta mencegah error overflow ketika keyboard muncul di
layar kecil. Sedangkan ListView digunakan dalam Drawer agar daftar menu seperti Halaman Utama dan
Tambah Produk dapat digulir dengan mudah ketika jumlah item bertambah. Kombinasi tiga widget ini
membuat form tetap responsif dan nyaman diakses di berbagai ukuran layar, dari laptop hingga smartphone.
Penyesuaian warna tema agar konsisten dengan brand toko
Agar aplikasi Football Shop memiliki identitas visual yang konsisten, tema warna aplikasi diatur melalui
ThemeData di file main.dart. Warna utama (primarySwatch) ditetapkan sebagai pink, sementara warna
sekunder (secondary) diatur menggunakan variasi Colors.pink[200]. Warna pink kemudian diterapkan pada
AppBar, tombol utama seperti “Save”, serta kartu menu di halaman utama. Setiap card di grid menu
menggunakan gradasi warna pink yang berbeda—mulai dari pink muda hingga pink tua—sehingga tampilan
aplikasi terlihat lembut namun tetap selaras dengan citra brand Snitch Football Shop yang ceria dan modern.
Dengan penerapan tema ini, seluruh elemen aplikasi memiliki kesan visual yang seragam, profesional, dan
mudah dikenali.
notes : pada aplikasi mobile, warna tampilan masih berbeda dengan aplikasi web pada TI sebelumnya (sebelum flutter)