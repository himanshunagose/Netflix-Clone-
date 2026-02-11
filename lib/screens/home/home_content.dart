import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../data/dummy_movies.dart';
import '../../widgets/movie_card.dart';
import '../../widgets/section_header.dart';
import '../../widgets/gradient_overlay.dart';
import '../details/movie_details_screen.dart'; // Will be created next
import '../notifications/notifications_screen.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int _bannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Collapsing App Bar with Banner
        SliverAppBar(
          expandedHeight: 500.0,
          floating: false,
          pinned: true,
          backgroundColor: AppColors.background,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 500.0,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _bannerIndex = index;
                      });
                    },
                  ),
                  items: trendingMovies.take(5).map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.network(
                          movie.posterUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    );
                  }).toList(),
                ),
                const GradientOverlay(
                  height: 500,
                  colors: [Colors.transparent, AppColors.background],
                  stops: [0.5, 1.0],
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      /*
                      Text(
                        trendingMovies[_bannerIndex].title,
                        style: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(trendingMovies[_bannerIndex].genre, style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(width: 8),
                          const Icon(Icons.circle, size: 4, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(trendingMovies[_bannerIndex].year, style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(height: 20),
                      */
                      AnimatedSmoothIndicator(
                        activeIndex: _bannerIndex,
                        count: 5,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: AppColors.primary,
                          dotColor: Colors.grey,
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Content Sections
        SliverToBoxAdapter(
          child: Column(
            children: [
              _buildSection(context, AppStrings.trending, trendingMovies),
              _buildSection(context, AppStrings.newReleases, newReleases),
              _buildSection(context, AppStrings.topRated, topRated),
              _buildSection(
                context,
                AppStrings.originals,
                dummyMovies,
              ), // Reusing dummy for originals
              // Extra padding for bottom nav
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection(BuildContext context, String title, List movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title, onSeeAll: () {}),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: movies[index],
                showTitle: false, // Clean look
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailsScreen(movie: movies[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
