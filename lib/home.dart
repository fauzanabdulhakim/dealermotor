import 'package:flutter/material.dart';
import 'package:dealermotor/detailpage.dart';
import 'package:dealermotor/model/imagesliderdata.dart';
import 'package:dealermotor/model/motordata.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dealer Motor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  int _selectedPageIndex = 0;
  final CarouselController _carouselController = CarouselController();
  List<MotorData> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Motor Bike Deal'),
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10),
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MotorSearchDelegate(allMotorData),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    scrollPhysics: BouncingScrollPhysics(),
                    height: 300.0,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imageSliderData.map((slider) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl: slider.imageUrl,
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: imageSliderData.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          _carouselController.animateToPage(entry.key);
                        },
                        child: Container(
                          width: _currentIndex == entry.key ? 17 : 7,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _currentIndex == entry.key
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Pilih Motor Favorit Anda',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10,),
            PagerWidget(
              onPageSelected: (index) {
                setState(() {
                  _selectedPageIndex = index;
                });
              },
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedPageIndex,
                children: [
                  GridWidget(category: 'matic', motorDataList: searchResults),
                  GridWidget(category: 'sport', motorDataList: searchResults),
                  GridWidget(category: 'cub', motorDataList: searchResults),
                  GridWidget(category: 'ev', motorDataList: searchResults),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PagerWidget extends StatefulWidget {
  final ValueChanged<int>? onPageSelected;

  PagerWidget({this.onPageSelected});

  @override
  _PagerWidgetState createState() => _PagerWidgetState();
}

class _PagerWidgetState extends State<PagerWidget> {
  int _currentPage = 0;

  final List<String> pagerItems = ['MATIC', 'SPORT', 'CUB', 'EV'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      //padding: EdgeInsets.symmetric(horizontal: 40),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        itemCount: pagerItems.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 50.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _currentPage = index;
              });
              widget.onPageSelected?.call(index);
            },
            child: Text(
              pagerItems[index],
              style: TextStyle(
                fontSize: 14,
                color: _currentPage == index ? Colors.red : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

class GridWidget extends StatelessWidget {
  final String category;
  final List<MotorData> motorDataList;

  GridWidget({required this.category, required this.motorDataList});

  @override
  Widget build(BuildContext context) {
    List<MotorData> motorDataListFiltered = [];
    if (category == 'matic') {
      motorDataListFiltered = maticData;
    } else if (category == 'sport') {
      motorDataListFiltered = sportData;
    } else if (category == 'cub') {
      motorDataListFiltered = cubData;
    } else if (category == 'ev') {
      motorDataListFiltered = evData;
    } else {
      motorDataListFiltered = motorDataList;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 2; // Default: 2 kolom

        // Atur jumlah kolom berdasarkan lebar layar
        if (constraints.maxWidth >= 1200) {
          crossAxisCount = 6; // Jika melebihi 1200, tampilkan 6 kolom
        } else if (constraints.maxWidth >= 600) {
          crossAxisCount = 4; // Jika melebihi 600, tampilkan 4 kolom
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          itemCount: motorDataListFiltered.length,
          itemBuilder: (BuildContext context, int index) {
            final motor = motorDataListFiltered[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MotorDetailPage(motor: motor),
                  ),
                );
              },
              child: Card(
                elevation: 2.0,
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: 'motor_${motor.name}',
                            child: CachedNetworkImage(
                              imageUrl: motor.imageUrls.isNotEmpty
                                  ? motor.imageUrls[0]
                                  : 'URL_GAMBAR_DEFAULT',
                              fit: BoxFit.contain,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Text(
                            motor.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            motor.price,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class MotorSearchDelegate extends SearchDelegate<String> {
  final List<MotorData> motorDataList;
  List<MotorData> searchResults = [];

  MotorSearchDelegate(this.motorDataList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final motor = searchResults[index];
        return ListTile(
          onTap: () {
            // Navigasi ke halaman detail dan kirim data motor ke halaman tersebut
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MotorDetailPage(motor: motor),
              ),
            );
          },
          leading: Hero(
            tag: 'motor_${motor.name}', // Ini harus tag yang unik untuk setiap motor
            child: CachedNetworkImage(
              imageUrl: motor.imageUrls.isNotEmpty
                  ? motor.imageUrls[0]
                  : 'URL_GAMBAR_DEFAULT',
              fit: BoxFit.contain,
              width: 100, // Lebar gambar
              height: 100, // Tinggi gambar
              //placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          title: Text(
            motor.name,
            style: TextStyle(
              fontSize: 18.0, // Ubah ukuran font 
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            motor.price,
            style: TextStyle(
              fontSize: 16.0, // Ubah ukuran font 
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchResults = query.isEmpty
        ? []
        : motorDataList.where((motor) {
            return motor.name.toLowerCase().contains(query.toLowerCase());
          }).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final motor = searchResults[index];
        return ListTile(
          title: Text(motor.name),
          onTap: () {
            query = motor.name;
          },
        );
      },
    );
  }
}

