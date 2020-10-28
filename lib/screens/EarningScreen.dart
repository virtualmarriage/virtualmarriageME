import 'package:flutter/material.dart';
import 'package:virtualmarriageME/model/EarningData.dart';
import 'package:virtualmarriageME/services/Api.dart';
import 'package:virtualmarriageME/utils/CommonComponent.dart';
import 'package:virtualmarriageME/widgets/EarningListItem.dart';

class EarningScreen extends StatefulWidget {
  @override
  _EarningScreenState createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  bool isLoading;
  Future<List<EarningData>> _future;

  @override
  void initState() {
    super.initState();
    _future = Api().getEarningList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Total Earning',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Categories(),
              Expanded(
                child: FutureBuilder<List<EarningData>>(
                  future: _future,
                  builder: (context, snapshot) {
                    //return gridView;
                    return snapshot.connectionState == ConnectionState.done
                        ? snapshot.hasData
                        ? homeGrid(snapshot)
                        : Center(
                      child: CommonComponent.retryButton(fetch),
                    )
                        : Center(child: CommonComponent.circularProgress());
                  },
                ),
              ),
            ],
          )
      ),


    );
  }

  setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  fetch() {
    setLoading(true);
  }

  Container homeGrid(AsyncSnapshot<List<EarningData>> snapshot) {
    return  Container(
      child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) => EarningListItem(
            earningData: snapshot.data[index],
            //press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailScreen(),),),
          )),
    );
  }
}
