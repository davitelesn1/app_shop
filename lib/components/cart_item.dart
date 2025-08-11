import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;


  const CartItemWidget({super.key, required this.cartItem});


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,

      background: Container(
        color: Theme.of(context).colorScheme.error,

        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        padding: const EdgeInsets.only(right: 20),

        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),

      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(cartItem.productId);
      },

      child: Card(
        
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Padding(
          
          padding: const EdgeInsets.all(8),
          child: ListTile(
            
            leading: CircleAvatar(
               backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('${cartItem.price}'),
                ),
              ),
            ),
            title: Text(cartItem.name),
            subtitle: Text('Total : R\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
            trailing: Text('${cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}