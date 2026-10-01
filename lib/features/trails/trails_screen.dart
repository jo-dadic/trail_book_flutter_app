import 'package:flutter/material.dart';

import 'add_trail_screen.dart';
import 'mock/mock_trails.dart';
import 'trail.dart';
import 'trail_card.dart';
import 'trail_details_screen.dart';

class TrailsScreen extends StatefulWidget {
  const TrailsScreen({super.key});

  @override
  State<TrailsScreen> createState() => _TrailsScreenState();
}

class _TrailsScreenState extends State<TrailsScreen> {
  final List<Trail> _trails = [...mockTrails];

  Future<void> _openAddTrailScreen() async {
    final newTrail = await Navigator.push<Trail>(
      context,
      MaterialPageRoute(
        builder: (context) => const AddTrailScreen(),
      ),
    );

    if (newTrail == null) {
      return;
    }

    setState(() {
      _trails.add(newTrail);
    });
  }

  Future<bool> _confirmDelete(Trail trail) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete trail?'),
          content: Text('Are you sure you want to delete ${trail.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    return shouldDelete ?? false;
  }

  void _deleteTrail(Trail trail) {
    setState(() {
      _trails.removeWhere((item) => item.id == trail.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrailBook'),
        actions: [
          IconButton(
            onPressed: _openAddTrailScreen,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _trails.length,
        itemBuilder: (context, index) {
          final trail = _trails[index];

          return Dismissible(
            key: ValueKey(trail.id),
            background: Container(
              margin: const EdgeInsets.only(bottom: 12),
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 16),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (direction) {
              return _confirmDelete(trail);
            },
            onDismissed: (direction) {
              _deleteTrail(trail);
            },
            child: TrailCard(
              trail: trail,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrailDetailsScreen(trail: trail),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
