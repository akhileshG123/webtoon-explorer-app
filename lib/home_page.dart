import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favourites_screen.dart';
import 'webtoon.dart';


class HomePage extends StatelessWidget {
  final List<WebtoonCategory> categories = [
    WebtoonCategory('Romance', 'assets/images/romance.png'),
    WebtoonCategory('Action', 'assets/images/action.png'),
    WebtoonCategory('Comedy', 'assets/images/comedy.png'),
    WebtoonCategory('Drama', 'assets/images/drama.png'),
    WebtoonCategory('Fantasy', 'assets/images/fantasy.png'),
    WebtoonCategory('Horror', 'assets/images/horror.png'),
    WebtoonCategory('Slice of Life', 'assets/images/slice_of_life.png'),
    WebtoonCategory('Superhero', 'assets/images/superhero.png'),
    WebtoonCategory('Thriller', 'assets/images/thriller.png'),
    WebtoonCategory('Sci-Fi', 'assets/images/sci_fi.png'),
  ];

  final List<Webtoon> webtoons = [
    Webtoon(
      title: 'Love Equation',
      imageUrl: 'assets/images/love_equation.png',
      description: 'A heartwarming romance about two math geniuses who discover that love can\'t be calculated.',
      category: 'Romance',
      initialRating: 4,
    ),
    Webtoon(
      title: 'Blade of the Immortal',
      imageUrl: 'assets/images/blade_of_immortal.png',
      description: 'An action-packed tale of an immortal warrior seeking redemption in feudal Japan.',
      category: 'Action',
      initialRating: 4.3,
    ),
    Webtoon(
      title: 'Office Shenanigans',
      imageUrl: 'assets/images/office_shenanigam.png',
      description: 'A hilarious look at the daily misadventures of a quirky office team.',
      category: 'Comedy',
      initialRating: 3.6,
    ),
        Webtoon(
      title: 'Echoes of Yesterday',
      imageUrl: 'assets/images/echoes_of_yesterday.png',
      description: 'A poignant drama exploring the intertwined lives of three generations in a family saga.',
      category: 'Drama',
      initialRating: 4.6,
    ),
    Webtoon(
      title: 'Realm of Shadows',
      imageUrl: 'assets/images/realm_of_shadow.png',
      description: 'Enter a world where magic and technology collide in this epic fantasy adventure.',
      category: 'Fantasy',
      initialRating: 3.8
    ),
    Webtoon(
      title: 'Whispers in the Dark',
      imageUrl: 'assets/images/whispers_in_dark.png',
      description: 'A chilling horror series that will keep you up at night, questioning what lurks in the shadows.',
      category: 'Horror',
      initialRating: 4,
    ),
    Webtoon(
      title: 'Everyday Extraordinary',
      imageUrl: 'assets/images/everyday_extraordinary.png',
      description: 'Find beauty in the ordinary with this heartwarming slice of life story about finding joy in small moments.',
      category: 'Slice of Life',
      initialRating: 4.1,
    ),
    Webtoon(
      title: 'Quantum Guardians',
      imageUrl: 'assets/images/quantum_guardians.png',
      description: 'Join a team of unlikely heroes as they discover their superpowers and fight to save the multiverse.',
      category: 'Superhero',
      initialRating: 2.9,
    ),
    Webtoon(
      title: 'The Silent Witness',
      imageUrl: 'assets/images/the_silent_witness.png',
      description: 'A gripping thriller about a detective racing against time to catch a cunning serial killer.',
      category: 'Thriller',
      initialRating: 4.8,
    ),
    Webtoon(
      title: 'Starborn Colony',
      imageUrl: 'assets/images/starborn_colony.png',
      description: 'Experience the challenges and triumphs of humanity\'s first interstellar colony in this sci-fi epic.',
      category: 'Sci-Fi',
      initialRating: 1.4,
    ),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Webtoon Explorer',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index], webtoons: webtoons);
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final WebtoonCategory category;
  final List<Webtoon> webtoons;

  const CategoryCard({super.key, required this.category, required this.webtoons});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final webtoon = webtoons.firstWhere((w) => w.category == category.title);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(webtoon: webtoon),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(category.imageUrl, fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                category.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


