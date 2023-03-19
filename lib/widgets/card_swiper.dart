import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

//TODO: stlew
class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      //Todo el ancho posible pero segun el padre
      width: double.infinity,
      height: size.height * 0.5, //TODO 50% del alto del padre
      // color: Colors.red,
      child: Swiper(
        //TODO: Swiper - Revisar en la documentacion
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index) {
          //TODO: return un widget
          return GestureDetector(
            //GestureDetector: Permite detectar gestos en un widget y cambiar su comportamiento con el onTap que es un callback
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              //Solo sirve para cortar los bordes de un widget
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover //TODO: Adaptar la imagen al contenedor
                  ),
            ),
          );
        },
      ),
    );
  }
}
