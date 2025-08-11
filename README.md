# Loja Virtual Flutter com Provider


## 📱 Demonstração



 <img src="assets/demo/demo1.gif" width="300"/>

## Descrição

Este é um projeto de aplicativo mobile desenvolvido em Flutter, simulando uma loja virtual básica. O app permite visualizar produtos, adicionar ao carrinho, marcar favoritos, finalizar pedidos e visualizar histórico de compras. Utiliza dados dummy para demonstração e foca no gerenciamento de estado eficiente.

## Funcionalidades Principais

- **Listagem de Produtos**: Grade de produtos com filtro para favoritos.
- **Detalhes do Produto**: Página dedicada com imagem, preço e descrição.
- **Favoritos**: Marcar/desmarcar produtos como favoritos.
- **Carrinho de Compras**: Adicionar/remover itens, calcular total e limpar carrinho.
- **Pedidos**: Finalizar compra e visualizar histórico expansível.
- **Navegação**: Drawer para alternar entre loja e pedidos.
- **Contador Exemplo**: Uma página simples para demonstrar estado básico (opcional).

## Aprendizados na Construção

Durante o desenvolvimento deste app, aprendi vários conceitos chave do Flutter, com ênfase no gerenciamento de estado usando o pacote `provider`:

- **Gerenciamento de Estado com Provider**: 
  - Usei `ChangeNotifierProvider` e `MultiProvider` no `main.dart` para prover estados globais como `ProductList`, `Cart` e `OrderList`.
  - Criei modelos como `Product`, `Cart` e `OrderList` que extendem `ChangeNotifier`, notificando listeners com `notifyListeners()` ao alterar dados (ex.: adicionar ao carrinho ou toggle favorito).
  - Utilizei `Provider.of<T>(context)` para acessar e modificar estados sem rebuild desnecessário, e `Consumer<T>` para rebuilds localizados (ex.: badge no carrinho e ícone de favorito).
  - Entendi a diferença entre `listen: true/false` para otimizar performance, evitando rebuilds em widgets que não precisam reagir a mudanças.
  - Implementei filtragem de produtos favoritos via `ProductList`, mostrando como estados compartilhados facilitam features como filtros dinâmicos.

- **Outros Pontos Aprendidos**:
  - **Navegação e Rotas**: Configuração de rotas nomeadas em `app_routes.dart` e uso de `Navigator.pushNamed` para transições suaves.
  - **UI Responsiva**: Widgets como `GridView.builder` para grades de produtos, `Dismissible` para remoção de itens no carrinho, e `ExpansionPanel` implícito em pedidos expansíveis.
  - **Modelos e Dados**: Criação de classes como `Product`, `CartItem` e `Order` para estrutura de dados, com dados dummy para prototipagem rápida.
  - **Tema e Estilo**: Aplicação de `ThemeData` para consistência de cores e fontes.
  - **Estado Local vs Global**: Comparação com estado local em páginas como o contador, destacando quando usar `setState` vs Provider.

Este projeto reforçou a importância de separar lógica de UI, tornando o código mais escalável e testável.

## Requisitos

- Flutter SDK (versão 3.0+ recomendada).
- Dart SDK.

## Instalação e Execução

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/loja-virtual-flutter.git
