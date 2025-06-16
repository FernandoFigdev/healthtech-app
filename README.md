
# HealthTech – Monitoramento de Sinais Vitais

Este é um aplicativo mobile desenvolvido em Flutter, com o objetivo de simular um sistema de monitoramento de sinais vitais. O app permite aos usuários acessar informações como dados pessoais, relatórios simulados de saúde, acompanhamento de plano de saúde e notificações.

---

## Funcionalidades

### Telas e Funcionalidades

- **Tela de Login**
  - Acesso simulado do usuário para navegação no app.

- **Tela Home**
  - Dashboard principal com visão geral dos dados do usuário e atalhos rápidos.

- **Tela de Perfil**
  - Informações pessoais, abas internas como *Sobre*, *Exames* e *Configurações*.

- **Tela de Relatórios**
  - Relatórios simulados de sinais vitais com filtros: Diários, Semanais e Mensais.
  - Aba de hospitais próximos (simulada).

- **Tela de Plano de Saúde**
  - Informações básicas sobre o plano, avaliações e dispositivos conectados simulados.

- **Navegação**
  - Menu inferior fixo com acesso rápido a todas as telas, além de abas internas em telas específicas.

---

## Estrutura do Projeto

O projeto segue uma organização modular, separando responsabilidades:

```
lib/
├── main.dart
├── db/
│   └── database_helper.dart
├── models/
│   └── user_model.dart
├── screens/
│   ├── login_screen.dart
│   ├── register_screen.dart
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   ├── reports_screen.dart
│   └── health_plan_screen.dart
├── utils/
│   └── validators.dart
├── widgets/
│   └── custom_input.dart
```

---

## Instalação e Execução

### Pré-requisitos

- Flutter instalado na máquina ([Flutter Install](https://docs.flutter.dev/get-started/install))
- Android Studio ou outro emulador/dispositivo físico Android

### Passo a Passo

1. **Clone o Repositório:**

```bash
git clone https://github.com/seuusuario/HealthTech-App.git
cd HealthTech-App
```

2. **Instale as dependências:**

```bash
flutter pub get
```

3. **Execute o aplicativo:**

- No emulador ou dispositivo conectado:

```bash
flutter run
```

4. **Para gerar o APK:**

```bash
flutter build apk --release
```

O arquivo será gerado na pasta `/build/app/outputs/flutter-apk/app-release.apk`.

---

## Tecnologias Utilizadas

- **Flutter** – Framework principal para desenvolvimento mobile.
- **Dart** – Linguagem utilizada.
- **SQLite/SharedPreferences** – Armazenamento local simulado.
- **Android SDK** – Para build e execução.

---

## Estrutura do Código

- **screens/** – Telas do app.
- **db/** – Controle e configuração do banco de dados local.
- **models/** – Definição dos modelos de dados.
- **utils/** – Funções auxiliares.
- **widgets/** – Componentes customizados reutilizáveis.

---

## Próximos Passos

- Implementação de autenticação real.
- Integração com APIs externas para sinais vitais.
- Implementação de notificações push.
- Melhorias na interface e novos recursos.

---

## Contato

**Fernando Figueiredo**  
📧 E-mail: fernando.marlon2020@gmail.com  
🔗 GitHub: [https://github.com/FernandoFigdev](https://github.com/FernandoFigdev)

---

## ⚠️ Observações

Este projeto é um MVP (Produto Mínimo Viável) desenvolvido para fins acadêmicos e demonstração prática do desenvolvimento mobile com Flutter.
