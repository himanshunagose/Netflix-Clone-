import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/dummy_movies.dart';
import '../../widgets/movie_card.dart';
import '../details/movie_details_screen.dart';

class ContinueWatchingScreen extends StatelessWidget {
  const ContinueWatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Continue Watching'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // Dummy count
        itemBuilder: (context, index) {
          final movie = dummyMovies[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 140,
            child: Row(
              children: [
                // Thumbnail with Progress
                SizedBox(
                  width: 220,
                  child: Stack(
                    children: [
                      MovieCard(
                        movie: movie,
                        width: 220,
                        height: 140,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsScreen(movie: movie),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 12, // Margin of MovieCard
                        child: LinearProgressIndicator(
                          value: 0.6, // Dummy progress
                          backgroundColor: Colors.grey[800],
                          color: AppColors.primary,
                          minHeight: 4,
                        ),
                      ),
                      const Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),

                // Info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '1h 24m remaining',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
