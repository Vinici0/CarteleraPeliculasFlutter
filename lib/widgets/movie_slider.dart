import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              //TODO: No puede tener una columna un ListView por que no tiene un alto definido
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return const _MovidePoster();
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MovidePoster extends StatelessWidget {
  const _MovidePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            //Para poder hacer un onTap en un widget
            onTap: () {
              Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance');
            },
            child: const ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text('Titulo de la pelicula',
              //Si el texto es muy largo se corta y se pone puntos suspensivos
              overflow: TextOverflow.ellipsis,
              //Numero de lineas maximo que se mostraran
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
