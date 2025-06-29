import 'package:flutter/material.dart';
import 'package:dealermotor/detailpage.dart';
import 'package:dealermotor/model/imagesliderdata.dart';
import 'package:dealermotor/model/motordata.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  int _selectedPageIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        elevation: 4,
        title: Row(
          children: const [
            Icon(Icons.motorcycle, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Motor Bike Deal',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
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
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
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
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            imageUrl: slider.imageUrl,
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
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
                          _carouselController.animateTo(
                            entry.key.toDouble(),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
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
            const SizedBox(height: 10),
            const Text(
              'Pilih Motor Favorit Anda',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            PagerWidget(onPageSelected: (index) {
              setState(() {
                _selectedPageIndex = index;
              });
            }),
            Expanded(
              child: IndexedStack(
                index: _selectedPageIndex,
                children: const [
                  GridWidget(category: 'matic'),
                  GridWidget(category: 'sport'),
                  GridWidget(category: 'cub'),
                  GridWidget(category: 'ev'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// File: home.dart (lanjutan SearchDelegate)
// Tambahkan di bawah class GridWidget

class MotorSearchDelegate extends SearchDelegate<String> {
  final List<MotorData> motorDataList;

  MotorSearchDelegate(this.motorDataList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = motorDataList
        .where(
            (motor) => motor.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildSearchList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = motorDataList
        .where(
            (motor) => motor.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildSearchList(suggestions);
  }

  Widget _buildSearchList(List<MotorData> list) {
    if (list.isEmpty) {
      return const Center(child: Text('Motor tidak ditemukan'));
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final motor = list[index];
        return ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MotorDetailPage(motor: motor),
              ),
            );
          },
          leading: Hero(
            tag: 'motor_${motor.name}',
            child: CachedNetworkImage(
              imageUrl: motor.imageUrls.isNotEmpty ? motor.imageUrls[0] : '',
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          title: Text(
            motor.name,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            motor.price,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

class PagerWidget extends StatefulWidget {
  final ValueChanged<int>? onPageSelected;

  const PagerWidget({super.key, this.onPageSelected});

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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        itemCount: pagerItems.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 50.0),
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

class GridWidget extends StatefulWidget {
  final String category;

  const GridWidget({super.key, required this.category});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  int? _zoomedIndex;

  @override
  Widget build(BuildContext context) {
    List<MotorData> motorDataListFiltered;
    switch (widget.category) {
      case 'matic':
        motorDataListFiltered = maticData;
        break;
      case 'sport':
        motorDataListFiltered = sportData;
        break;
      case 'cub':
        motorDataListFiltered = cubData;
        break;
      case 'ev':
        motorDataListFiltered = evData;
        break;
      default:
        motorDataListFiltered = [];
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 2;
        if (constraints.maxWidth >= 1200) {
          crossAxisCount = 6;
        } else if (constraints.maxWidth >= 600) {
          crossAxisCount = 4;
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          itemCount: motorDataListFiltered.length,
          itemBuilder: (context, index) {
            final motor = motorDataListFiltered[index];
            return GestureDetector(
              onTapDown: (_) {
                setState(() {
                  _zoomedIndex = index;
                });
              },
              onTapUp: (_) {
                setState(() {
                  _zoomedIndex = null;
                });
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MotorDetailPage(motor: motor),
                  ),
                );
              },
              onTapCancel: () {
                setState(() {
                  _zoomedIndex = null;
                });
              },
              child: AnimatedScale(
                scale: _zoomedIndex == index ? 1.07 : 1.0,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                child: Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'motor_${motor.name}',
                          child: CachedNetworkImage(
                            imageUrl: motor.imageUrls.isNotEmpty
                                ? motor.imageUrls[0]
                                : '',
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Text(
                          motor.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          motor.price,
                          style: const TextStyle(
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
            );
          },
        );
      },
    );
  }
}
