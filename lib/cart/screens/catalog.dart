import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/catalog.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12,),),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) => _MyListItem(index)
            ),
          )
        ],
      ),
    );
  }

}

class _MyListItem extends StatelessWidget {
  const _MyListItem(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
        (catalog) => catalog.getByPosition(index),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 1,
            child: Container(
              color: item.color,
            ),
            ),
            const SizedBox(width: 24),
            Expanded(
                child: Text(
                  item.name,
                  style: Theme.of(context).textTheme.titleLarge,
                )
            ),
            const SizedBox(width: 24,),
            _AddButton(item: item)
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget{
  const _AddButton({required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}