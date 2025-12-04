# 🐾 Animals Hotel

O **Animals Hotel** é um aplicativo desenvolvido em **Flutter** que permite aos donos de animais de estimação encontrar e reservar hospedagens (hotéis e cuidadores) para seus pets.
Atualmente, o projeto conta com um sistema de autenticação simulado (Mock), listagem de hotéis e visualização de detalhes com integração ao Google Maps.

## 📱 Funcionalidades

* **Login & Cadastro:** Interface completa de autenticação com validação de dados (simulada localmente para testes rápidos).
* **Lista de Hotéis:** Visualização de hotéis disponíveis com fotos, preços e avaliações.
* **Detalhes & Localização:** Tela detalhada de cada estabelecimento com integração ao Google Maps para mostrar a localização exata via GPS.
* **Design Responsivo:** Adaptado para funcionar bem em navegadores (Web) e dispositivos móveis.

## 🛠️ Pré-requisitos

Antes de começar, você precisa ter as seguintes ferramentas instaladas na sua máquina:

* **Git** (para clonar o repositório, opcional).
* **Flutter SDK** (Versão estável mais recente).
* **Guia de Instalação do Flutter** (Windows/Mac/Linux).
* Um editor de código, recomendado: **Visual Studio Code (VS Code)** ou **Android Studio**.

> **Nota:** Certifique-se de que o comando `flutter doctor` no seu terminal não apresenta erros críticos.

## 🚀 Instalação e Configuração

Siga os passos abaixo para rodar o projeto localmente:

### 1. Obter o Código
Baixe o arquivo .zip deste projeto ou clone o repositório se estiver usando Git:

    git clone https://github.com/Luiz-06/dispositivos-moveis

### 2. Instalar Dependências
No terminal, dentro da pasta do projeto, execute:

    flutter pub get

Este comando baixará as bibliotecas necessárias listadas no `pubspec.yaml`, incluindo o `Maps_flutter`.

### 3. Configurar o Google Maps (Importante!) 🗺️
Para que o mapa apareça corretamente (e não fique em branco ou com erro), você precisa de uma **Chave de API do Google (API Key)**.

1.  Acesse o [Google Cloud Console](https://console.cloud.google.com/).
2.  Crie um projeto e habilite a "**Maps JavaScript API**" (para Web) e "**Maps SDK for Android/iOS**" (para Mobile).
3.  Gere uma API Key.

**Configuração para Web:**
Abra o arquivo `web/index.html` e procure pela tag `<script>` do Google Maps. Substitua `SUA_CHAVE_DE_API_AQUI` pela sua chave real:

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD...SUA_CHAVE_AQUI"></script>

> **Dica:** Se você ainda não tem a chave, o app vai rodar, mas o mapa pode apresentar erros visuais ou marcas d'água.

## ▶️ Como Executar

### Rodando no Google Chrome (Web)
O modo mais fácil para testar o layout e a integração com mapas:

    flutter run -d chrome

### Rodando no Android (Emulador ou Físico)
Certifique-se de ter um emulador rodando ou um celular conectado via USB:

    flutter run

*(Selecione o dispositivo Android na lista que aparecer)*

## 📂 Estrutura do Projeto

O código principal está na pasta `lib/`:

* `lib/main.dart`: Ponto de entrada do aplicativo.
* `lib/services/`:
    * `mock_auth_service.dart`: Simula um backend (banco de dados em memória) para login e registro sem precisar de servidor externo.
* `lib/views/`:
    * `login_view.dart`: Tela de Login.
    * `register_view.dart`: Tela de Cadastro.
    * `home_view.dart`: Lista de hotéis (contém os dados mockados com coordenadas GPS).
    * `hotel_details_view.dart`: Tela de detalhes que implementa o widget `GoogleMap`.

## 📦 Principais Dependências

* `flutter_bootstrap`: Utilizado na configuração web.
* `Maps_flutter`: Para exibir mapas interativos dentro do app.

## 📝 Notas de Desenvolvimento

**Mock de Dados:** As credenciais de teste padrão são:
* **Email:** `teste1@teste1.com`
* **Senha:** `123456`

**Persistência:** Como usamos um Mock em memória, se você reiniciar o app (Hot Restart), os novos usuários cadastrados serão apagados, voltando apenas ao usuário de teste padrão.

## 🤝 Colaboradores

* [GabrFelps](https://github.com/GabrFelps)
* [Luiz-06](https://github.com/Luiz-06)
