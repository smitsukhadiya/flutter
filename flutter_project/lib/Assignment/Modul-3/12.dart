import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:navigationDrawer(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class navigationDrawer extends StatefulWidget {
  const navigationDrawer({Key? key}) : super(key: key);

  @override
  State<navigationDrawer> createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {
  int _selectedindex = 0;
  List<Widget> _WidgetOptions = <Widget>[
    GalleryPage(),
    AudioPage(),
    VideoPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
      Navigator.pop(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer'),
      ),
      drawer: Drawer(
        elevation: 20,
        child: Column(
          children: [
            Divider(thickness: 2),
            SizedBox(height: 20,),
            ListTile(
              leading:Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading:Icon(Icons.audiotrack),
              title: Text('Audio'),
              onTap:() => _onItemTapped(1),
            ),
            ListTile(
              leading:Icon(Icons.video_collection),
              title: Text('Videos'),
              onTap:() => _onItemTapped(2),
            ),
            Divider(thickness: 2),
          ],
        ),
      ),
      body: Center(
        child: _WidgetOptions.elementAt(_selectedindex),
      ),
    );
  }
}
class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<Data> images = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images.add(Data(image: Image.asset('assets/Grid/download.jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/download (2).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/download (1).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/download (3).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images.jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images (1).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images (2).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images (3).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images (4).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images (5).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images (6).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images (7).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/images (8).jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/1.jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/2.jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/3.jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/4.jpeg',fit:BoxFit.cover ,)));
    images.add(Data(image: Image.asset('assets/Grid/5.jpeg',fit:BoxFit.cover ,)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:GridView.builder(
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ), itemBuilder:(context, index) {
            return Container(
                child:images[index].image
            );
          },)
      ),
    );
  }
}
class Data{
  Image image;

  Data({required this.image});
}
class AudioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Song ${index + 1}'),
            subtitle: Text('Artist ${index + 1}'),
            trailing: Icon(Icons.more_horiz),
          );
        },
      ),
    );
  }
}
class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ), itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.video_library,size: 70),
        ),
      );
    },);
  }
}
