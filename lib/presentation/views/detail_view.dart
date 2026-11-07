// Halaman detail katalog sepeda motor berbasis MVVM.
// Menampilkan galeri varian motor responsif, eliminasi crash Hero tag,
// tata letak adaptif (Mobile & Tablet/Desktop), dan tabel spesifikasi teknis dinamis.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/currency_formatter.dart';
import '../../domain/models/motor.dart';
import '../../domain/models/motor_category.dart';
import '../../model/motordata.dart';
import '../viewmodels/detail_view_model.dart';
import '../widgets/credit_simulation_widget.dart';

/// Halaman tampilan detail sepeda motor berbasis arsitektur MVVM dan responsif multi-platform.
class DetailView extends StatelessWidget {
  /// Entitas data sepeda motor yang ditampilkan.
  final Motor motor;

  /// ViewModel opsional (dapat diinjeksikan langsung, misal saat widget test).
  final DetailViewModel? viewModel;

  const DetailView({
    super.key,
    required this.motor,
    this.viewModel,
  });

  /// Factory constructor untuk memfasilitasi integrasi data dari model legacy [MotorData].
  factory DetailView.fromLegacy(MotorData legacyData, {Key? key}) {
    return DetailView(
      key: key,
      motor: convertLegacyMotorData(legacyData),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel != null) {
      return ChangeNotifierProvider<DetailViewModel>.value(
        value: viewModel!,
        child: const _DetailViewScaffold(),
      );
    }

    return ChangeNotifierProvider<DetailViewModel>(
      create: (_) => DetailViewModel(motor: motor),
      child: const _DetailViewScaffold(),
    );
  }
}

/// Struktur Scaffold utama halaman detail.
class _DetailViewScaffold extends StatelessWidget {
  const _DetailViewScaffold();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    final motor = viewModel.motor;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
        title: Text(
          motor.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.red.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 1.0,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Tata letak adaptif: Layar lebar (>= 600 dp) menggunakan split-view dua kolom,
                // sedangkan layar sempit (< 600 dp) menggunakan tata letak vertikal satu kolom.
                if (constraints.maxWidth >= 600) {
                  return _WideDetailLayout(constraints: constraints);
                }
                return const _NarrowDetailLayout();
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// Tata letak responsif untuk layar lebar / tablet / desktop (lebar >= 600 dp).
class _WideDetailLayout extends StatelessWidget {
  final BoxConstraints constraints;

  const _WideDetailLayout({required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kolom Kiri: Galeri gambar varian motor & pemilih warna
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: const _GallerySection(isWide: true),
          ),
        ),

        // Garis pembatas vertikal yang halus
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
        ),

        // Kolom Kanan: Informasi Produk, Harga OTR, Tabel Spesifikasi Teknis Dinamis, dan Simulasi Kredit
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _ProductHeaderSection(),
                SizedBox(height: 24.0),
                Divider(),
                SizedBox(height: 16.0),
                _SpecificationSection(),
                SizedBox(height: 24.0),
                CreditSimulationWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Tata letak responsif untuk layar smartphone / sempit (lebar < 600 dp).
class _NarrowDetailLayout extends StatelessWidget {
  const _NarrowDetailLayout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // Galeri gambar varian & pemilih warna
          _GallerySection(isWide: false),
          SizedBox(height: 20.0),

          // Informasi produk & harga OTR
          _ProductHeaderSection(),
          SizedBox(height: 20.0),
          Divider(),
          SizedBox(height: 16.0),

          // Bagian spesifikasi teknis dinamis
          _SpecificationSection(),
          SizedBox(height: 24.0),

          // Komponen Simulasi Kredit Interaktif & Konsultasi WhatsApp
          CreditSimulationWidget(),
        ],
      ),
    );
  }
}

/// Bagian galeri gambar motor dengan seleksi varian dan proteksi crash runtime Hero tag.
class _GallerySection extends StatelessWidget {
  final bool isWide;

  const _GallerySection({required this.isWide});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    final motor = viewModel.motor;
    final imageHeight = isWide ? 340.0 : 250.0;

