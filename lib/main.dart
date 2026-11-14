import 'package:flutter/material.dart';

void main() {
  runApp(const TabungKu());
}

class TabungKu extends StatelessWidget {
  const TabungKu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabungKu',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF800020),
        ),
      ),
      home: const RingkasanPage(),
    );
  }
}

class RingkasanPage extends StatelessWidget {
  const RingkasanPage({super.key});

  final Color burgundy = const Color(0xFF800020);
  final Color navy = const Color(0xFF17365D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ringkasan Tabungan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: burgundy,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Halo, Dava!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF800020),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Yuk, lihat perkembangan tabunganmu.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Ringkasan tabungan
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF800020),
                          Color(0xFF17365D),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tabungan Masa Depan',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Rp2.500.000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Target tabungan',
                              style: TextStyle(color: Colors.white70),
                            ),
                            Text(
                              'Rp5.000.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const LinearProgressIndicator(
                            value: 0.5,
                            minHeight: 9,
                            backgroundColor: Colors.white30,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFFFD6DF),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '50% dari target tercapai',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Menu Utama',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17365D),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: menuItem(
                          Icons.add_circle_outline,
                          'Menabung',
                          burgundy,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: menuItem(
                          Icons.account_balance_wallet_outlined,
                          'Tarik',
                          navy,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: menuItem(
                          Icons.history,
                          'Riwayat',
                          burgundy,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Transaksi Terakhir',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF17365D),
                    ),
                  ),

                  const SizedBox(height: 15),

                  transactionItem(
                    Icons.south_west,
                    'Menabung',
                    '14 November 2026',
                    '+ Rp500.000',
                    true,
                  ),

                  transactionItem(
                    Icons.north_east,
                    'Penarikan',
                    '12 November 2026',
                    '- Rp200.000',
                    false,
                  ),

                  transactionItem(
                    Icons.south_west,
                    'Menabung',
                    '10 November 2026',
                    '+ Rp300.000',
                    true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuItem(IconData icon, String title, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE3E8F0),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          const SizedBox(height: 9),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF17365D),
            ),
          ),
        ],
      ),
    );
  }

  Widget transactionItem(
    IconData icon,
    String title,
    String date,
    String amount,
    bool isIncome,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE3E8F0),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: const Color(0xFFF0E5EB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isIncome ? burgundy : navy,
              size: 23,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF17365D),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: isIncome
                  ? const Color(0xFF287A4B)
                  : burgundy,
            ),
          ),
        ],
      ),
    );
  }
}