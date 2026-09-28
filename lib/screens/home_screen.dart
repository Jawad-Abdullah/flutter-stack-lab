import 'package:flutter/material.dart';
import 'basic_stack.dart';
import 'stack_text_overlay.dart';
import 'stack_alignment.dart';
import 'stack_fit.dart';
import 'positioned_example.dart';
import 'positioned_constraints.dart';
import 'badge_notification.dart';
import 'profile_card.dart';
import 'floating_action_menu.dart';
import 'progress_overlay.dart';
import 'nested_stacks.dart';
import 'animated_stack.dart';
import 'stack_best_practices.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_MenuItem>[
      _MenuItem('1. Basic Stack', 'Three overlapping colored boxes',
          Icons.layers, Colors.blue, const BasicStackExample()),
      _MenuItem('2. Stack with Text Overlay', 'Image with positioned text',
          Icons.text_fields, Colors.teal, const StackWithTextOverlay()),
      _MenuItem('3. Stack Alignment', 'topLeft, center, bottomRight',
          Icons.align_horizontal_center, Colors.indigo, const StackAlignmentExample()),
      _MenuItem('4. Stack Fit Property', 'loose, expand, passthrough',
          Icons.fit_screen, Colors.purple, const StackFitExample()),
      _MenuItem('5. Positioned Widget', 'Boxes at corners and center',
          Icons.grid_view, Colors.deepOrange, const PositionedExample()),
      _MenuItem('6. Positioned Constraints', 'Full width, fixed, margins',
          Icons.straighten, Colors.brown, const PositionedConstraintsExample()),
      _MenuItem('7. Badge Notification', 'Cart icon with badge',
          Icons.notifications, Colors.red, const BadgeNotification()),
      _MenuItem('8. Profile Card', 'Image with gradient overlay',
          Icons.person, Colors.pink, const ProfileCardWithOverlay()),
      _MenuItem('9. Floating Action Menu', 'Expandable FAB actions',
          Icons.add_circle, Colors.green, const FloatingActionMenu()),
      _MenuItem('10. Progress Overlay', 'Loading indicator overlay',
          Icons.hourglass_top, Colors.amber, const ProgressOverlay()),
      _MenuItem('11. Nested Stacks', 'Background, middle, inner layers',
          Icons.stacked_bar_chart, Colors.cyan, const NestedStacksExample()),
      _MenuItem('12. Animated Stack', 'AnimatedPositioned card switcher',
          Icons.animation, Colors.orange, const AnimatedStackExample()),
      _MenuItem('13. Best Practices', 'Common pitfalls and fixes',
          Icons.tips_and_updates, Colors.blueGrey, const StackBestPractices()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stack Lab Manual'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: item.color,
                child: Icon(item.icon, color: Colors.white, size: 22),
              ),
              title: Text(item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item.page),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  const _MenuItem(
      this.title, this.subtitle, this.icon, this.color, this.page);
}
