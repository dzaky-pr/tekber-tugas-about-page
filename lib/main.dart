import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      home: MyProfilePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyProfilePage extends StatelessWidget {
  final List<String> imageUrls = [
    'images/himabits_dasar_website.JPG',
    'images/ise24.jpeg',
    'images/lari.jpg',
    'images/idx.JPG',
    'images/bimtek.jpg',
    'images/betau.jpeg',
  ];

  Widget _buildStatColumn(String label, String count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 4), // Jarak antara angka dan label
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon, {bool active = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: active
              ? Colors.white
              : Colors.grey.shade600, // Warna berubah jika aktif
        ),
        const SizedBox(height: 8), // Jarak antara ikon dan garis bawah
        if (active)
          Container(
            width: 24,
            height: 2,
            color: Colors.white, // Warna garis bawah jika aktif
          ),
      ],
    );
  }

  Widget _buildIconTextRow({
    required IconData icon,
    required String text,
    Color iconColor = Colors.white,
    double iconSize = 16.0,
    double textSize = 12.0,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
          semanticLabel: 'Icon Details',
        ),
        const SizedBox(width: 4), // Jarak antara ikon dan teks
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'dzaky.rifai',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage('images/image.png'),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatColumn('Post', '10'),
                          _buildStatColumn('Followers', '2081'),
                          _buildStatColumn('Following', '2087'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 16), // Jarak antara foto dan detail bawah
                const Text(
                  'Dzaky Purnomo Rifa\'i',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Beasiswa Unggulan Awardee Kemendikbudristek RI 2023 | Undergraduate Information System Student at Institut Teknologi Sepuluh Nopember',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 8),

                const SizedBox(height: 4),
                Column(
                  children: [
                    _buildIconTextRow(
                      icon: Icons.account_circle,
                      text: 'NRP: 5026221085',
                      iconColor: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    _buildIconTextRow(
                      icon: Icons.celebration,
                      text:
                          'Funfact: Frontend Developer, aspiring Techpreneur, and lifelong learner.',
                      iconColor: Colors.white,
                    ),
                  ],
                ),

                const SizedBox(height: 36),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButtonColumn(Icons.apps, active: true),
                    _buildButtonColumn(Icons.video_library),
                    _buildButtonColumn(Icons.bookmark_border),
                  ],
                ),

                // Grid view untuk menampilkan gambar lokal
                const SizedBox(height: 12), // Jarak sebelum grid
                GridView.builder(
                  shrinkWrap: true, // Agar grid tidak mengambil ruang penuh
                  physics:
                      const NeverScrollableScrollPhysics(), // Non-scrollable grid
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 kolom
                    crossAxisSpacing: 8, // Jarak antar kolom
                    mainAxisSpacing: 8, // Jarak antar baris
                  ),
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imageUrls[index],
                      fit: BoxFit.cover, // Agar gambar tetap pas di dalam grid
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
