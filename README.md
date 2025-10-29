# Comparador-de-corridas-flash

Este é um projeto de aplicativo móvel híbrido (Flutter) que simula a funcionalidade de um comparador de preços de corridas de aplicativos de transporte (como Uber e 99), destacando a opção mais econômica.

**Atenção:** Devido às restrições de API das empresas de transporte, este aplicativo utiliza **dados e estimativas simuladas** para demonstrar a interface e a lógica de comparação de preços em tempo real.

## 🚀 Tecnologias Utilizadas

*   **Framework:** Flutter
*   **Linguagem:** Dart
*   **Plataformas Suportadas:** Android e iOS (código-base único)

## ✨ Funcionalidades do Protótipo

*   **Simulação de Comparação:** Simula a busca e comparação de preços entre diferentes serviços (Uber, 99, Táxi Comum).
*   **Destaque do Melhor Preço:** Identifica e destaca visualmente a opção mais barata.
*   **Interface Amigável:** Design simples e intuitivo para experiência mobile.
*   **Simulação de Rota:** Permite "trocar" as localizações de origem e destino para simular diferentes cenários de preço.

## 🛠️ Como Rodar o Projeto Localmente

Para rodar este projeto, você precisará ter o **Flutter SDK** e o **Android Studio/VS Code** instalados em sua máquina.

### 1. Pré-requisitos

*   Instale o [Flutter SDK](https://docs.flutter.dev/get-started/install).
*   Configure seu ambiente de desenvolvimento (Android Studio ou VS Code) e execute `flutter doctor` para verificar as dependências.

### 2. Clonar o Repositório

```bash
git clone https://github.com/Thiag086/Comparador-de-corridas-flash.git
cd Comparador-de-corridas-flash
```

### 3. Instalar Dependências

No diretório raiz do projeto, execute:

```bash
flutter pub get
```

### 4. Rodar o Aplicativo

Conecte um dispositivo Android/iOS ou inicie um emulador/simulador. Em seguida, execute:

```bash
flutter run
```

## 📦 Como Gerar o Arquivo APK (Para Android)

Para gerar o arquivo de instalação para Android (`.apk`), que pode ser compartilhado ou usado para testes:

1.  Certifique-se de que todas as dependências do Android SDK estão configuradas (verifique com `flutter doctor`).
2.  Execute o comando de build no diretório raiz do projeto:

```bash
flutter build apk --release
```

O arquivo final (`app-release.apk`) estará localizado em `build/app/outputs/flutter/apk/`.

## 📈 Próximos Passos (Para um App Real)

Para transformar este protótipo em um aplicativo real, as seguintes etapas seriam necessárias:

1.  **Integração com Geolocalização:** Usar o GPS do dispositivo para obter as coordenadas reais.
2.  **Integração com APIs Reais (se disponíveis):** Buscar parcerias ou métodos legais para obter preços reais de diferentes plataformas.
3.  **Publicação na Play Store:** Criar uma conta de desenvolvedor, seguir as diretrizes da Google e carregar o arquivo `app-release.aab` (formato recomendado) ou `app-release.apk`.

---
Desenvolvido por Manus.
Última Atualização: Outubro de 2025.
