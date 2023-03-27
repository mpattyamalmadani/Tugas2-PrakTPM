import 'package:flutter/material.dart';
import 'package:tugas2/tourism_data.dart';
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final username = args != null ? args['username'] as String : 'Guest';

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Hi $username'),
            actions: [
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
              icon:const Icon(Icons.exit_to_app_sharp)),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final TourismPlace data = tourismPlaceList[index];
                return Card(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return DetailPage(datadummy: data);
                            })
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 180,
                            width: double.infinity,
                            child: Image.network(
                                data.imageUrls[0],
                                fit: BoxFit.cover,
                                color: const Color.fromRGBO(0, 0, 0, 0.5),
                                colorBlendMode: BlendMode.darken
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Row(
                                    children:[
                                      for (var i=0; i<5; i++)
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                    ],
                                  ),
                                  // Text(hotel.stars),
                                  Text(
                                    data.location,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                  SizedBox(height: 70),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.access_time,color: Colors.white),
                                          SizedBox(width: 8.0),
                                          Text(
                                            data.openDays,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            data.openTime,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.attach_money,color: Colors.white),
                                          SizedBox(width: 8.0),
                                          Text(
                                            data.ticketPrice,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    )
                );
              },
              itemCount: tourismPlaceList.length,
            ),
          ),
        )
    );
  }
}