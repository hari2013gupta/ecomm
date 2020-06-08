class Place {
  String imageUrl;
  String city;
  String country;
  String description;

  Place({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
  });
}

List<Place> recentPlaces = [
  Place(
    imageUrl: 'assets/images/travel/venice.jpg',
    city: 'recentPlace1',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
  ),
  Place(
    imageUrl: 'assets/images/travel/paris.jpg',
    city: 'recentPlace2',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
  ),
];

List<Place> places = [
  Place(
    imageUrl: 'assets/images/travel/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
  ),
  Place(
    imageUrl: 'assets/images/travel/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
  ),
  Place(
    imageUrl: 'assets/images/travel/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
  ),
  Place(
    imageUrl: 'assets/images/travel/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
  ),
  Place(
    imageUrl: 'assets/images/travel/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
  ),
];
