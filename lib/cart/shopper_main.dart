import 'package:flutter/cupertino.dart';
import 'package:flutter_sandbox/cart/models/cart.dart';
import 'package:flutter_sandbox/cart/models/catalog.dart';
import 'package:flutter_sandbox/cart/screens/catalog.dart';
import 'package:provider/provider.dart';

class MyShopper extends StatelessWidget {
  const MyShopper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart) {
              if (cart == null) throw ArgumentError.notNull('cart');
              cart.catalog = catalog;
              return cart;
            })
      ],
      child: MyCatalog(),
    );
  }
}
