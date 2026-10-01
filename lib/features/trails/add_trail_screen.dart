import 'package:flutter/material.dart';

import 'trail.dart';

class AddTrailScreen extends StatefulWidget {
  const AddTrailScreen({super.key});

  @override
  State<AddTrailScreen> createState() => _AddTrailScreenState();
}

class _AddTrailScreenState extends State<AddTrailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _distanceController = TextEditingController();
  final _durationController = TextEditingController();
  final _elevationGainController = TextEditingController();
  final _descriptionController = TextEditingController();

  TrailDifficulty _difficulty = TrailDifficulty.easy;

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _distanceController.dispose();
    _durationController.dispose();
    _elevationGainController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    final trail = Trail(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      location: _locationController.text.trim(),
      distanceKm: double.parse(_distanceController.text),
      durationMinutes: int.parse(_durationController.text),
      elevationGainMeters: int.parse(_elevationGainController.text),
      difficulty: _difficulty,
      description: _descriptionController.text.trim(),
    );

    Navigator.pop(context, trail);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Add trail')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Location is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _distanceController,
              decoration: const InputDecoration(labelText: 'Distance in km'),
              keyboardType: TextInputType.number,
              validator: (value) {
                final distance = double.tryParse(value ?? '');

                if (distance == null || distance <= 0) {
                  return 'Enter a distance greater than 0';
                }

                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _durationController,
              decoration: const InputDecoration(
                labelText: 'Duration in minutes',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                final duration = int.tryParse(value ?? '');

                if (duration == null || duration <= 0) {
                  return 'Enter duration in minutes';
                }

                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _elevationGainController,
              decoration: const InputDecoration(
                labelText: 'Elevation gain in meters',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                final elevationGain = int.tryParse(value ?? '');

                if (elevationGain == null || elevationGain < 0) {
                  return 'Enter elevation gain';
                }

                return null;
              },
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<TrailDifficulty>(
              initialValue: _difficulty,
              decoration: const InputDecoration(labelText: 'Difficulty'),
              iconEnabledColor: colorScheme.primary,
              items: TrailDifficulty.values.map((difficulty) {
                return DropdownMenuItem(
                  value: difficulty,
                  child: Text(difficulty.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                setState(() {
                  // setState kaže Flutteru da ponovno izgradi (ovaj) widget, jer se stanje promijenilo
                  _difficulty = value;
                });
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Description is required';
                }

                return null;
              },
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: FilledButton(
                onPressed: _submitForm,
                child: const Text('Save trail'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
