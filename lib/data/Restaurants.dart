class Highlights {
  final int id;
  final String title, description;
  final bool isNew;
  final List<Restaurant> highlightItem;

  Highlights({
    this.id,
    this.title,
    this.description,
    this.isNew,
    this.highlightItem,
  });
}

class Restaurant {
  final int id, ratingCount, outletCount;
  final String name,
      discType,
      discDesc,
      imageUrl,
      about,
      businessStartDay,
      businessEndDay,
      businessStartTime,
      businessEndTime,
      tags;
  final double distance, discVal, rating;

  Restaurant({
    this.id,
    this.name,
    this.discType,
    this.discDesc,
    this.discVal,
    this.imageUrl,
    this.distance,
    this.about,
    this.businessStartDay,
    this.businessEndDay,
    this.businessStartTime,
    this.businessEndTime,
    this.rating,
    this.ratingCount,
    this.outletCount,
    this.tags,
  });
}

List<Highlights> highlights = <Highlights>[
  Highlights(
    id: 1,
    title: 'GrabFood Finds: Crowd Favorites',
    description: 'GrabFood\'s Hidden gems right at your fingertips',
    isNew: false,
    highlightItem: <Restaurant>[
      Restaurant(
        id: 1,
        name: 'Denny\'s - Uptown Mall',
        discType: 'AMOUNT',
        discVal: 80,
        discDesc: 'Use code ILOVEDENNYS',
        imageUrl:
            'https://i.pinimg.com/564x/96/89/9e/96899ef4f5791f3735c33663e64ab5f4.jpg',
        distance: 0.9,
        about:
            'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
        businessStartDay: 'Monday',
        businessEndDay: 'Sunday',
        businessStartTime: '08:00',
        businessEndTime: '22:00',
        rating: 4.6,
        ratingCount: 735,
        outletCount: 10,
        tags: 'American, Chicken, Fine Dining',
      ),
      Restaurant(
        id: 2,
        name: 'Single Origin - Bonifacio Global City',
        discType: 'PERCENTAGE',
        discVal: 15,
        discDesc: '(min. order of PHP 500.00)',
        imageUrl:
            'https://i.pinimg.com/564x/7a/08/ac/7a08acb3e7e63c013ee67f5896882177.jpg',
        distance: 1.6,
        about:
            'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
        businessStartDay: 'Monday',
        businessEndDay: 'Saturday',
        businessStartTime: '08:00',
        businessEndTime: '22:00',
        rating: 4.3,
        ratingCount: 257,
        outletCount: 10,
        tags: 'Breakfast, Breakfast & Brunch, Casual Dining',
      ),
      Restaurant(
        id: 3,
        name: '24/7 Super Healthy - Makati',
        discType: 'FREEDELIVERY',
        discVal: 0,
        discDesc: 'Use code UNLIFREEDELIVERY',
        imageUrl:
            'https://i.pinimg.com/564x/4f/83/c2/4f83c2c86bc132a1fba96e1bcc652af5.jpg',
        distance: 1.92,
        about:
            'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
        businessStartDay: 'Monday',
        businessEndDay: 'Sunday',
        businessStartTime: '08:00',
        businessEndTime: '22:00',
        rating: 4.2,
        ratingCount: 626,
        outletCount: 3,
        tags: 'Asian, Vegetarian & Vegan, Quick Bites',
      ),
    ],
  ),
  Highlights(
    id: 2,
    title: 'Collect by yourself',
    description: '',
    isNew: true,
    highlightItem: <Restaurant>[
      Restaurant(
        id: 1,
        name: 'Denny\'s - Uptown Mall',
        discType: 'AMOUNT',
        discVal: 80,
        discDesc: 'Use code ILOVEDENNYS',
        imageUrl:
            'https://i.pinimg.com/564x/96/89/9e/96899ef4f5791f3735c33663e64ab5f4.jpg',
        distance: 0.9,
        about:
            'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
        businessStartDay: 'Monday',
        businessEndDay: 'Sunday',
        businessStartTime: '08:00',
        businessEndTime: '22:00',
        rating: 4.6,
        ratingCount: 735,
        outletCount: 10,
        tags: 'American, Chicken, Fine Dining',
      ),
      Restaurant(
        id: 2,
        name: 'Single Origin - Bonifacio Global City',
        discType: 'PERCENTAGE',
        discVal: 15,
        discDesc: '(min. order of PHP 500.00)',
        imageUrl:
            'https://i.pinimg.com/564x/7a/08/ac/7a08acb3e7e63c013ee67f5896882177.jpg',
        distance: 1.6,
        about:
            'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
        businessStartDay: 'Monday',
        businessEndDay: 'Saturday',
        businessStartTime: '08:00',
        businessEndTime: '22:00',
        rating: 4.3,
        ratingCount: 257,
        outletCount: 10,
        tags: 'Breakfast, Breakfast & Brunch, Casual Dining',
      ),
      Restaurant(
        id: 3,
        name: '24/7 Super Healthy - Makati',
        discType: 'FREEDELIVERY',
        discVal: 0,
        discDesc: 'Use code UNLIFREEDELIVERY',
        imageUrl:
            'https://i.pinimg.com/564x/4f/83/c2/4f83c2c86bc132a1fba96e1bcc652af5.jpg',
        distance: 1.92,
        about:
            'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
        businessStartDay: 'Monday',
        businessEndDay: 'Sunday',
        businessStartTime: '08:00',
        businessEndTime: '22:00',
        rating: 4.2,
        ratingCount: 626,
        outletCount: 3,
        tags: 'Asian, Vegetarian & Vegan, Quick Bites',
      ),
    ],
  ),
];

