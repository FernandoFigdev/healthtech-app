import 'package:flutter/material.dart';
import 'package:healthtech/screens/home_screen.dart';
import 'package:healthtech/screens/profile_screen.dart';
import 'package:healthtech/screens/health_plan_screen.dart';

class ReportScreen extends StatefulWidget {
  final String userEmail;

  const ReportScreen({required this.userEmail, Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int _currentIndex = 1;
  int selectedCategory = 0;
  List<bool> toggleSelections = [true, false];

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
        break; // Já está na tela de Relatórios
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HealthPlanScreen(userEmail: widget.userEmail)),
        );
        break;
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
              'Relatórios',
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
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/report_banner.png',
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
              const Positioned(
                bottom: 16,
                left: 16,
                child: Text(
                  'Relatório Diário',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ToggleButtons(
              isSelected: toggleSelections,
              onPressed: (index) {
                setState(() {
                  toggleSelections = [index == 0, index == 1];
                });
              },
              borderRadius: BorderRadius.circular(12),
              selectedColor: Colors.white,
              fillColor: Colors.deepPurple,
              color: Colors.deepPurple,
              constraints: const BoxConstraints(minHeight: 40, minWidth: 140),
              children: const [
                Text('Relatórios Antigos'),
                Text('Hospitais Próximos'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(3, (index) {
                final labels = ['Diários', 'Semanais', 'Mensais'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        labels[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedCategory == index ? Colors.deepPurple : Colors.grey,
                        ),
                      ),
                      if (selectedCategory == index)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 3,
                          width: 60,
                          color: Colors.deepPurple,
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildReportCard('01/12/2024', 5, 'Monitoramento inicial completo com métricas de glicose e pressão dentro da média.'),
                _buildReportCard('02/12/2024', 3, 'Leve aumento na glicose pós-refeição; recomendações de ajuste na dieta enviadas.'),
                _buildReportCard('03/12/2024', 2, 'Estabilidade nas medições; nenhum alerta crítico detectado, manutenção sugerida.'),
              ],
            ),
          ),
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

  Widget _buildReportCard(String date, int stars, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.download, color: Colors.white),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < stars ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                );
              }),
            ),
            const Icon(Icons.favorite_border, color: Colors.pink),
          ],
        ),
        subtitle: Text(description),
      ),
    );
  }
}
