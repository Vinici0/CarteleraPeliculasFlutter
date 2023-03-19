import 'package:flutter/material.dart';

class CastainCard extends StatelessWidget {
  const CastainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 190,
      margin: const EdgeInsets.only(bottom: 30),
      // color: Colors.red,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (
            _,
            int index,
          ) =>
              const _CastainCard()),
    );
  }
}

class _CastainCard extends StatelessWidget {
  const _CastainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 100,
        //bordes redondeados

        //TODO: Para que no se peguen los widgets entre sí
        margin: const EdgeInsets.symmetric(horizontal: 10),
        // color: Colors.green,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 100,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'actor.name',
              //TODO: Para que el texto se adapte al espacio disponible y no se salga
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ));
  }
}
