class MotorData {
  final List<String> imageUrls;
  final String name;
  final String price;
  final Map<String, List<Map<String, String>>>
      specifications;

  MotorData({
    required this.imageUrls,
    required this.name,
    required this.price,
    required this.specifications,
  });
}

final List<MotorData> allMotorData = [
  ...maticData,
  ...sportData,
  ...cubData,
  ...evData,
];


final List<MotorData> maticData = [
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/ahm-gaul-sideview-deluxe-black-7-01022023-085330.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-black-1-3-01022023-085835.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-dark-silver-1-2-01022023-085913.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-blue-7-01022023-085925.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/dacc342a-c57d-42e6-8d9e-72d2212bf139-02022023-061549-03022023-021229.jpeg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/6690cd99-7174-414d-9c90-40bf1bb4e1a5-02022023-061626-03022023-021238.jpeg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/d12e7df9-fa4f-4f14-bef4-777838ae671a-02022023-061603-03022023-021243.jpeg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/19b33872-5bba-4b98-8de7-ba67af67eda0-02022023-061613-03022023-021248.jpeg',
    ],
    name: 'BeAT',
    price: 'Rp 18.050.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/93e47a5a-2a5c-446f-9d78-299b084e1392-02022023-034049.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/varian-bs-515x504-silver-6-03022023-014423.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/varian-bs-515x504-black-2-2-01022023-093526.jpg',
    ],
    name: 'BeAT Street',
    price: 'Rp 18.700.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1877 x 742 x 1030 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT Street MF 12V-3Ah'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-acc-6-25072023-093811.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/abs-fabulous-green-515x504-tr-4-25072023-093704.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/abs-fabulous-blue-515x504-tr-5-25072023-093533.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/abs-fabulous-black-515x504-tr-6-25072023-093543.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/cbs-radiant-red-black-515x504-tr-3-25072023-093604.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/cbs-radiant-silver-black-515x504-tr-3-26072023-072534.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/cbs-radiant-black-515x504-tr-3-25072023-093617.png',
    ],
    name: 'Genio',
    price: 'Rp 19.110.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'PGM-FI (Programmed Fuel Injection)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Outomatic, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 Nm (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Automatic Centrifugal Clutch Dry Type'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Underbone-eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Telescopic'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Swing Arm dengan Suspensi Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '100/90 12 59j (Tubeless)'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '110/90 12 64j (Tubeless)'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.862 x 694 x 1.061 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '744 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.251 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '150 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '92 Kg (Tipe CBS) 93 Kg (Tipe CBS-ISS)'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-product-1-02112022-042907.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/variant-color-6-02112022-042653.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/prestige-white-5-31102022-074737.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/stylish-red-8-31102022-074744.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/stylish-brown-9-31102022-074741.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/fashion-blue-10-01112022-050521.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/fashion-brown-4-01112022-050524.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/sporty-silver-4-01112022-050529.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/sporty-red-13-01112022-050535.jpg',
    ],
    name: 'Scoopy',
    price: 'Rp 21.875.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC dengan Pendingin Udara, eSP'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'PGM-FI (Programmed Fuel Injection)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 Nm (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Underbone - eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '100/90 12 59J (Tubeless)'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '110/90 12 64J (Tubeless)'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.864 x 683 x 1.074 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '746 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.251 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '145 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '95 Kg dan 94 Kg (tipe SmartKey)'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'MF 12V-5Ah'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/fa-thumbnail-400x300pxl-ys-6-26092022-105457.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/fa-variant-sporty-advance-matte-blue-515x504pxl-ys-1-1-26092022-061518.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/fa-variant-sporty-advance-matte-white-515x504pxl-ys-1-1-26092022-061523.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/fa-variant-sporty-advance-matte-black-515x504pxl-ys-1-2-26092022-061603.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/fa-variant-sporty-red-515x504pxl-ys-1-1-26092022-061527.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/fa-variant-sporty-black-515x504pxl-ys-1-2-26092022-061532.png',
    ],
    name: 'Vario 125',
    price: 'Rp 22.550.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP, Pendingin Cairan'},
        {'Fitur': 'Volume Langkah', 'Detail': '124,8CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Programmed Fuel Injection (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '52.4 x 57.9 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '11.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '8,2 kW (11,1 PS)/8.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '10,8 Nm (1,1 kgf.m)/5.000 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
        {'Fitur': 'Tipe Minyak Pelumas', 'Detail': '0,8 liter (Penggantian Periodik)'},
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Underbone)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Swing Arm dengan suspensi Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '	90/80 – 14M/C 43 P Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '	100/80 - 14M/C 48P Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': '	Wavy Disc Brake'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System (CBS)'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.918 x 679 x 1.066 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '769 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.280 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '131 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '111 kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '5,5 liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0,8 liter pada Penggantian Periodik'
        },
        {'Fitur': 'Kapasitas U-Box', 'Detail': '18 liter'},
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'MF 12V-5 Ah'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK CPR9EA-9 / Denso U27EPR9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/product-thmbnail-17-04022022-110721.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/var160-white-matte-abs-515x504-tr-4-02082023-090911.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/var160-black-matte-abs-515x504-tr-3-02082023-090925.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/var160-white-matte-cbs-sp-515x504-tr-3-02082023-090932.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/var160-black-matte-cbs-sp-515x504-tr-6-02082023-094319.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/var160-black-matte-cbs-515x504-tr-6-02082023-091008.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/var160-red-matte-cbs-515x504-tr-3-02082023-091019.png',
    ],
    name: 'Vario 160',
    price: 'Rp 26.639.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, 4-Valve, eSP+'},
        {'Fitur': 'Sistem Pendingin', 'Detail': 'Pendingin Cairan'},
        {'Fitur': 'Volume Langkah', 'Detail': '156,9 cc'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': '	PGM-FI (Programmed Fuel Injection)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '60 x 55,5 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '12 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '11,3 kW (15,4 PS) / 8.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '13,8 Nm (1,4 kgf,m) / 7.000 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
        {'Fitur': 'Tipe Minyak Pelumas', 'Detail': 'Basah'},
        {'Fitur': 'Kapasitas Minyak Pelumas', 'Detail': '0,8 liter (Penggantian Periodik)'},
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Underbone - eSAF (enhanced Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': '	Swing Arm dengan Suspensi Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '100/80 - 14M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '120/70 - 14M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik, Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol (CBS), Cakram Hidrolik (ABS)'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System (CBS) & Anti-Lock Braking System (ABS)'},
      ],
      'Dimensi': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '	1.929 x 679 x 1.088 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '778 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '	1.277 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '140 mm'},
        {'Fitur': 'Berat Kosong (Curb Weight)', 'Detail': '115 kg (CBS) & 117 kg (ABS)'},
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'MF 12V-5 Ah'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK LMAR8L-9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-product-10-13122022-124317.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/magnificent-red-2-13122022-124503.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/royal-matte-blue-2-13122022-124506.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/wonderful-white-9-13122022-124510.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/brillliant-black-2-13122022-124512.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/imperial-matte-blue-2-13122022-124521.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/wonderfull-white-2-13122022-124524.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/majestic-matte-red-12-13122022-124529.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/glorious-matte-black-4-13122022-124532.jpg',
    ],
    name: 'PCX 160',
    price: 'Rp 32.670.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4-Langkah, 4-Valve, eSP+'},
        {'Fitur': 'Tipe Pendingin', 'Detail': 'Pendingin Cairan'},
        {'Fitur': 'Volume Langkah', 'Detail': '156,9 cc'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'PGM-FI (Programmed Fuel Injection)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '60 x 55,5 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '12:1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '11,8 kW (16 PS) / 8.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '14,7 Nm (1,5 kgf.m) / 6.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
        {'Fitur': 'Kapasitas Minyak Pelumas', 'Detail': '0,8 liter (Penggantian Periodik)'},
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Double Cradle'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Suspensi Belakang Ganda'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '110/70 - 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '130/70 - 13 M/C Tubeless'},
        {'Fitur': 'Rem Depan', 'Detail': '	Cakram hidrolik - (TipeCBS) TriplePots Hydraulic, Combined Brake System / (Tipe ABS) Anti Lock Braking System'},
        {'Fitur': 'Rem Belakang', 'Detail': 'Cakram Hidrolik'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.936 x 742 x 1.108 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '764 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.313 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '135 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '131 kg (tipeCBS), 132 kg (tipeABS)'},
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '8,1 liter'},
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': '12 V - 5 Ah, tipe MF'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGKLMAR8L-9'},
        {'Fitur': 'Power Charger', 'Detail': '5V,2,1A'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/honda-adv160-abs-red-sideview-27062027-01072022-042948.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/abs-red-2-01072022-043359.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/abs-black-2-01072022-043412.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/abs-white-2-01072022-043433.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/cbs-red-3-01072022-043505.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/cbs-black-2-01072022-043514.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/cbs-white-2-01072022-043522.png',
    ],
    name: 'ADV 160',
    price: 'Rp 36.200.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4-Langkah, 4-Katup, eSP+'},
        {'Fitur': 'Tipe Pendinginan', 'Detail': 'Pendingin Cairan'},
        {'Fitur': 'Volume Langkah', 'Detail': '156,9 cc'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'PGM-FI (Programmed Fuel Injection)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '60 x 55,5 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '12 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '11,8 kW (16 PS) / 8.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '14,7 Nm (1,5 kgf.m) / 6.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik'},
        {'Fitur': 'Tipe Kopling', 'Detail': 'Otomatis, Sentrifugal, Tipe Kering'},
        {'Fitur': 'Tipe Minyak Pelumas', 'Detail': 'Basah'},
        {'Fitur': 'Kapasitas Minyak Pelumas', 'Detail': '0,75 liter (Penggantian Periodik)'},
      ],
      'Rangka': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Double Cradle'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Suspensi Belakang Ganda dengan Tabung'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '110/80 - 14M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '130/70 - 13M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Wavy Disc Brake'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Wavy Disc Brake'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Triple Pots Hydraulic Combi Brake System (CBS) / Anti-Lock Braking System (ABS)'},
      ],
      'Dimensi': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.950 x 763 x1.196 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '780 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.324 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '165 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '133 kg (CBS & ABS)'},
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '8,1 liter'},
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'MF 12V-5Ah'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK LMAR8L-9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/forza-400x300-22062023-110136-23062023-090027.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/candy-515x504-22062023-110152-23062023-090418.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/black-515x504-22062023-110203-23062023-090427.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/blue-515x504-22062023-110213-23062023-090454.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/gray-515x504-22062023-110221-23062023-090520.png',
    ],
    name: 'Forza',
    price: 'Rp 90.330.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': 'eSP+, 4-katup, 4-langkah, SOHC'},
        {'Fitur': 'Volume Langkah', 'Detail': '249 cc'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Fuel Injection (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '67 x 70,7 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10,2 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '17 kW / 7.750 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '24 Nm / 6250 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Automatic Centrifugal Clutch Dry Type'
        },
        {'Fitur': 'Sistem Pendingin Mesin', 'Detail': 'Pendinginan Cairan'},
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Under bone type'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Swing arm dengan suspensi ganda'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '120/70-15M/C 56P'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '140/70-14M/C 62P'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Hidrolis, single 256mm disc - ABS'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Rem Belakang', 'Detail': 'Hidrolis, single 240mm disc - ABS'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '2.145x 750 x 1.360 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '780 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.510 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '145 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '186 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '11,7 L'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '1,3 L (penggantian periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': '12 V - 8,6 Ah (10h), MF-Wet Type'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK LMAR8A-9'},
      ]
    },
  ),
];

