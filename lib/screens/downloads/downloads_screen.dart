import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/dummy_movies.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Downloads'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {}, // Smart downloads setting
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2, // Dummy downloads
        itemBuilder: (context, index) {
          final movie = dummyMovies[index + 2];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  movie.posterUrl,
                  width: 100,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '1.2 GB',
                style: TextStyle(color: Colors.grey[500]),
              ),
              trailing: const Icon(
                Icons.download_done,
                color: AppColors.primary,
              ),
            ),
          );
        },
      ),
    );
  }
}
