import 'package:flutter/material.dart';
import 'package:tugas2/tourism_data.dart';
class DetailPage extends StatefulWidget {
  final TourismPlace dummy;
  const DetailPage({Key? key, required this.dummy}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.dummy.name),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: (isFavorite)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 280,
              padding: const EdgeInsets.fromLTRB(5,10,5,10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (var i = 0; i < widget.dummy.imageUrls.length ; i++)
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 5),
                      width: 400,
                      child: Image.network(
                        widget.dummy.imageUrls[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: Text(
                      widget.dummy.name,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(var i=0; i<5; i++)
                        //const IconStar(),
                          const Icon(Icons.stars_rounded),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,2),
                    child: Text(
                      widget.dummy.location,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,3,0,2),
                    child: Text(
                      'Harga per Kamar : ${widget.dummy.ticketPrice}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.dummy.description,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}