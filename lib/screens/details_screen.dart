import 'package:flutter/material.dart';
import 'package:flutter_peliculas/widgets/casting_cards.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  //Key Sirve para identificar un widget de forma unica
  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por la instancia de la pelicula
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //Solo soporta SliverAppBar y SliverList
          const _CustomAppBar(),

          SliverList(
            delegate: SliverChildListDelegate([
              const _PosterAndTitle(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const CastainCard()
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //Solo tiene un efecto al hacer scroll hacia arriba y no hacia abajo como el AppBar normal
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        //Para quitar el padding  por defecto
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          width: double.infinity,
          color: Colors.black12,
          child: const Text(
            'movie.title',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
          // height:
          //     150, //para que no haga un brinco al cargar la imagen y se vea bien la animacion
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Hero(
            tag: 'movie.heroId',
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image(
                image: NetworkImage('https://via.placeholder.com/150x200'),
                height:
                    150, //TODO: Solo para ver el efecto de la animacion cambiar luego
              ),
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            //Para que el texto se adapte al espacio disponible y no se salga
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'movie.title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Text(
                  'movie.originalTitle',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: const [
                    Icon(Icons.star_outline, size: 15, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      'movie.voteAverage.toString()',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: stl - atajo
class _OverView extends StatelessWidget {
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: const Text(
        'Para los que os estáis volviendo locos buscando el archivo ScansDB.db en WIndows NO EXISTE la',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
      ),
    );
  }
}
