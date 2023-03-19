import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('MoviesProvider inicializado');
    this.getOneDisponible();
  }

  getOneDisponible() async {
    print('Cargando peliculas en cartelera');
  }
}
