import 'package:flutter/material.dart';

class DressCard extends StatelessWidget {
  const DressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 45.0, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: Container(
          height: 285,
          width: 360,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: NetworkImage(
                    'https://www.prinzicollections.com.au/wp-content/uploads/2014/09/suit-hire-melbourne-0x0.jpg'),
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  'Some Dress',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Agraham',
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