    if (motor.images.isEmpty) {
      return SizedBox(
        height: imageHeight,
        child: const Center(
          child: Icon(Icons.motorcycle, size: 96, color: Colors.grey),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Carousel gambar produk varian motor tanpa card/pembungkus yang dapat di-slide langsung
        CarouselSlider.builder(
          itemCount: motor.images.length,
          options: CarouselOptions(
            height: imageHeight,
            viewportFraction: 1.0,
            enableInfiniteScroll: motor.images.length > 1,
            enlargeCenterPage: false,
            initialPage: viewModel.selectedVariantIndex,
            onPageChanged: (index, reason) {
              viewModel.selectVariant(index);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final imageUrl = motor.images[index];
            final isFirstVariant = index == 0;
            final heroTag = 'hero_motor_${motor.id}_0';

            Widget imageWidget = CachedNetworkImage(
              imageUrl: imageUrl,
              memCacheWidth: 800,
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.broken_image_outlined,
                  size: 72,
                  color: Colors.grey,
                ),
              ),
            );

            if (isFirstVariant) {
              return Hero(tag: heroTag, child: imageWidget);
            }
            return imageWidget;
          },
        ),

        // Indikator titik (dots) minimalis untuk menandai varian aktif saat di-slide
        if (motor.images.length > 1) ...[
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(motor.images.length, (index) {
              final isSelected = viewModel.selectedVariantIndex == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                height: 6.0,
                width: isSelected ? 20.0 : 6.0,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.red.shade700 : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(3.0),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }
}

/// Bagian header informasi produk: Nama, Kategori, Harga OTR, dan Deskripsi.
class _ProductHeaderSection extends StatelessWidget {
  const _ProductHeaderSection();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    final motor = viewModel.motor;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nama Model Sepeda Motor
        Text(
          motor.name,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 8.0),

        // Estimasi Harga OTR (menggunakan Wrap agar adaptif pada semua ukuran layar)
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8.0,
          runSpacing: 4.0,
          children: [
            Text(
              motor.formattedPrice,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.red.shade700,
              ),
            ),
            Text(
              'OTR Jakarta & Sekitarnya',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),

        if (motor.description.isNotEmpty) ...[
          const SizedBox(height: 12.0),
          Text(
            motor.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.45,
            ),
          ),
        ],
      ],
    );
  }
}

/// Bagian spesifikasi teknis dinamis tanpa batasan tinggi statis SizedBox(height: 600.0).
class _SpecificationSection extends StatelessWidget {
  const _SpecificationSection();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    final theme = Theme.of(context);
    final categories = viewModel.availableSpecCategories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spesifikasi Teknis',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12.0),

        // Pemilih Kategori Spesifikasi minimalis tanpa pembungkus, dengan indikator garis bawah
        if (categories.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((cat) {
                final isSelected = viewModel.selectedSpecCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InkWell(
                    key: ValueKey('spec_cat_$cat'),
                    onTap: () => viewModel.selectSpecCategory(cat),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected ? Colors.black : Colors.transparent,
                            width: 2.5,
                          ),
                        ),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey.shade600,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

        const SizedBox(height: 16.0),

        // Tabel Spesifikasi Belang-Belang (Striped Table)
        _buildStripedSpecTable(context, viewModel),
      ],
    );
  }

  /// Membangun tabel spesifikasi teknis dinamis berpenampilan striped (belang-belang) rapi.
  Widget _buildStripedSpecTable(BuildContext context, DetailViewModel viewModel) {
    final theme = Theme.of(context);
    final specs = viewModel.currentSpecifications;

    if (specs.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            'Informasi spesifikasi teknis ${viewModel.selectedSpecCategory} belum tersedia.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final specEntries = specs.entries.toList();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.15),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.generate(specEntries.length, (index) {
          final entry = specEntries[index];
          final isEven = index % 2 == 0;
          final rowBgColor = isEven
              ? theme.colorScheme.surface
              : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.25);

          return Container(
            color: rowBgColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kolom Fitur / Parameter Spesifikasi
                Expanded(
                  flex: 4,
                  child: Text(
                    entry.key,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                // Kolom Nilai Detail Spesifikasi
                Expanded(
                  flex: 6,
                  child: Text(
                    entry.value,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

/// Helper fungsi untuk mengonversi data mentah model legacy [MotorData]
/// menjadi entitas domain murni [Motor].
Motor convertLegacyMotorData(MotorData raw) {
  final Map<String, Map<String, String>> specs = {};

  for (final entry in raw.specifications.entries) {
    final Map<String, String> featureMap = {};
    for (final item in entry.value) {
      final f = item['Fitur']?.trim() ?? '';
      final d = item['Detail']?.trim() ?? '';
      if (f.isNotEmpty) {
        featureMap[f] = d;
      }
    }
    if (featureMap.isNotEmpty) {
      specs[entry.key] = featureMap;
    }
  }

  // Tentukan kategori dari nama atau spesifikasi
  final lowerName = raw.name.toLowerCase();
  final MotorCategory category;
  if (lowerName.contains('em1') || lowerName.contains('ev')) {
    category = MotorCategory.ev;
  } else if (lowerName.contains('cbr') ||
      lowerName.contains('crf') ||
      lowerName.contains('cb150') ||
      lowerName.contains('monkey') ||
      lowerName.contains('st125')) {
    category = MotorCategory.sport;
  } else if (lowerName.contains('supra') ||
      lowerName.contains('revo') ||
      lowerName.contains('super cub') ||
      lowerName.contains('ct125')) {
    category = MotorCategory.cub;
  } else {
    category = MotorCategory.matic;
  }

  final priceInt = CurrencyFormatter.parse(raw.price);
  final id = raw.name
      .toLowerCase()
      .trim()
      .replaceAll(RegExp(r'[^a-z0-9]+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');

  return Motor(
    id: id,
    name: raw.name,
    category: category,
    price: priceInt,
    images: raw.imageUrls,
    colors: raw.imageUrls,
    specifications: specs,
  );
}
