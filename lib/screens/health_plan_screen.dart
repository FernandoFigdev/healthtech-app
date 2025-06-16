import 'package:flutter/material.dart';
import 'package:healthtech/screens/profile_screen.dart';
import 'package:healthtech/screens/reports_screen.dart';
import 'package:healthtech/screens/home_screen.dart';

class HealthPlanScreen extends StatefulWidget {
  final String userEmail;

  const HealthPlanScreen({required this.userEmail, Key? key}) : super(key: key);

  @override
  State<HealthPlanScreen> createState() => _HealthPlanScreenState();
}

class _HealthPlanScreenState extends State<HealthPlanScreen> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ProfileScreen(userEmail: widget.userEmail)),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ReportScreen(userEmail: widget.userEmail)),
        );
        break;
      case 2:
        break; // Já está nesta tela
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen(userEmail: widget.userEmail)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/tufts_logo.png', height: 30),
            const SizedBox(width: 8),
            const Text(
              'Health Plan',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
              radius: 20,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildReviewCard(),
          const SizedBox(height: 16),
          _buildImageCarousel(),
          const SizedBox(height: 16),
          _buildDeviceCard(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Relatórios'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Plano de Saúde'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Updates'),
        ],
      ),
    );
  }

  Widget _buildReviewCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: List.generate(4, (index) => const Icon(Icons.star, color: Colors.amber, size: 20))),
            const SizedBox(height: 8),
            const Text(
              'Experiência positiva',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text('Atendimento rápido e eficiente'),
            const SizedBox(height: 12),
            Row(
              children: const [
                CircleAvatar(radius: 16, backgroundImage: AssetImage('assets/avatar_woman.png')),
                SizedBox(width: 8),
                Text('Juliana Souza'),
                Spacer(),
                Text('02/12/2024', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildRoundedImage('assets/tufts_1.png'),
          _buildRoundedImage('assets/tufts_2.png'),
          _buildRoundedImage('assets/tufts_3.png'),
        ],
      ),
    );
  }

  Widget _buildRoundedImage(String path) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(path, width: 150, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildDeviceCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.watch),
        ),
        title: const Text('Samsung Galaxy Watch6 BT'),
        subtitle: Row(
          children: const [
            Icon(Icons.battery_charging_full, color: Colors.green),
            SizedBox(width: 4),
            Text('Carregando...'),
          ],
        ),
        trailing: const Icon(Icons.sync),
      ),
    );
  }
}