final List<MotorData> sportData = [
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thmbnl-4-15062021-064230.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/bold-red-1-15062021-064334.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/macho-matte-balck-1-15062021-064343.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/masculine-black-1-15062021-064353.png',
    ],
    name: 'CB150 Verza',
    price: 'Rp 20.945.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 langkah, SOHC, Satu Silinder'},
        {'Fitur': 'Tipe Tranmisi', 'Detail': '5 Tingkat Kecepatan'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'PGM-FI (Programmed Fuel Injection)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '57,3 x 57,8 mm'},
        {'Fitur': 'Sistem Pendingin Mesin', 'Detail': 'Pendingin Udara'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '9,5:1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '9,59kW (13,04 PS) / 8.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '12,73 Nm (1,30 kgf.m) / 6.000 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Pedal dan Elektrik'},
        {'Fitur': 'Pola Perpindahan Gigi', 'Detail': '1-N-2-3-4-5'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Manual, Multiplate, Wet Clutch'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Diamond Steel'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Adjustable Dual Rear Suspension'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/100 - 17 M/C 46P (CW: Tubeless dan SW: with Tube)'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '100/90 - 17 M/C 55P (CW: Tubeless dan SW: with Tube)'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik, Piston Ganda'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '	2.056 x 742 x 1.054 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '773 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.318 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '156 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '129 kg (Cast Wheel) dan 128 kg (Spoke Wheel)'},
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'MF Wet 12V 3.5Ah'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK CPR9EA-9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/sonic-150r-2-27052021-092049.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/new-energetic-red-1-16042021-014724.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/new-activo-black-1-16042021-014727.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/new-aggresso-matte-black-1-16042021-014730.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/honda-racing-red-1-16042021-014733.jpg',
    ],
    name: 'Sonic 150R',
    price: 'Rp 25.520.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '	4 Langkah, DOHC - 4 Katup'},
        {'Fitur': 'Volume Langkah', 'Detail': '149.16 cc'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'PGM-FI'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '57.3 x 57.8 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Manual, 6 - Kecepatan'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '11.3:1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '11.8 kW (16.0 PS) / 9,000 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '13.5 Nm (1.38 kgf.m) / 6,500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Pedal & Elektrik'},
        {'Fitur': 'Pola Perpindahan Gigi', 'Detail': '1 - N - 2 - 3 - 4 - 5 - 6'},
        {'Fitur': 'Sistem Pendingin Mesin', 'Detail': 'Liquid Cooled with Auto Fan'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Multiple Wet Clutch Coil Spring'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Twin Tube Steel'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun Dengan Suspensi Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '70/90-17 38P (Tubeless)'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '80/90-17 50P (Tubeless)'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Cakram Hidrolik'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.941 x 669 x 977 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '762 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.275 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '140 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '114 kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '1,1 Liter'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'MF Wet 12V 5Ah'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N atau ND U27EPR-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/cb1504-27052021-092449.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/variant-5-7-07052021-090322.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/variant-1-7-07052021-090326.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/variant-3-7-07052021-090331.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/variant-4-8-07052021-090335.jpg',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product/colors/variant-2-9-07052021-090338.jpg',
    ],
    name: 'CB150R Streetfire',
    price: 'Rp 30.661.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 Langkah, DOHC 4 Katup'},
        {'Fitur': 'Volume Langkah', 'Detail': '149,16 cc'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'PGM-FI (Programmed Fuel Injection)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '57,3 x 57,843 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Manual, 6 Kecepatan'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '11,3 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '12,4 kW (16,9 PS) / 9.000 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '13,8 Nm (1,41 kgf.m) / 7.000 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik'},
        {'Fitur': 'Sistem Pendingin', 'Detail': 'Liquid Cooled'},
        {'Fitur': 'Tipe Minyak Pelumas', 'Detail': 'Wet'},
        {'Fitur': 'Pola Perpindahan Gigi', 'Detail': '1 - N - 2 - 3 - 4 - 5 - 6'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Multiple Wet Clutch with Coil Sprin'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Diamond (Truss) Frame'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Showa 37mm Inverted Telescopic'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan suspensi tunggal (Sistem Pro-Link)'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '100/80-17M/C 52P, Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '130/70-17M/C 62P, Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Wavy Disc Brake'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Wavy Disc Brake'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '2.024 x 796 x 1.083 mm'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '795 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.298 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '164 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '134 (Standard) & 135 kg (Special Edition)'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '12 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '1,1 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {'Fitur': 'Tipe Baterai Atau Aki', 'Detail': 'MF-Wet 12V-5Ah'},
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N atau DENSO U27EPR-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/fa-ahm-sport-mid-thumbnail-400x300pxl-ys-3-20122022-114842.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'CB150X',
    price: 'Rp 33.910.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-motor-new-crf150l-1-25102021-084848.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'CRF150L',
    price: 'Rp 35.930.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-50845-24112022-071000.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'CBR150R',
    price: 'Rp 37.283.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-400x300-ys-3-19092022-074605.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'CBR250RR',
    price: 'Rp 63.456.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-motor-400x300-copy-2-16022023-110718.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'CRF250L',
    price: 'Rp 79.900.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/honda-st125-dax-9-08082022-113917.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'ST125 Dax',
    price: 'Rp 82.030.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/product-thumbnail-13-25102022-081932.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'Monkey',
    price: 'Rp 82.970.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-crf250rally-upload-4-06082021-090511.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'CRF250 RALLY',
    price: 'Rp 92.930.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
];
final List<MotorData> cubData = [
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thmbnail-product-2-24012022-110536.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'Revo',
    price: 'Rp 16.020.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-new-supra-x-5-04032022-102907.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'Supra X 125 FI',
    price: 'Rp 19.100.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/supra-gtr-150-4-27052021-092133.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'GTR 150',
    price: 'Rp 25.180.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/thumbnail-product-upload-3-1-02082021-074747.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'Supercub C125',
    price: 'Rp 77.160.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/ct125-400x300-3-14062023-040229.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'CT125',
    price: 'Rp 81.400.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  // Tambahkan data motor cub lainnya
];
final List<MotorData> evData = [
  MotorData(
    imageUrls: [
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/tr:w-550,f-auto/uploads/product/thumbnail/em1-putih-samping-400x300-tr-2-11082023-064650.png',
      'https://ik.imagekit.io/zlt25mb52fx/ahmcdn/uploads/product-draft/colors/deluxe-green-3-01022023-085857.jpg',
    ],
    name: 'EM1 e:',
    price: 'Rp 45.000.000',
    specifications: {
      'Mesin': [
        {'Fitur': 'Tipe Mesin', 'Detail': '4 - Langkah, SOHC, eSP'},
        {'Fitur': 'Volume Langkah', 'Detail': '109,5CC'},
        {'Fitur': 'Sistem Suplai Bahan Bakar', 'Detail': 'Injeksi (PGM-FI)'},
        {'Fitur': 'Diameter X Langkah', 'Detail': '47.0 x 63.1 mm'},
        {'Fitur': 'Tipe Transmisi', 'Detail': 'Otomatis, V-Matic'},
        {'Fitur': 'Rasio Kompresi', 'Detail': '10.0 : 1'},
        {'Fitur': 'Daya Maksimum', 'Detail': '6.6 kW (9.0 PS)/7.500 rpm'},
        {'Fitur': 'Torsi Maksimum', 'Detail': '9.3 N,m (0.95 kgf.m)/5.500 rpm'},
        {'Fitur': 'Tipe Starter', 'Detail': 'Elektrik dan Kick Starter'},
        {
          'Fitur': 'Tipe Kopling',
          'Detail': 'Otomatis, Sentrifugal, Tipe Kering'
        },
      ],
      'Rangka & Kaki-kaki': [
        {
          'Fitur': 'Tipe Rangka',
          'Detail': 'Tulang Punggung eSAF (enhance Smart Architecture Frame)'
        },
        {'Fitur': 'Tipe Suspensi Depan', 'Detail': 'Teleskopik'},
        {
          'Fitur': 'Tipe Suspensi Belakang',
          'Detail': 'Lengan Ayun dengan Peredam Kejut Tunggal'
        },
        {'Fitur': 'Ukuran Ban Depan', 'Detail': '80/90 14 M/C Tubeless'},
        {'Fitur': 'Ukuran Ban Belakang', 'Detail': '90/90 14 M/C Tubeless'},
        {
          'Fitur': 'Rem Depan',
          'Detail': 'Cakram Hidrolik dengan Piston Tunggal'
        },
        {'Fitur': 'Rem Belakang', 'Detail': 'Tromol'},
        {'Fitur': 'Sistem Pengereman', 'Detail': 'Combi Brake System'},
      ],
      'Dimensi & Berat': [
        {
          'Fitur': 'Panjang X Lebar X Tinggi',
          'Detail': '1.877 x 669 x 1.074 mm (BeAT)'
        },
        {'Fitur': 'Tinggi Tempat Duduk', 'Detail': '740 mm'},
        {'Fitur': 'Jarak Sumbu Roda', 'Detail': '1.256 mm'},
        {'Fitur': 'Jarak Terendah Ke Tanah', 'Detail': '147 mm'},
        {'Fitur': 'Curb Weight', 'Detail': '89 Kg'},
      ],
      'Kapasitas': [
        {'Fitur': 'Kapasitas Tangki Bahan Bakar', 'Detail': '4.2 Liter'},
        {
          'Fitur': 'Kapasitas Minyak Pelumas',
          'Detail': '0.65 Liter (Penggantian Periodik)'
        },
      ],
      'Kelistrikan': [
        {
          'Fitur': 'Tipe Baterai Atau Aki',
          'Detail': 'BeAT MF 12V-3Ah (Tipe CBS) MF 12V-5Ah (Tipe CBS-ISS)'
        },
        {'Fitur': 'Sistem Pengapian', 'Detail': 'Full Transisterized, Baterai'},
        {'Fitur': 'Tipe Busi', 'Detail': 'NGK MR9C-9N/DENSO U27EPR9-N9'},
      ]
    },
  ),
  // Tambahkan data motor ev lainnya
];
