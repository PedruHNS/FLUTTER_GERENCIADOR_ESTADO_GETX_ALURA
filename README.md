# Projeto de Exemplo - GetX (ALURA)

### Demonstração

<p align="center">
  <img width="460" height="300" src="/assets/to_readme/getx.gif">
</p>


## Aplicação dos Componentes Utilizados do GetX

Este projeto utiliza o GetX para gerenciamento de estado, dependências e rotas. Abaixo estão alguns dos componentes do GetX utilizados:


- **GetMaterialApp**: Utilizado como substituto do MaterialApp padrão do Flutter, oferecendo funcionalidades adicionais que facilitam o gerenciamento de estado, injeção de dependências e navegação.

```dart
Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 83, 83),
          ),
          useMaterial3: true),
      home: Home(),
    );
  }
```

### Gerenciamento de Estado
- **GetxController**: Utilizado para gerenciar a lógica de negócios e o estado de uma forma organizada e reativa.

```dart
class CarrinhoController extends GetxController {
  // variáveis observáveis
  final carrinho = <Item>[].obs;
  final totalPrice = 0.0.obs;
  // função para adicionar um item ao carrinho
  void addItem(Item item) {
    carrinho.add(item);
    calcTotalPrice();
  }
  // função para remover um item do carrinho
  void removeItem(Item item) {
    carrinho.remove(item);
    calcTotalPrice();
  }
  // função para calcular o preço total do carrinho  
  void calcTotalPrice() {
    totalPrice.value = 0.0;
    for (var item in carrinho) {
      totalPrice.value += item.preco;
    }
  }
}
```

- **Obx**: Utilizado para reatividade, atualizando a interface do usuário automaticamente quando o estado observável muda.

```dart
class Cartao extends StatefulWidget {
  final Item item;
  const Cartao({super.key, required this.item});
  @override
  State<Cartao> createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> {
  late CartaoController controller;
  @override
  void initState() {
    super.initState();
    /*A linha abaixo está criando uma instância de CartaoController e a registrando no GetX dependency injection system.
    O método Get.put() é usado para injetar a dependência, e o parâmetro 'tag' é utilizado para identificar unicamente
    esta instância do controlador com base no nome do item do widget. Isso permite que diferentes instâncias do controlador
    sejam diferenciadas e acessadas de forma específica quando necessário.*/
    controller = Get.put(CartaoController(), tag: widget.item.nome);
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
          child: ListTile(
            title: Text(widget.item.nome),
            subtitle: Text('R\$ ${widget.item.preco}'),
          ),
        ),
    );
  }
}

```



### Gerenciamento de Dependências

- **Get.put()**: Utilizado para injetar dependências que estarão disponíveis durante todo o ciclo de vida da aplicação.

```dart
    final controller = Get.put<HomeController>(HomeController());
```

- **Get.find()**: Utilizado para encontrar uma dependência que já foi injetada anteriormente no sistema de injeção de dependências do GetX.
    
    ```dart
        final controller = Get.find<HomeController>();
    ```

### Gerenciamento de Rotas

- **Get.to()**: Utilizado para navegação entre páginas.
    
    ```dart
        Get.to(Home());
    ```

- **Get.offAll()**: Utilizado para navegação e remoção de todas as rotas anteriores da pilha de navegação.
        
    ```dart
        Get.offAll(Home());
    ```

### outro componente
- **GetSnackBar**: Utilizado para exibir um SnackBar na tela.
        
    ```dart
        Get.snackbar('Título', 'Mensagem');
    ```




