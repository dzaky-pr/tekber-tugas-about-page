import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildButtonColumn(IconData icon,
      {required Color iconColor, bool active = false, double iconSize = 24.0}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(height: 8),
        if (active)
          Container(
            width: 24,
            height: 2,
            color: Colors.white,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
          semanticLabel: 'Icon Details',
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'dzaky.rifai',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
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
                          backgroundImage: AssetImage('images/image.png'),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatColumn('Post', '11'),
                              _buildStatColumn('Followers', '2081'),
                              _buildStatColumn('Following', '2087'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
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
                              'Funfact: Frontend Developer aspiring to become a Techpreneur. A lifelong learner committed to making a positive impact on many people.',
                          iconColor: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildButtonColumn(Icons.apps,
                            iconColor: Colors.white, active: true),
                        _buildButtonColumn(Icons.video_library,
                            iconColor: Colors.grey.shade600),
                        _buildButtonColumn(Icons.bookmark_border,
                            iconColor: Colors.grey.shade600),
                      ],
                    ),
                    const SizedBox(height: 12),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
