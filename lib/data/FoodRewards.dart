class FoodRewards {
  final int id, daysLeft;
  final String description;

  FoodRewards({this.id, this.description, this.daysLeft});
}

List<FoodRewards> foodRewards = <FoodRewards>[
  FoodRewards(
    id: 1,
    description: 'Free Delivery on P550 GrabFood',
    daysLeft: 3,
  ),
  FoodRewards(
    id: 2,
    description: 'Free Del + P20 Off, min P800',
    daysLeft: 4,
  ),
  FoodRewards(
    id: 3,
    description: '30% Off, SELF PICK-UP',
    daysLeft: 4,
  ),
];
