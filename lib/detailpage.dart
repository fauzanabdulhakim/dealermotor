// File: detailpage.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dealermotor/model/motordata.dart';

class MotorDetailPage extends StatefulWidget {
  final MotorData motor;

  const MotorDetailPage({super.key, required this.motor});

  @override
  _MotorDetailPageState createState() => _MotorDetailPageState();
}

class _MotorDetailPageState extends State<MotorDetailPage> {
  int _currentIndex = 0;
  final List<String> tabTitles = [
    'Mesin',
    'Rangka & Kaki-kaki',
    'Dimensi & Berat',
    'Kapasitas',
    'Kelistrikan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.motor.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 600
              ? _buildWideLayout()
              : _buildNarrowLayout();
        },
      ),
    );
  }

  Widget _buildCarousel(double height) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: 1,
        aspectRatio: 16 / 9,
        autoPlay: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: widget.motor.imageUrls.map((imageUrl) {
        return Center(
          child: Hero(
            tag: 'motor_${widget.motor.name}',
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSpecTabs() {
    return DefaultTabController(
      length: tabTitles.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            tabs: tabTitles.map((title) => Tab(text: title)).toList(),
          ),
          SizedBox(
            height: 600.0,
            child: TabBarView(
              children: tabTitles.map((title) {
                final specs = widget.motor.specifications[title];
                if (specs == null) {
                  return Center(
                      child: Text('Spesifikasi $title tidak ditemukan.'));
                }
                return SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Fitur')),
                      DataColumn(label: Text('Detail')),
                    ],
                    rows: specs.map((spec) {
                      return DataRow(
                        cells: [
                          DataCell(Text(spec['Fitur'] ?? '-')),
                          DataCell(Text(spec['Detail'] ?? '-')),
                        ],
                      );
                    }).toList(),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildCarousel(600.0),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Spesifikasi Motor Honda ${widget.motor.name}',
                    style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  _buildSpecTabs(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                _buildCarousel(300.0),
                Positioned(
                  bottom: 8.0,
                  right: 8.0,
                  child: Row(
                    children:
                        widget.motor.imageUrls.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? Colors.red
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Spesifikasi Motor Honda ${widget.motor.name}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            _buildSpecTabs(),
          ],
        ),
      ),
    );
  }
}