List<Restaurant> restaurants = <Restaurant>[
  Restaurant(
    id: 1,
    name: 'Denny\'s - Uptown Mall',
    discType: 'AMOUNT',
    discVal: 80,
    discDesc: 'Use code ILOVEDENNYS',
    imageUrl:
        'https://i.pinimg.com/564x/96/89/9e/96899ef4f5791f3735c33663e64ab5f4.jpg',
    distance: 0.9,
    about:
        'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
    businessStartDay: 'Monday',
    businessEndDay: 'Sunday',
    businessStartTime: '08:00',
    businessEndTime: '22:00',
    rating: 4.6,
    ratingCount: 735,
    outletCount: 10,
    tags: 'American, Chicken, Fine Dining',
  ),
  Restaurant(
    id: 2,
    name: 'Single Origin - Bonifacio Global City',
    discType: 'PERCENTAGE',
    discVal: 15,
    discDesc: '(min. order of PHP 500.00)',
    imageUrl:
        'https://i.pinimg.com/564x/7a/08/ac/7a08acb3e7e63c013ee67f5896882177.jpg',
    distance: 1.6,
    about:
        'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
    businessStartDay: 'Monday',
    businessEndDay: 'Saturday',
    businessStartTime: '08:00',
    businessEndTime: '22:00',
    rating: 4.3,
    ratingCount: 257,
    outletCount: 10,
    tags: 'Breakfast, Breakfast & Brunch, Casual Dining',
  ),
  Restaurant(
    id: 3,
    name: '24/7 Super Healthy - Makati',
    discType: 'FREEDELIVERY',
    discVal: 0,
    discDesc: 'Use code UNLIFREEDELIVERY',
    imageUrl:
        'https://i.pinimg.com/564x/4f/83/c2/4f83c2c86bc132a1fba96e1bcc652af5.jpg',
    distance: 1.92,
    about:
        'Price are all VAT inclusive. Prices may also vary or be subject to change by the merchant.',
    businessStartDay: 'Monday',
    businessEndDay: 'Sunday',
    businessStartTime: '08:00',
    businessEndTime: '22:00',
    rating: 4.2,
    ratingCount: 626,
    outletCount: 3,
    tags: 'Asian, Vegetarian & Vegan, Quick Bites',
  ),
];
