import 'package:game_center/main.import.dart';
import 'package:game_center/main.library.dart';

class BannerDebugCard extends StatelessWidget {
  const BannerDebugCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height / 2,
        left: -15,
        child: Column(
          children: [
            Card(
                elevation: 12,
                color: Theme.of(context).primaryColor,
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    getIt.get<Alice>().showInspector();
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.bug_report,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        size: 30,
                      )),
                )),
            const SizedBox(height: 3),
            Card(
                elevation: 12,
                color: Theme.of(context).errorColor,
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    getIt.get<AppRouter>().navigate(const ErrlyticsRoute());
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.nearby_error,
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        size: 30,
                      )),
                ))
          ],
        ));
  }
}
