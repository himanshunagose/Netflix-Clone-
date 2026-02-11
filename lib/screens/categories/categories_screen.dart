import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'category_details_screen.dart'; // Will be created next
import '../../core/constants/app_colors.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Action',
      'color': Colors.redAccent,
      'icon': Icons.local_fire_department,
    },
    {
      'name': 'Comedy',
      'color': Colors.orangeAccent,
      'icon': Icons.theater_comedy,
    },
    {'name': 'Drama', 'color': Colors.purpleAccent, 'icon': Icons.masks},
    {
      'name': 'Horror',
      'color': Colors.grey,
      'icon': Icons.face_retouching_off,
    }, // Horror icon approximation
    {'name': 'Sci-Fi', 'color': Colors.blueAccent, 'icon': Icons.rocket_launch},
    {
      'name': 'Thriller',
      'color': Colors.deepPurpleAccent,
      'icon': Icons.psychology,
    },
    {'name': 'Romance', 'color': Colors.pinkAccent, 'icon': Icons.favorite},
    {'name': 'Kids', 'color': Colors.greenAccent, 'icon': Icons.child_care},
    {'name': 'Documentary', 'color': Colors.teal, 'icon': Icons.camera_roll},
    {'name': 'Reality', 'color': Colors.amber, 'icon': Icons.tv},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.transparent,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryDetailsScreen(categoryName: category['name']),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    category['color'].withOpacity(0.7),
                    category['color'].withOpacity(0.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -10,
                    bottom: -10,
                    child: Icon(
                      category['icon'],
                      size: 80,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  Center(
                    child: Text(
                      category['name'],
                      style: Theme.of(context).textTheme.displayMedium!
                          .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: (50 * index).ms).scale(),
          );
        },
      ),
    );
  }
}
