part of 'widget.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.home,
              text: 'Beranda',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BerandaPage(),
                    ),
                  )),
          _drawerItem(
              icon: Icons.movie,
              text: 'Now Playing',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BerandaPage(),
                    ),
                  )),
          _drawerItem(
              icon: Icons.border_top,
              text: 'Top Related',
              onTap: () => print('Tap Top Related')),
          _drawerItem(
              icon: Icons.movie_filter,
              text: 'Upcoming',
              onTap: () => print('Tap Upcoming')),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Labels",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: Icons.question_answer,
              text: 'About',
              onTap: () => print('Tap About')),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child:
          Image(image: AssetImage('assets/movie_icon.png'), fit: BoxFit.cover),
    ),
    accountName: Text('Movie Javan'),
    accountEmail: Text('test@gmail.com'),
  );
}

Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: blackTextFont,
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
