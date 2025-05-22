import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';

class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<ThemeType>(
      icon: const Icon(Icons.palette_outlined),
      tooltip: 'Select Theme',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      itemBuilder: (context) => [
        _buildThemeMenuItem(
          context,
          ThemeType.dark,
          'Royal Dark',
          Icons.dark_mode,
          const Color(0xFF9D4EDD),
        ),
        _buildThemeMenuItem(
          context,
          ThemeType.light,
          'Royal Light',
          Icons.light_mode,
          const Color(0xFF4A90E2),
        ),
        _buildThemeMenuItem(
          context,
          ThemeType.brutal,
          'Brutal',
          Icons.whatshot,
          const Color(0xFFFF3D00),
        ),
        _buildThemeMenuItem(
          context,
          ThemeType.elegant,
          'Elegant',
          Icons.diamond,
          const Color(0xFF1A237E),
        ),
        _buildThemeMenuItem(
          context,
          ThemeType.cute,
          'Cute',
          Icons.favorite,
          const Color(0xFFFF69B4),
        ),
        _buildThemeMenuItem(
          context,
          ThemeType.nature,
          'Nature',
          Icons.eco,
          const Color(0xFF2E7D32),
        ),
      ],
      onSelected: (ThemeType themeType) {
        ref.read(themeProvider.notifier).setTheme(themeType);
      },
    );
  }

  PopupMenuItem<ThemeType> _buildThemeMenuItem(
    BuildContext context,
    ThemeType themeType,
    String title,
    IconData icon,
    Color color,
  ) {
    return PopupMenuItem<ThemeType>(
      value: themeType,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 