import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Class with required named parameters (Lesson 3: OOP + null safety)
class Food {
  final String name;
  final String description;
  final double price;
  final IconData icon;

  const Food({
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
  });
}

const List<Food> menu = [
  Food(
    name: 'Salmon Sushi',
    description: 'Fresh sliced salmon served over seasoned sushi rice. '
        'Silky, rich and lightly sweet.',
    price: 9.90,
    icon: Icons.set_meal,
  ),
  Food(
    name: 'Tamago Sushi',
    description: 'Sweet Japanese layered omelette on a pillow of sushi '
        'rice, held together with a strip of nori.',
    price: 6.50,
    icon: Icons.egg_alt,
  ),
  Food(
    name: 'Spicy Tuna Sushi',
    description: 'Chopped tuna mixed with spicy mayo and chilli, '
        'rolled with rice and seaweed.',
    price: 11.50,
    icon: Icons.local_fire_department,
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            fontSize: 26,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          for (final food in menu) FoodCard(food: food),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        // Tap a card to open the detail screen with the description
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(food: food)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                color: Colors.orange.shade300,
                child: Icon(food.icon, size: 48, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  food.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Food food;

  const DetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          food.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(food.icon, size: 96, color: Colors.white),
              ),
              const SizedBox(height: 24),
              Text(
                food.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                food.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'RM ${food.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
