import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../watchlist/watchlist_screen.dart';
import '../subscription/subscription_screen.dart'; // Will be created next

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Avatar
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              'John Doe',
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'Premium Member',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 32),

            _buildSectionTitle('Content'),
            _buildTile(
              context,
              Icons.favorite_border,
              'My Watchlist',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WatchlistScreen()),
              ),
            ),

            const SizedBox(height: 24),

            _buildSectionTitle('Settings'),
            _buildTile(
              context,
              Icons.card_membership,
              'Subscription Plan',
              onTap: () {
                // Navigate to Subscription Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SubscriptionScreen()),
                );
              },
            ),
            _buildTile(context, Icons.settings, 'App Settings'),
            _buildTile(context, Icons.download, 'Download Quality'),
            _buildTile(context, Icons.help_outline, 'Help & Support'),

            const SizedBox(height: 32),

            CustomButton(
              label: 'Log Out',
              icon: Icons.logout,
              isPrimary: false,
              onPressed: () {},
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    IconData icon,
    String title, {
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}
