import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context,
        listen: false); // listen: false para rebuild mínimo

    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          // Card do total e botão comprar
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  // Total do carrinho
                  Consumer<Cart>(
                    builder: (ctx, cart, child) => Chip(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Text(
                        'R\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Botão comprar
                  CartButton(cart: cart),
                ],
              ),
            ),
          ),
          // Lista de itens do carrinho
          Expanded(
            child: Consumer<Cart>(
              builder: (ctx, cart, child) {
                final items = cart.items.values.toList();
                if (items.isEmpty) {
                  return const Center(child: Text('Carrinho vazio'));
                }
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, i) => CartItemWidget(items[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CartButton extends StatefulWidget {
  final Cart cart;
  const CartButton({Key? key, required this.cart}) : super(key: key);

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : TextButton(
            onPressed: widget.cart.itemsCount == 0
                ? null
                : () async {
                    setState(() => _isLoading = true);

                    try {
                      // Adiciona pedido
                      await Provider.of<OrderList>(
                        context,
                        listen: false,
                      ).addOrder(widget.cart);   

                      // Limpa carrinho
                      Future.delayed(Duration.zero, () {
                        widget.cart.clear();
                      });
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao finalizar pedido'),
                        ),
                      );
                    } finally {
                      setState(() => _isLoading = false);
                    }
                  },
            child: const Text('COMPRAR'),
          );
  }
}
