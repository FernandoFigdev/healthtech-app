import 'package:flutter/material.dart';
import 'package:healthtech/screens/health_plan_screen.dart';
import 'package:healthtech/screens/profile_screen.dart';
import 'package:healthtech/screens/reports_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userEmail;

  const HomeScreen({required this.userEmail, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildBanner(),
              const SizedBox(height: 20),
              _buildDescription(),
              const SizedBox(height: 20),
              _buildNotificationPrompt(),
              const SizedBox(height: 30),
              _buildNavigationCards(context),
              const SizedBox(height: 80), // espaço para o bottom nav
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/avatar.png'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Jose da Silva',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Diabético',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.more_vert),
      ],
    );
  }

  Widget _buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset('assets/welcome_banner.png'),
    );
  }

  Widget _buildDescription() {
    return const Text(
      'Seu Parceiro na Jornada pela Saúde\n'
      'Monitore, previna e cuide da sua saúde em tempo real com recomendações personalizadas.',
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildNotificationPrompt() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Habilite as notificações para uma melhor experiência.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Não, Obrigado'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Habilitar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationCards(BuildContext context) {
    return Column(
      children: [
        _buildCard(
          icon: Icons.insert_chart_outlined,
          title: 'Página de Relatório',
          subtitle: 'Sua Saúde em Números',
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => ReportScreen(userEmail: userEmail)),
            );
          },
        ),
        const SizedBox(height: 10),
        _buildCard(
          icon: Icons.person_outline,
          title: 'Página de Perfil',
          subtitle: 'Seu Perfil, Sua Saúde',
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => ProfileScreen(userEmail: userEmail)),
            );
          },
        ),
        const SizedBox(height: 10),
        _buildCard(
          icon: Icons.favorite_outline,
          title: 'Página de Plano de Saúde',
          subtitle: 'Conexão com seu Plano de Saúde',
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => HealthPlanScreen(userEmail: userEmail)),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Icon(icon, color: Colors.purple),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(userEmail: userEmail),
              ),
            );
            break;
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
            // Já está na HomeScreen, não faz nada
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        BottomNavigationBarItem(icon: Icon(Icons.description), label: 'Relatórios'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Plano de Saúde'),
        BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
      ],
    );
  }
}
