class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Hugo Seiti',
  imageUrl: 'assets/images/users/hugo.jpg',
  isOnline: true,
);

// USERS
final User fredericoHanai = User(
  id: 1,
  name: 'Frederico Hanai',
  imageUrl: 'assets/images/users/hanai.jpg',
  isOnline: true,
);
final User bentoCarlos = User(
  id: 2,
  name: 'Bento Carlos',
  imageUrl: 'assets/images/users/bento.jpg',
  isOnline: true,
);
final User andressaReis = User(
  id: 3,
  name: 'Andressa Reis',
  imageUrl: 'assets/images/users/andressa.jpg',
  isOnline: false,
);
final User pauloAstraukas = User(
  id: 4,
  name: 'Paulo Astraukas',
  imageUrl: 'assets/images/users/paulo.jpg',
  isOnline: false,
);
final User fernandoCremonez = User(
  id: 5,
  name: 'Fernando Cremonez',
  imageUrl: 'assets/images/users/fernando.jpg',
  isOnline: true,
);
final User teste1 = User(
  id: 6,
  name: 'teste1',
  imageUrl: 'assets/images/users/teste1.jpg',
  isOnline: false,
);
final User teste2 = User(
  id: 7,
  name: 'teste2',
  imageUrl: 'assets/images/users/teste2.jpg',
  isOnline: false,
);
final User teste3 = User(
  id: 8,
  name: 'teste3',
  imageUrl: 'assets/images/users/teste3.jpg',
  isOnline: false,
);