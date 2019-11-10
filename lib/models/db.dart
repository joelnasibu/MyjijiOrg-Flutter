
class DB {
  Map<int, dynamic> events;
  Map<int,dynamic> clients;
  Map<int,dynamic> venues;
  Map<int,dynamic> addons;
  Map<int,dynamic> organizers;
  Map<int,dynamic> packages;


  DB(){
    this.events =  {
      0: {
        'title': "Nairobi Event",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'date': '2019-10-11',
        'banner': "assets/images/banners/Aquablu.jpg",
        'categories': ["category 1", 'category 2', 'Category 3'],
        'rates': 3.5,
        'charts': [200, 130, 310, 302, 200, 320, 350, 150, 50, 250],
        'attendance': 3489,
        'price': 20.0,
        'bookings':[
          {
            'names':'Bert',
            'picture':'assets/images/display_pictures/bert.jpg',
            'payments':'cash',
            'pax': 3
          },
          {
            'names':'Barbara',
            'picture':'assets/images/display_pictures/Barbara.jpg',
            'payments':'cash',
            'pax': 2
          },
          {
            'names':'Chirstie',
            'picture':'assets/images/display_pictures/christie.jpg',
            'payments':'Credit Card',
            'pax': 1
          },
          {
            'names':'Hellen',
            'picture':'assets/images/display_pictures/Hellen.jpg',
            'payments':'cash',
            'pax': 2
          }
        ],
        'likes': 456,
      },
      1: {
        'title': "Machakos Sport",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'date': '2019-09-20',
        'banner': "assets/images/banners/AquaBlue.jpg",
        'categories': ["category 1", 'category 2', 'Category 3'],
        'rates': 3.0,
        'charts': [200, 130, 510, 300, 210, 320, 150, 150, 50, 50],
        'attendance': 489,
        'price': 35.0,
        'bookings':[
          {
            'names':'Bert',
            'picture':'assets/images/display_pictures/bert.jpg',
            'payments':'cash',
            'pax': 3
          },
          {
            'names':'Barbara',
            'picture':'assets/images/display_pictures/Barbara.jpg',
            'payments':'cash',
            'pax': 2
          },
          {
            'names':'Chirstie',
            'picture':'assets/images/display_pictures/christie.jpg',
            'payments':'Credit Card',
            'pax': 1
          },
          {
            'names':'Hellen',
            'picture':'assets/images/display_pictures/Hellen.jpg',
            'payments':'cash',
            'pax': 2
          }
        ],
        'likes': 456,
      },
      2:{
        'title': "Miss Kenya World",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'date': '2019-06-07',
        'banner': "assets/images/banners/blue.jpg",
        'categories': ["category 1", 'category 2'],
        'rates': 4.5,
        'charts': [100, 230, 110, 402, 200, 420, 150, 250, 150, 50],
        'attendance': 1289,
        'price': 10.0,
        'bookings':[
          {
            'names':'Bert',
            'picture':'assets/images/display_pictures/bert.jpg',
            'payments':'cash',
            'pax': 3
          },
          {
            'names':'Barbara',
            'picture':'assets/images/display_pictures/Barbara.jpg',
            'payments':'cash',
            'pax': 2
          },
          {
            'names':'Chirstie',
            'picture':'assets/images/display_pictures/christie.jpg',
            'payments':'Credit Card',
            'pax': 1
          },
          {
            'names':'Hellen',
            'picture':'assets/images/display_pictures/Hellen.jpg',
            'payments':'cash',
            'pax': 2
          }
        ],
        'likes': 456,
      },
      3:{
        'title': "Super League",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'date': '2019-09-18',
        'banner': "assets/images/banners/gogo-simo-artwork-2.jpg",
        'categories': ["category 1", 'category 2', 'Category 3', 'Category 4'],
        'rates': 5.0,
        'charts': [47, 180, 420, 350, 213, 32, 460, 150, 50, 250],
        'attendance': 348,
        'price': 25.0,
        'bookings':[
          {
            'names':'Bert',
            'picture':'assets/images/display_pictures/bert.jpg',
            'payments':'cash',
            'pax': 3
          },
          {
            'names':'Barbara',
            'picture':'assets/images/display_pictures/Barbara.jpg',
            'payments':'cash',
            'pax': 2
          },
          {
            'names':'Chirstie',
            'picture':'assets/images/display_pictures/christie.jpg',
            'payments':'Credit Card',
            'pax': 1
          },
          {
            'names':'Hellen',
            'picture':'assets/images/display_pictures/Hellen.jpg',
            'payments':'cash',
            'pax': 2
          }
        ],
        'likes': 456,
      },
      4: {
        'title': "Beach Boy",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'date': '2019-12-20',
        'banner': "assets/images/banners/yoga event.jpg",
        'categories': ["category 1"],
        'rates': 4.0,
        'charts': [250, 390, 110, 240, 500, 120, 450, 350, 250, 45],
        'attendance': 2807,
        'price': 72.0,
        'bookings':[
          {
            'names':'Bert',
            'picture':'assets/images/display_pictures/bert.jpg',
            'payments':'cash',
            'pax': 3
          },
          {
            'names':'Barbara',
            'picture':'assets/images/display_pictures/Barbara.jpg',
            'payments':'cash',
            'pax': 2
          },
          {
            'names':'Chirstie',
            'picture':'assets/images/display_pictures/christie.jpg',
            'payments':'Credit Card',
            'pax': 1
          },
          {
            'names':'Hellen',
            'picture':'assets/images/display_pictures/Hellen.jpg',
            'payments':'cash',
            'pax': 2
          }
        ],
        'likes': 456,
      },
    };

    
  
  }



}