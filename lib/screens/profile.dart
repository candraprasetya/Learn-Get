part of 'screens.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color: CupertinoColors.inactiveGray.withOpacity(.2)
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){
                      Get.back();
                    },
                    icon: Icon(CupertinoIcons.back),
                  ),
                  Text(
                    'Profile'
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
