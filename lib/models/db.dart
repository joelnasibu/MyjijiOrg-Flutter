
class DB {
  Map<int, dynamic> events;
  Map<int,dynamic> clients;
  Map<String,dynamic> venues;
  Map<int,dynamic> addons;
  Map<int,dynamic> organizers;
  Map<int,dynamic> packages;
  Map<String,dynamic> products;


  DB(){
    this.events =  {
      0: {
        'title': "Nairobi Event",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'start_date': '2019-10-11',
        'end_date':'2019-09-20',
        'banner': "assets/images/banners/Aquablu.jpg",
        'categories': ["category 1", 'category 2', 'Category 3'],
        'rates': 3.5,
        'charts': [200, 130, 310, 302, 200, 320, 350, 150, 50, 250],
        'attendance': 3489,
        'price': 20.0,
        'organizer':2,
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
        'status': 0
      },
      1: {
        'title': "Machakos Sport",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'start_date': '2019-09-20',
        'end_date':'2019-09-20',
        'banner': "assets/images/banners/AquaBlue.jpg",
        'categories': ["category 1", 'category 2', 'Category 3'],
        'rates': 3.0,
        'charts': [200, 130, 510, 300, 210, 320, 150, 150, 50, 50],
        'attendance': 489,
        'price': 35.0,
        'organizer':2,
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
        'status': 0
      },
      2: {
        'title': "Miss Kenya World",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'start_date': '2019-06-07',
        'end_date':'2019-09-20',
        'banner': "assets/images/banners/blue.jpg",
        'categories': ["category 1", 'category 2'],
        'rates': 4.5,
        'charts': [100, 230, 110, 402, 200, 420, 150, 250, 150, 50],
        'attendance': 1289,
        'price': 10.0,
        'organizer':1,
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
        'status': 1
      },
      3: {
        'title': "Super League",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'start_date': '2019-09-18',
        'end_date':'2019-09-20',
        'banner': "assets/images/banners/gogo-simo-artwork-2.jpg",
        'categories': ["category 1", 'category 2', 'Category 3', 'Category 4'],
        'rates': 5.0,
        'charts': [47, 180, 420, 350, 213, 32, 460, 150, 50, 250],
        'attendance': 348,
        'price': 25.0,
        'organizer':3,
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
        'status': 0
      },
      4: {
        'title': "Beach Boy",
        'description':'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        'start_date': '2019-12-20',
        'end_date':'2019-09-20',
        'banner': "assets/images/banners/yogaevent.jpg",
        'categories': ["category 1"],
        'rates': 4.0,
        'charts': [250, 390, 110, 240, 500, 120, 450, 350, 250, 45],
        'attendance': 2807,
        'price': 72.0,
        'organizer':0,
        'bookings':[
          {
            'names':'Berty',
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
        'status': 0
      },
    };

    this.venues = {
      'Clubs': {
        'banner':'https://lp-cms-production.imgix.net/features/2019/06/GettyImages-455241318-e39d1535f57e.jpg?q=25',
        'details':{
          0:{
              'name':'B-Club',
              'picture':'https://naibuzz.com/wp-content/uploads/2016/06/b2.jpg',
              'address':'Galana Rd. Nairobi, Galana Plaza',                    
              'rate': 4.3,
          },
          1:{
            'name':'Tribeka',
            'picture':'https://naibuzz.com/wp-content/uploads/2016/06/b2.jpg',
            'address':'Banda St, Nairobi City',                    
            'rate': 3.9,
          }
        }
      },

      'MCs':{
        'banner':'https://expertmc.com/wp-content/uploads/2018/05/room-small.jpg',
        'details':{
          0:{
            'name':'Churchill',
          'picture':'https://cdn.mpasho.co.ke/wp-content/uploads/2017/10/churchill.png',
          'address':'Galana Rd. Nairobi, Galana Plaza',                    
          'rate': 4.3,
          },
          1:{
            'name':'Eric Omondi',
            'picture':'https://nairobinews.nation.co.ke/wp-content/uploads/2019/03/Eric-Omondi-470x264.jpg',
            'address':'Banda St, Nairobi City',                    
            'rate': 3.9,
          }
        }
                      
      },
    
      'Hotel':{
        'banner':'https://q-cf.bstatic.com/images/hotel/max1024x768/185/18503701.jpg',
        'details':{
          0:{
            'name':'Serena',
            'picture':'https://cdn-travel.jumia.com/web_hotel_detail_gallery/nairobi-serena-hotel-292-32e47e826312aade0813cf4f5a6ebda70066ec4f.jpeg',
            'address':'Galana Rd. Nairobi, Galana Plaza',                    
            'rate': 4.3,
          },
          1:{
            'name':'Safari Park',
                'picture':'https://www.safaritravelplus.com/wp-content/uploads/2017/02/b986.jpg',
                'address':'Banda St, Nairobi City',                    
                'rate': 3.9,
          }
        }
      },

      'Lounges':{
        'banner':'https://www.staralliance.com/documents/20184/664377/Tile_lounges_AMS.jpg/be5124d6-ccc0-c932-31c1-00eed9e36ca0?t=1551975334645',
        'details':{
          0:{
            'name':'Saape Lounge',
            'picture':'https://eatout2.scdn5.secure.raxcdn.com/images/restaurant_gallery/2876-728-1427202432.jpg',
            'address':'',         
            'rate': 3.5,
          },
          1:{
            'name':"Fifty Five Lounge Club",
            'picture':'https://media-cdn.tripadvisor.com/media/photo-s/09/7c/e1/0c/fiftyfive-lounge-club.jpg',
            'address':'Nightlife in Grand Baie',
            'rate':4.5,
          } 
        }  
      },
      
      'Artists':{
        'banner':'https://images.hivisasa.com/1200/CcHmRPqFeCmusician.jpeg',
        'details':{
          0:{
            'name':'King Kaka',
            'picture':'https://www.musicinafrica.net/sites/default/files/styles/article_slider_large/public/images/article/201702/kin.jpg?itok=VWoYuW2J',
            'address':'Kitengela',         
            'rate': 3.5,
          },
          1:{
            'name':"Nyashiski",
            'picture':'http://www.ghafla.com/ke/wp-content/uploads/sites/4/2019/04/u90yoyStjFnyashinski.jpg',
            'address':'Nightlife in Grand Baie',
            'rate':4.5,
          } 
        }  
      },
    
      'DeeJays':{
        'banner':'https://www.welove2partyent.com/ressources/images/c3a4939f640d.png',
        'details':{
          0:{
            'name':'DJ Redbone',
            'picture':'https://scontent-mba1-1.xx.fbcdn.net/v/t1.0-0/p526x296/32953087_1554164691377027_7292387141806456832_n.jpg?_nc_cat=103&_nc_oc=AQnMEDtGghsPyU3b_Wk9molU2Y6VMaiml10mI3WsQ32VS7N3qZHS5OxMhw9kEkiiEPk&_nc_ht=scontent-mba1-1.xx&oh=b7d7474d616bbcab9ccb75a3e8da6ee5&oe=5E457766',
            'address':'',         
            'rate': 3.5,
          },
          1:{
            'name':"DJ Mellow",
            'picture':'https://scontent-mba1-1.xx.fbcdn.net/v/t1.0-0/p526x296/22406461_1129185357215625_7378050696114710134_n.jpg?_nc_cat=111&_nc_oc=AQmSz5aR0BkTbQbiiwF36sMcdq7A0CAtc01sTE64oKIKZdxp0Mng6pdg6zBLqQoms9w&_nc_ht=scontent-mba1-1.xx&oh=93b4f89bd5887f590c716f95f13ef1bc&oe=5E5A5ACF',
            'address':'Nightlife in Grand Baie',
            'rate':4.5,
          }  
        }
    }      
  };
 
    this.products = { 
    'Soft-Drink':{
      'soda':{
          'price':100,
          'picture':'http://www.pngmart.com/files/7/Soda-Transparent-Background.png'
      },
      'Juice':{
          'price':120,
          'picture':'http://www.pngall.com/wp-content/uploads/2016/04/Juice-Download-PNG.png'
      },
      'Water':{
          'price':50,
          'picture':'http://pngimg.com/uploads/water_bottle/water_bottle_PNG10157.png'
      }
    },

    'Accessories':{
      'T-shirt':{
          'price':350,
          'picture':'http://pngimg.com/uploads/tshirt/tshirt_PNG5448.png'
      },
      'Cap':{
          'price':500,
          'picture':'http://pngimg.com/uploads/cap/cap_PNG5686.png'
      },
      'Wrist Band':{
          'price':50,
          'picture':'https://reminderbandblog.files.wordpress.com/2017/07/classic-3-stack.png?w=550'
        }
    },
   
    'Snack':{
      'Pop-Corn':{
          'price':100,
          'picture':'https://www.pngarts.com/files/4/Popcorn-PNG-Pic.png'
      },
      'Candy':{
          'price':30,
          'picture':'http://www.pngall.com/wp-content/uploads/2/Candy-Transparent.png'
      },
      'Crisps':{
          'price':80,
          'picture':'https://img.fireden.net/v/image/1465/61/1465618724298.png'
      }
    },
    
    'Alcohol':{
      'Wine':{
          'price':800,
          'picture':'http://pngimg.com/uploads/wine/wine_PNG9456.png'
      },
      'Spirits':{
          'price':500,
          'picture':'https://horizonlives3.s3.amazonaws.com/PR1517/d557a044a23f4eaaa367e7f387d206cc.png'
      },
      'Beer':{
          'price':150,
          'picture':'http://pngimg.com/uploads/beer/beer_PNG2374.png'
      }
    }
  };

    this.organizers =  {
      0: {
        'name': "JAMES NDOTO OLIVIER",
        'id':'0000894934',
        'dob': '1988-08-12',
        'profile': "assets/images/display_pictures/leslie.jpg",
        'email': 'jndoto@globandtelecom.com',
        'phone': '+211926774446',
        'country': 'South Sudan',
        'town': "Juba",
        'address': '20th Street, Tonping Residential Area, Juba',
        'card':{
            'type':'Elite',
            'number':3453345365436785,
            'issued date':'2019-06-10',
            'issued by': "Cooperative Bank/Agent",
            'expiry date':'2024-06-10',
            'loyalty points':20345
          },        
        'password':'1234',
        
      },

      1: {
        'name': "JOEL NASIBU KEMBO",
        'id':'36567984',
        'dob': '1990-04-06',
        'profile': "assets/images/display_pictures/bert.jpg",
        'email': 'joelnasibu@gmail.com',
        'phone': '+254728449982',
        'country': 'South Sudan',
        'town': "Juba",
        'address': '20th Street, Tonping Residential Area, Juba',
        'card':{
            'type':'Elite',
            'number':3453345365436785,
            'issued date':'2019-12-01',
            'issued by': "Cooperative Bank/Agent",
            'expiry date':'2024-12-01',
            'loyalty points':10169
          },        
        'password':'5678',
       
      },

      2: {
        'name': "Naomi Mubarak",
        'id':'0400021934',
        'dob': '1978-01-25',
        'profile': "assets/images/display_pictures/christie.jpg",
        'email': 'naomi.mubarak@gmail.com',
        'phone': '+211926764246',
        'country': 'South Sudan',
        'town': "Juba",
        'address': '20th Street, Tonping Residential Area, Juba',
        'card':{
            'type':'Elite',
            'number':3453345365436785,
            'issued date':'2019-06-10',
            'issued by': "Cooperative Bank/Agent",
            'expiry date':'2024-06-10',
            'loyalty points':9035
          },        
        'password':'0000',        
      },

      3: {
        'name': "Caroline Mutuku",
        'id':'0000894934',
        'dob': '1988-08-12',
        'profile': "assets/images/display_pictures/carol.jpg",
        'email': 'caroline.mutuku@gmail.com',
        'phone': '+211926774446',
        'country': 'South Sudan',
        'town': "Juba",
        'address': '20th Street, Tonping Residential Area, Juba',
        'card':{
            'type':'Elite',
            'number':3453345365436785,
            'issued date':'2019-06-10',
            'issued by': "Cooperative Bank/Agent",
            'expiry date':'2024-06-10',
            'loyalty points':20345
          },
        'password':'9090',
        
      },
      4: {
        'name': "Grace Muthoko",
        'id':'001289434',
        'dob': '1995-01-12',
        'profile': "assets/images/display_pictures/linzi.jpg",
        'email': 'grace.muthoko@gmail.com',
        'phone': '+254729267744',
        'country': 'Kenya',
        'town': "Nairobi",
        'address': '20th Street, Outering Rd, Embakasi',
        'card':{
            'type':'Elite',
            'number':3453345365436785,
            'issued date':'2019-06-10',
            'issued by': "Cooperative Bank/Agent",
            'expiry date':'2024-06-10',
            'loyalty points':20345
          },        
        'password':'1234',
        
      },
     
 };
  
  }


}