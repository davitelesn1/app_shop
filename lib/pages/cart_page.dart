import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final items = cart.items.values.toList();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Seu Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Text(
                  'Total: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Chip(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: Text(
                    'R\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white,),
                  ),
                ),
                const Spacer(),
                TextButton(
                  child: const Text('COMPRAR'),
                  style: TextButton.styleFrom(
                    textStyle:
                     const TextStyle(fontSize: 20),
                    foregroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed:(){
                    Provider.of<OrderList>(context, listen: false).addOrder(cart);
                    cart.clear();
                  },
                  )
              ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, i) => CartItemWidget(cartItem:items[i]),
              ),
          ),

        ],
      ),
    );
  }
}
