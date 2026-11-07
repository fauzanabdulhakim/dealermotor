// Widget komponen kalkulator simulasi kredit dan konsultasi WhatsApp.
// Menyediakan kontrol slider DP interaktif, pemilihan tenor leasing,
// kartu ringkasan estimasi angsuran bulanan, dan tombol kontak sales langsung ke WhatsApp.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/services/credit_calculator_service.dart';
import '../viewmodels/detail_view_model.dart';

/// Widget kalkulator simulasi pembiayaan kredit sepeda motor interaktif dan responsif multi-platform.
class CreditSimulationWidget extends StatelessWidget {
  const CreditSimulationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();
    final simulation = viewModel.creditSimulation;
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Judul Simulasi Kredit
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Simulasi Kredit & Angsuran',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Hitung estimasi cicilan bulanan motor pilihan Anda',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 12.0),

          // Kontrol Uang Muka (DP) - Menggunakan Wrap agar tidak overflow pada layar sempit/split view
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              Text(
                'Uang Muka (DP)',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    simulation.formattedDownPayment,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      simulation.downPaymentPercentLabel,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Slider Persentase Uang Muka (20% - 70%)
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red.shade700,
              inactiveTrackColor: Colors.red.shade100,
              thumbColor: Colors.red.shade700,
              overlayColor: Colors.red.shade700.withValues(alpha: 0.15),
              valueIndicatorColor: Colors.red.shade700,
              showValueIndicator: ShowValueIndicator.onDrag,
            ),
            child: Slider(
              value: viewModel.downPaymentPercent,
              min: CreditCalculatorService.minimumDownPaymentPercent,
              max: CreditCalculatorService.maximumDownPaymentPercent,
              divisions: 10,
              label: simulation.downPaymentPercentLabel,
              onChanged: (value) {
                viewModel.updateDownPaymentPercent(value);
              },
            ),
          ),

          // Label Batas Minimum & Maksimum Slider DP
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Min. ${(CreditCalculatorService.minimumDownPaymentPercent * 100).toInt()}%',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  'Maks. ${(CreditCalculatorService.maximumDownPaymentPercent * 100).toInt()}%',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16.0),

          // Pemilihan Jangka Waktu Tenor
          Text(
            'Jangka Waktu (Tenor)',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10.0),

          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: viewModel.availableTenors.map((tenor) {
              final isSelected = viewModel.selectedTenor == tenor;
              return ChoiceChip(
                key: ValueKey('tenor_chip_$tenor'),
                showCheckmark: false,
                label: Text(
                  '$tenor Bulan',
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                    color: isSelected ? Colors.red.shade800 : theme.colorScheme.onSurface,
                  ),
                ),
                selected: isSelected,
                selectedColor: Colors.red.shade50,
                backgroundColor: theme.colorScheme.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                side: BorderSide(
                  color: isSelected ? Colors.red.shade700 : theme.dividerColor.withValues(alpha: 0.3),
                  width: isSelected ? 1.5 : 1.0,
                ),
                onSelected: (selected) {
                  if (selected) {
                    viewModel.selectTenor(tenor);
                  }
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 18.0),

          // Ringkasan Estimasi Angsuran Bulanan (Card Aksen Elegan)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.red.shade50.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.red.shade200.withValues(alpha: 0.8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: [
                    Text(
                      'Estimasi Angsuran',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Text(
                        'Bunga 8% / thn',
                        style: TextStyle(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.red.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${simulation.formattedMonthlyInstallment} / bulan',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800,
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Tenor ${simulation.tenorMonths} Bulan • DP ${simulation.formattedDownPayment} (${simulation.downPaymentPercentLabel})',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '*Estimasi simulasi pembiayaan indikatif. Nilai final mengikuti persetujuan lembaga leasing.',
                  style: TextStyle(
                    fontSize: 10.5,
                    fontStyle: FontStyle.italic,
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18.0),

          // Tombol CTA Utama: Konsultasi Sales via WhatsApp (warna merah senada dengan AppBar)
          SizedBox(
            width: double.infinity,
            height: 48.0,
            child: ElevatedButton(
              key: const ValueKey('whatsapp_consultation_button'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                viewModel.contactSalesViaWhatsApp();
              },
              child: const Text(
                'Konsultasi Sales via WhatsApp',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
