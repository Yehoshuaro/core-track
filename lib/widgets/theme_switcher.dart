import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/theme_provider.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Your Theme',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildThemeButton(
                context,
                ref,
                ThemeType.dark,
                'Dark',
                Icons.dark_mode,
                Colors.black,
              ),
              _buildThemeButton(
                context,
                ref,
                ThemeType.light,
                'Light',
                Icons.light_mode,
                Colors.blue,
              ),
              _buildThemeButton(
                context,
                ref,
                ThemeType.brutal,
                'Brutal',
                Icons.whatshot,
                Colors.red,
              ),
              _buildThemeButton(
                context,
                ref,
                ThemeType.elegant,
                'Elegant',
                Icons.diamond,
                Colors.purple,
              ),
              _buildThemeButton(
                context,
                ref,
                ThemeType.cute,
                'Cute',
                Icons.favorite,
                Colors.pink,
              ),
              _buildThemeButton(
                context,
                ref,
                ThemeType.nature,
                'Nature',
                Icons.eco,
                Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThemeButton(
    BuildContext context,
    WidgetRef ref,
    ThemeType themeType,
    String label,
    IconData icon,
    Color color,
  ) {
    return ElevatedButton(
      onPressed: () {
        ref.read(themeProvider.notifier).setTheme(themeType);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
} 