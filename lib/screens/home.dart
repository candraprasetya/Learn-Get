part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  final CounterState counterState = Get.put(CounterState());

  goToProfileScreen() {
    //    Navigator.push(context, MaterialPageRoute(builder: null))
    Get.to(ProfileScreen());
  }

  showSnackBar() {
    Get.snackbar("Hallo", "Ini adalah contoh snackbar");
  }

  showDialog() {
    Get.defaultDialog(title: "Simple Dialog", content: Text('Mantab'));
  }

  showBottomSheet() {
    Get.bottomSheet(CupertinoActionSheet(
      title: Text("Hobbies"),
      message: Text("Select your hobbie"),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Coding"),
          onPressed: () {
            // TODO: do something in here
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Main Game"),
          onPressed: () {
            // TODO: do something in here
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Menulis"),
          onPressed: () {
            // TODO: do something in here
          },
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text("State : ${counterState.counter.string}",
                    style: TextStyle(color: CupertinoColors.activeBlue))),
                SizedBox(width: 20),
                CupertinoButton(

                  color: CupertinoColors.activeGreen,
                    child: Text('Add'),
                    onPressed: () {
                      counterState.increment();
                    }),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton(CupertinoIcons.person_add, 'Profile',
                    () => goToProfileScreen()),
                SizedBox(width: 20),
                customButton(CupertinoIcons.conversation_bubble, 'Snackbar',
                    () => showSnackBar()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customButton(CupertinoIcons.bookmark, 'BottomSheet',
                    () => showBottomSheet()),
                SizedBox(width: 20),
                customButton(CupertinoIcons.check_mark_circled, 'Stream',
                    () => counterState.startStream()),
              ],
            ),
            SizedBox(height: 20),
            StreamBuilder(
                stream: counterState.streamController.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot) {
                  return Text((snapshot.data==null) ? 'Klik Stream!' : 'Stream ' + snapshot.data.toString(), style: TextStyle(
                    fontSize: 18
                  ),);
                }),

          ],
        ),
      ),
    );
  }

  Widget customButton(IconData iconData, String text, Function function) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CupertinoColors.activeBlue),
      width: 120,
      height: 120,
      child: InkWell(
        onTap: function,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: CupertinoColors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style: TextStyle(color: CupertinoColors.white),
            )
          ],
        ),
      ),
    );
  }
}
