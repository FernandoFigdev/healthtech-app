import 'package:flutter/material.dart';
import 'package:healthtech/screens/health_plan_screen.dart';
import 'package:healthtech/screens/home_screen.dart';
import 'package:healthtech/screens/reports_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userEmail;

  const ProfileScreen({required this.userEmail, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black87),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
          title: const Text('Usuário', style: TextStyle(color: Colors.black87)),
          bottom: const TabBar(
            indicatorColor: Colors.deepPurple,
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'Sobre'),
              Tab(icon: Icon(Icons.medical_services), text: 'Exames'),
              Tab(icon: Icon(Icons.settings), text: 'Configurações'),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/profile_banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('Jose da Silva', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('Usuário em observação - Diabetes', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: [
                  _buildAboutTab(),
                  Center(child: Text('Exames ainda não disponíveis')),
                  Center(child: Text('Configurações ainda não disponíveis')),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // Perfil
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 0) return;
            switch (index) {
              case 1:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReportScreen(userEmail: userEmail),
                  ),
                );
                break;
              case 2:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HealthPlanScreen(userEmail: userEmail),
                  ),
                );
                break;
              case 3:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(userEmail: userEmail),
                  ),
                );
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description),
              label: 'Relatórios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Plano de Saúde',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Updates',
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildAboutTab() {
    final items = [
      {'icon': Icons.analytics, 'label': 'Análise diária', 'status': true},
      {'icon': Icons.insert_chart, 'label': 'Relatório diário', 'status': true},
      {'icon': Icons.medical_information, 'label': 'Consulta Médica', 'status': false},
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.deepPurple.shade100,
            child: Icon(
              item['icon'] as IconData,
              color: Colors.deepPurple,
            ),
          ),
          title: Text(item['label'] as String),
          subtitle: const Text('100+'),
          trailing: Icon(
            (item['status'] as bool) ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.deepPurple,
          ),
        );
      },
    );
  }
}
