// Tampilan beranda utama (HomeView) aplikasi dealermotor.
// Menerapkan pola MVVM dengan integrasi HomeViewModel, isolasi carousel promosi,
// tab filter kategori responsif, dan grid katalog motor multi-platform.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/datasources/local_motor_data_source.dart';
import '../../data/repositories/motor_repository_impl.dart';
import '../../detailpage.dart';
import '../../domain/models/motor.dart';
import '../../domain/models/motor_category.dart';
import '../../domain/repositories/motor_repository.dart';
import '../viewmodels/home_view_model.dart';
import '../widgets/motor_grid_widget.dart';
import '../widgets/promo_carousel_widget.dart';

/// Halaman beranda utama dealermotor.
class HomeView extends StatelessWidget {
  /// ViewModel opsional untuk mendukung pengujian atau Dependency Injection langsung.
  final HomeViewModel? viewModel;

  /// Apakah carousel promosi bergeser otomatis (disetel false pada widget test).
  final bool autoPlayCarousel;

  const HomeView({
    super.key,
    this.viewModel,
    this.autoPlayCarousel = true,
  });

  @override
  Widget build(BuildContext context) {
    // Jika ViewModel diteruskan langsung melalui constructor
    if (viewModel != null) {
      return ChangeNotifierProvider<HomeViewModel>.value(
        value: viewModel!,
        child: _HomeViewContent(autoPlayCarousel: autoPlayCarousel),
      );
    }

    // Periksa apakah Provider<HomeViewModel> telah disediakan oleh widget induk
    try {
      final existingVm = Provider.of<HomeViewModel>(context, listen: false);
      return ChangeNotifierProvider<HomeViewModel>.value(
        value: existingVm,
        child: _HomeViewContent(autoPlayCarousel: autoPlayCarousel),
      );
    } catch (_) {
      // Jika belum ada, ambil MotorRepository dari konteks atau fallback ke MotorRepositoryImpl
      MotorRepository repo;
      try {
        repo = Provider.of<MotorRepository>(context, listen: false);
      } catch (_) {
        repo = MotorRepositoryImpl(dataSource: LocalMotorDataSource());
      }

      return ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(repository: repo)..initialize(),
        child: _HomeViewContent(autoPlayCarousel: autoPlayCarousel),
      );
    }
  }
}

/// Konten antarmuka utama beranda.
class _HomeViewContent extends StatefulWidget {
  final bool autoPlayCarousel;

  const _HomeViewContent({this.autoPlayCarousel = true});

  @override
  State<_HomeViewContent> createState() => _HomeViewContentState();
}

class _HomeViewContentState extends State<_HomeViewContent> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Menangani navigasi ke layar detail motor
  void _navigateToDetail(BuildContext context, Motor motor) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailView(motor: motor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 768;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        elevation: 2.0,
        toolbarHeight: isDesktop ? 72.0 : kToolbarHeight,
        title: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              children: [
                const Text(
                  'Motor Bike Deal',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.5,
                  ),
                ),
                if (isDesktop) ...[
                  const Spacer(),
                  SizedBox(
                    width: 380,
                    height: 44,
                    child: _buildSearchTextField(viewModel),
                  ),
                ],
              ],
            ),
          ),
        ),
        bottom: isDesktop
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(64.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0),
                  child: _buildSearchTextField(viewModel),
                ),
              ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: _buildBody(context, viewModel, isDesktop),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, HomeViewModel viewModel, bool isDesktop) {
    // 1. Tampilan saat data sedang dimuat
    if (viewModel.isLoading && viewModel.allMotors.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // 2. Tampilan jika terjadi kesalahan saat pemuatan data
    if (viewModel.errorMessage != null && viewModel.allMotors.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Terjadi kesalahan saat memuat data katalog',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => viewModel.initialize(),
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }

    // 3. Tampilan utama halaman beranda
    return RefreshIndicator(
      onRefresh: () => viewModel.initialize(),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),

          // A. Slider Promo Carousel Terisolasi
          if (viewModel.banners.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: PromoCarouselWidget(
                  banners: viewModel.banners,
                  autoPlay: widget.autoPlayCarousel,
                  height: isDesktop ? 260.0 : 190.0,
                ),
              ),
            ),

          // B. Judul Bagian Kategori & Tab Filter
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                          color: Colors.red.shade700,
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'Pilih Kategori Motor',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildCategoryTabs(context, viewModel),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // C. Responsive Grid Daftar Motor
          SliverToBoxAdapter(
            child: MotorGridWidget(
              motors: viewModel.displayedMotors,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              onMotorTap: (motor) => _navigateToDetail(context, motor),
            ),
          ),

          // D. Ruang bawah agar scrolling nyaman
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }

  /// Kolom pencarian terintegrasi pada AppBar (baik Desktop Navbar maupun Mobile Bottom Bar)
  Widget _buildSearchTextField(HomeViewModel viewModel) {
    return TextField(
      controller: _searchController,
      style: const TextStyle(fontSize: 14.0, color: Colors.black87),
      decoration: InputDecoration(
        hintText: 'Cari model motor impian Anda...',
        hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey.shade500),
        prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
        suffixIcon: _searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, size: 18),
                color: Colors.grey.shade600,
                onPressed: () {
                  _searchController.clear();
                  viewModel.clearSearch();
                  setState(() {});
                },
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: BorderSide(color: Colors.red.shade700, width: 1.5),
        ),
      ),
      onChanged: (value) {
        viewModel.search(value);
        setState(() {});
      },
    );
  }

  /// Membangun tab filter kategori minimalis tanpa pembungkus/card, dengan indikator garis bawah
  Widget _buildCategoryTabs(BuildContext context, HomeViewModel viewModel) {
    const categories = MotorCategory.values;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          final isSelected = viewModel.selectedCategory == cat;
          return Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: InkWell(
              onTap: () => viewModel.selectCategory(cat),
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
                  cat.displayName,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.black : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
