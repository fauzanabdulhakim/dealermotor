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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Spesifikasi Motor ' + widget.motor.name),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                // Lebar layar di atas 600, pindahkan item gambar ke kiri
                return _buildWideLayout();
              } else {
                // Lebar layar kurang dari atau sama dengan 600, tampilkan item gambar di atas
                return _buildNarrowLayout();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWideLayout() {
    return Row(
      children: [
        // Bagian kiri dengan gambar
        Expanded(
          flex: 2,
          child: CarouselSlider(
            options: CarouselOptions(
              height: 600.0,
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
              return Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: Hero(
                      tag: 'motor_${widget.motor.name}',
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        // Bagian kanan dengan judul dan tab
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Spesifikasi Motor Honda ' + widget.motor.name,
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                          height: 600.0, // Sesuaikan dengan tinggi konten
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
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
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
                return Builder(
                  builder: (BuildContext context) {
                    return Center(
                      child: Hero(
                        tag: 'motor_${widget.motor.name}',
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              bottom: 6.0,
              right: 6.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: widget.motor.imageUrls.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == entry.key ? Colors.red : Colors.grey,
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
                      unselectedLabelColor:
                          Colors.grey, // Warna teks untuk tab yang tidak aktif
                      indicatorColor:
                          Colors.red, // Warna garis bawah tab yang aktif
                    ),
                    Container(
                      height: 650.0, // Sesuaikan dengan tinggi konten
                      child: TabBarView(
                        children: tabTitles.map((title) {
                          final specs = widget.motor.specifications;
                          if (specs.containsKey(title)) {
                            final specList = specs[title];
                            return DataTable(
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
                            );
                          } else {
                            // Tampilkan pesan jika title tidak ditemukan dalam specifications
                            return Center(
                              child:
                                  Text('Spesifikasi $title tidak ditemukan.'),
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
    );
  }
}
