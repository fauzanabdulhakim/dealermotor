import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dealermotor/model/motordata.dart';

class MotorDetailPage extends StatefulWidget {
  final MotorData motor;

  MotorDetailPage({required this.motor});

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    //height: 300.0,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: widget.motor.imageUrls.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Center(
                          child: Hero(
                            tag: 'motor_${widget.motor.name}',
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  left: 8.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black54,
                      size: 32,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  bottom: 6.0,
                  right: 6.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:
                        widget.motor.imageUrls.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
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
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Spesifikasi Motor Honda ' + widget.motor.name,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DefaultTabController(
                    length: tabTitles.length,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          isScrollable: true,
                          tabs: tabTitles.map((title) {
                            return Tab(text: title);
                          }).toList(),
                          labelColor:
                              Colors.black, // Warna teks untuk tab yang aktif
                          unselectedLabelColor: Colors
                              .grey, // Warna teks untuk tab yang tidak aktif
                          indicatorColor:
                              Colors.red, // Warna garis bawah tab yang aktif
                        ),
                        Container(
                          height: 450.0, // Sesuaikan dengan tinggi konten
                          child: TabBarView(
                            children: tabTitles.map((title) {
                              final specs = widget.motor.specifications;
                              if (specs.containsKey(title)) {
                                final specList = specs[title];
                                return SingleChildScrollView(
                                  child: DataTable(
                                    columns: [
                                      DataColumn(label: Text('Fitur')),
                                      DataColumn(label: Text('Detail')),
                                    ],
                                    rows: specList!.map((spec) {
                                      return DataRow(
                                        cells: [
                                          DataCell(Text(spec['Fitur']!)),
                                          DataCell(Text(spec['Detail']!)),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                );
                              } else {
                                // Tampilkan pesan jika title tidak ditemukan dalam specifications
                                return Center(
                                  child: Text(
                                      'Spesifikasi $title tidak ditemukan.'),
                                );
                              }
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
