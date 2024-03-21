import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_api_test/homecontroller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(Homecontroller())..getprd();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 159, 255, 247),
          centerTitle: true,
          title: Text("Ajio"),
          actions: [Icon(Icons.logout)],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                homecontroller.prdlist.value.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(5),
                        itemCount: homecontroller.prdlist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 15,
                            mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 150,
                                width: 170,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          homecontroller.prdlist[index].image),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              ListTile(
                                title:
                                    Text(homecontroller.prdlist[index].title),
                                subtitle: Text(homecontroller
                                    .prdlist[index].price
                                    .toString()),
                                trailing: Text(homecontroller
                                    .prdlist[index].rating.rate
                                    .toString()),
                              )
                            ],
                          );
                        },
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
