class RecommendedCategs {
  final int id;
  final String description, imageUrl;

  RecommendedCategs({this.id, this.description, this.imageUrl});
}

List<RecommendedCategs> recommendedCategs = <RecommendedCategs>[
  RecommendedCategs(
    id: 1,
    description: 'Homegrown Heroes',
    imageUrl: 'lib/resources/icons/recommendedCategs/homegrown-heroes.png',
  ),
  RecommendedCategs(
    id: 2,
    description: 'Discounted Food Bundles',
    imageUrl:
        'lib/resources/icons/recommendedCategs/discounted-food-bundle.png',
  ),
  RecommendedCategs(
    id: 3,
    description: 'FREE Delivery!',
    imageUrl: 'lib/resources/icons/recommendedCategs/free-delivery.png',
  ),
  RecommendedCategs(
    id: 4,
    description: 'Weekly Deals',
    imageUrl: 'lib/resources/icons/recommendedCategs/weekly-deals.png',
  ),
  RecommendedCategs(
    id: 5,
    description: 'Crowd Favorites',
    imageUrl: 'lib/resources/icons/recommendedCategs/crowd-favorites.png',
  ),
  RecommendedCategs(
    id: 6,
    description: 'Self pick-up',
    imageUrl: 'lib/resources/icons/recommendedCategs/take-away.png',
  ),
  RecommendedCategs(
    id: 7,
    description: 'Grab Kitchen',
    imageUrl: 'lib/resources/icons/recommendedCategs/grab-kitchen.png',
  ),
  RecommendedCategs(
    id: 8,
    description: 'All Cuisines',
    imageUrl: 'lib/resources/icons/recommendedCategs/all-cuisines.png',
  ),
];
