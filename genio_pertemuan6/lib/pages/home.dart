import 'package:convex_bottom_bar/convex_bottom_bar.dart'; // <-- Import baru
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

// 1. Mengubah widget menjadi StatefulWidget
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// 2. Membuat State Class
class _HomePageState extends State<HomePage> {
  final faker = Faker();
  int currentIndex = 0; // State untuk melacak tab yang aktif

  @override
  Widget build(BuildContext context) {
    // 3. Daftar "Halaman" (Widgets) untuk setiap tab
    //    Saya masukkan ListView.builder kita di index 0
    final List<Widget> widgets = [
      // --- WIDGET 1 (Index 0): Halaman List User ---
      ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          // Membuat data fiktif unik untuk setiap item list
          var joinDate = faker.date.dateTime(minYear: 2020, maxYear: 2024);
          var formattedDate = DateFormat.yMMMd().format(joinDate);

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(
                "https://picsum.photos/id/${870 + index}/200/300",
              ),
            ),
            title: Text(faker.person.name()),
            // Menggunakan subtitle dari kode kita sebelumnya
            subtitle: Text(
              "Email: ${faker.internet.email()}\nJoined: $formattedDate",
            ),
            isThreeLine: true,
          );
        },
      ),

      // --- WIDGET 2-5 (Index 1-4): Halaman Menu Lain ---
      Center(child: Text("MENU KE 2")),
      Center(child: Text("MENU KE 3")),
      Center(child: Text("MENU KE 4")),
      Center(child: Text("MENU KE 5")),
    ];

    // 4. Scaffold utama
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navbar")),
      // Body sekarang menampilkan widget berdasarkan currentIndex
      body: widgets[currentIndex],

      // 5. Menambahkan ConvexAppBar dari screenshot Anda
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: Colors.red[900],
        items: const [
          // Tambahkan 'const' untuk performa
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 0, // Mulai dari index 0
        onTap: (int i) {
          // Update state saat tab di-klik
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
