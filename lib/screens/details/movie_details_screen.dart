import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../models/movie_model.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/gradient_overlay.dart';
import '../../widgets/movie_card.dart';
import '../../widgets/section_header.dart';
import '../../data/dummy_movies.dart'; // For similar content
import '../player/video_player_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Parallax Header
          SliverAppBar(
            expandedHeight: 450,
            pinned: true,
            backgroundColor: AppColors.background,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag:
                        'movie_${movie.id}', // Hero animation from previous screen
                    child: Image.network(movie.backdropUrl, fit: BoxFit.cover),
                  ),
                  const GradientOverlay(
                    height: 450,
                    colors: [Colors.transparent, AppColors.background],
                    stops: [0.4, 1.0],
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Stats
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ).animate().fadeIn().moveY(begin: 20, end: 0),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _buildTag(context, movie.year),
                      const SizedBox(width: 12),
                      _buildTag(context, movie.genre),
                      const SizedBox(width: 12),
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        movie.rating.toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        movie.duration,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ).animate().fadeIn(delay: 200.ms),

                  const SizedBox(height: 24),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                        label: 'Play Now',
                        icon: Icons.play_arrow_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const VideoPlayerScreen(),
                            ),
                          );
                        },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          label: 'Watchlist',
                          icon: Icons.add_rounded,
                          isPrimary: false,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),

                  const SizedBox(height: 32),

                  // Description
                  Text(
                    'Plot Summary',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.description,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey[400],
                      height: 1.5,
                    ),
                  ).animate().fadeIn(delay: 600.ms),

                  const SizedBox(height: 32),

                  // Cast
                  Text(
                    'Cast',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: movie.cast.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.card,
                              backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=facearea&facepad=2&w=100&h=100&q=80', // Dummy face image
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movie.cast[index].split(
                                ' ',
                              )[0], // First name only for space
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Similar Content
                  const SectionHeader(title: 'More Like This'),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dummyMovies.length,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          movie: dummyMovies[index],
                          width: 110,
                          height: 160,
                          onTap: () {
                            Navigator.pushReplacement(
                              // Replace to avoid deep stack
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsScreen(
                                  movie: dummyMovies[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
