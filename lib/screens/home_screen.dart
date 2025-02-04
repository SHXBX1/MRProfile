import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Order App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.deepOrange,
          secondary: Colors.orangeAccent,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Yayoi (เซ็นทรัล)',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYBtAL47fs-4uRfrIUgJcAA-Ywa9jKfd6ekg&s',
      'distance': '5km',
      'time': '31min',
      'price': '฿4',
      'rating': 4.7,
      'discount': 'โค้ดลด 50%'
    },
    {
      'name': 'ฮะจิบัง',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQukFD8I8htD33IeH4YGlOUYf3tYv_floZ6xA&s',
      'distance': '5km',
      'time': '31min',
      'price': '฿4',
      'rating': 4.7,
      'discount': 'โค้ดลด 50%'
    },
    {
      'name': 'Sizzler',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8bSeuHkV8SJc8hdrTbfIvbsXRa_vvPdUAuw&s',
      'distance': '5km',
      'time': '31min',
      'price': '฿4',
      'rating': 4.7,
      'discount': 'โค้ดลด 50%'
    },
    {
      'name': 'McDonald',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeKYA9tULXVWOCATrkXVsxuF4pHIcM0J6goA&s',
      'distance': '5km',
      'time': '31min',
      'price': '฿4',
      'rating': 4.7,
      'discount': 'โค้ดลด 50%'
    },
    {
      'name':
          'ข้าวหมูแดงสีมรกต ซ.สุกร1 (ข้าวหมูแดงสีมรกต ซ.สุกร1 สาขาต้นตำรับ)',
      'image': 'https://mpics.mgronline.com/pics/Images/562000012757401.JPEG',
      'distance': '5km',
      'time': '31min',
      'price': '฿4',
      'rating': 4.7,
      'discount': 'โค้ดลด 50%',
    },
    {
      'name': 'ข้าวหมูทอดอร่อยมาก (บางพลัด)',
      'image':
          'https://images.deliveryhero.io/image/fd-th/Products/10560115.jpg?width=%s',
      'distance': '7km',
      'time': '33min',
      'price': '฿17',
      'rating': 4.7,
      'discount': 'โค้ดลด 60%',
    },
    {
      'name': 'KFC (บางพลัด)',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdkERsanC5bN-wCtQGG82RprDPeQFQplDXjg&s',
      'distance': '8km',
      'time': '12min',
      'price': '฿27',
      'rating': 4.9,
      'discount': 'โค้ดลด 30%',
    },
    // ... (keep other restaurant entries the same)
  ];

  List<Map<String, dynamic>> filteredRestaurants = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRestaurants = restaurants;
  }

  void _filterRestaurants(String query) {
    setState(() {
      filteredRestaurants = restaurants
          .where((restaurant) =>
              restaurant['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Order',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              // Notification functionality
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: searchController,
              onChanged: _filterRestaurants,
              decoration: InputDecoration(
                hintText: 'Search restaurants...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.deepOrange),
                  onPressed: () {
                    // Add filter functionality
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = filteredRestaurants[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RestaurantDetailScreen(restaurant: restaurant),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Hero(
                              tag: 'restaurant_image_${restaurant['name']}',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  restaurant['image'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant['name'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${restaurant['distance']} • ${restaurant['time']} • ${restaurant['price']}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 16),
                                      SizedBox(width: 4),
                                      Text(
                                        restaurant['rating'].toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                restaurant['discount'],
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantDetailScreen extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantDetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                restaurant['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Hero(
                tag: 'restaurant_image_${restaurant['name']}',
                child: Image.network(
                  restaurant['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(
                          restaurant['distance'],
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        backgroundColor: Colors.deepOrange.withOpacity(0.1),
                      ),
                      Chip(
                        label: Text(
                          restaurant['time'],
                          style: TextStyle(color: Colors.green),
                        ),
                        backgroundColor: Colors.green.withOpacity(0.1),
                      ),
                      Chip(
                        label: Text(
                          restaurant['price'],
                          style: TextStyle(color: Colors.purple),
                        ),
                        backgroundColor: Colors.purple.withOpacity(0.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          SizedBox(width: 8),
                          Text(
                            restaurant['rating'].toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          restaurant['discount'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MenuScreen(restaurant: restaurant),
                        ),
                      );
                    },
                    icon: Icon(Icons.restaurant_menu),
                    label: Text('View Menu'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  const MenuScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search menu items...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMenuItem(
                  context,
                  'Ramen Special',
                  'Delicious ramen with special sauce',
                  '฿150',
                ),
                _buildMenuItem(
                  context,
                  'Sushi Combo',
                  'Fresh selection of sushi rolls',
                  '฿250',
                ),
                _buildMenuItem(
                  context,
                  'Curry Rice',
                  'Authentic Japanese curry rice',
                  '฿180',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, String description, String price) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              price,
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.deepOrange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
