import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String article;
  final double price;
  final String sexe;
  final String sport;
  final String image;
  final List<String> colors;

  const Product({
    required this.article,
    required this.price,
    required this.sexe,
    required this.sport,
    required this.image,
    required this.colors,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      article: map['article'] as String,
      price: map['prix'] as double,
      sexe: map['sexe'] as String,
      sport: map['sport'] as String,
      image: map['photo'] as String,
      colors: (map['couleur'] as String).split(', '),
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        article,
        price,
        sexe,
        sport,
        image,
        colors.length,
      ];
}

final List<Product> products = temps.map((e) => Product.fromMap(e)).toList();

final List<Map<String, dynamic>> temps = [
  {
    "article": "Air Jordan 1 Low SE",
    "prix": 119.99,
    "sexe": "Homme",
    "sport": "Basket",
    "photo": "air-jordan-1-low-se.jpg",
    "couleur": "noir, rouge"
  },
  {
    "article": "Mercurial Vapor 14 elite",
    "prix": 249.99,
    "sexe": "Homme",
    "sport": "Football",
    "photo": "mercurial-vapor-14-elite.jpg",
    "couleur": "blanc, jaune"
  },
  {
    "article": "Nike Zoom Mamba 3",
    "prix": 97.97,
    "sexe": "Homme",
    "sport": "Running",
    "photo": "nike-zoom-mamba-3.jpg",
    "couleur": "bleu"
  },
  {
    "article": "Nike Downshifter 11",
    "prix": 59.99,
    "sexe": "Femme",
    "sport": "Running",
    "photo": "nike-downshifter-11.jpg",
    "couleur": "noir, rose"
  },
  {
    "article": "Nike Phantom GT Elite 3D AG-Pro",
    "prix": 269.99,
    "sexe": "Femme",
    "sport": "Football",
    "photo": "nike-phantom-gt-elite-3d-ag-pro.jpg",
    "couleur": "blanc, rose, bleu, jaune"
  },
  {
    "article": "Nike React Metcon Turbo",
    "prix": 149.99,
    "sexe": "Femme",
    "sport": "Running",
    "photo": "nike-react-metcon-turbo.jpg",
    "couleur": "rose, bleu"
  },
  {
    "article": "Nike Tiempo Legend 8 Club IC",
    "prix": 49.99,
    "sexe": "Mixte",
    "sport": "Football",
    "photo": "nike-tiempo-legend-8-club-ic.jpg",
    "couleur": "Vert, blanc"
  },
  {
    "article": "PG 5",
    "prix": 119.99,
    "sexe": "Mixte",
    "sport": "Basket",
    "photo": "pg-5.jpg",
    "couleur": "noir, rouge, blanc"
  },
  {
    "article": "Nike Premier II FG",
    "prix": 99.99,
    "sexe": "Mixte",
    "sport": "Football",
    "photo": "nike-premier-ii-fg.jpg",
    "couleur": "Noir, gris"
  },
];
