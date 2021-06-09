import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model/main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: myMain(),
  ));
}

class myMain extends StatefulWidget {
  @override
  _myMainState createState() => _myMainState();
}

class _myMainState extends State<myMain> {

  goRet(String test,String img){


    if(test.length>1){


      return CircleAvatar(child: Text(test,style: GoogleFonts.openSans(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Colors.grey,);


    }else{


      return CircleAvatar(backgroundImage: AssetImage(img),);

    }




  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "img/appBarLogo.png",
          width: 100,
          height: 100,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Icon(
            Icons.view_headline_outlined,
            color: Colors.black,
            size: 40,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.perm_identity_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      backgroundColor: Colors.grey,
                      radius: 25,
                    ),
                    Positioned(
                        right: 0,
                        child: CircleAvatar(
                          child: Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                            size: 10,
                          ),
                          radius: 10,
                          backgroundColor: Colors.purple,
                        ))
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Hesabım",
                  style: GoogleFonts.openSans(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 10),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 2, color: Colors.black.withOpacity(0.1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Türk Lirası",
                        style: GoogleFonts.openSans(
                            color: Colors.black.withOpacity(0.5), fontSize: 12),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("img/turkey.png"),
                        radius: 10,
                      ),
                      Text(
                        "TL",
                        style: GoogleFonts.openSans(
                            color: Colors.black.withOpacity(0.5), fontSize: 12),
                      ),
                      Icon(Icons.arrow_drop_down_rounded)
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        color: Colors.red,
                        size: 40,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Çek",
                        style: GoogleFonts.openSans(
                            color: Colors.black.withOpacity(0.5), fontSize: 13),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "30.05 TL",
                            style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Papara numaran; ",
                            style: GoogleFonts.openSans(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Text(
                            "18755665",
                            style: GoogleFonts.openSans(
                                color: Colors.purple,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.green,
                        size: 40,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Yatır",
                        style: GoogleFonts.openSans(
                            color: Colors.black.withOpacity(0.5), fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "SON İŞLEMLER",
                    style: GoogleFonts.openSans(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.black.withOpacity(0.5),
                    size: 15,
                  )
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: papara.transactions.map((e) {

                var str = e["transactionsName"];
                var strSp = str!.split(" ");
                String ad = "";
                
                if (e["transactionsImage"] == "transactionsName") {

                  for (int i = 0; i <= strSp.length - 1; i++) {
                    ad = ad + strSp[i][0];
                  }
                }


                return ListTile(
                  leading: goRet(ad,e["transactionsImage"].toString()),
                  subtitle: Text(
                    e["transactionsType"].toString(),
                    style: GoogleFonts.openSans(),
                  ),
                  title: Text(
                    e["transactionsName"].toString(),
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        e["transactionsAmount"].toString(),
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: e["transactionsAmountType"] == "out"
                                ? Colors.red.shade600
                                : Colors.green),
                      ),
                      Text(
                        e["transactionsDate"].toString(),
                        style: GoogleFonts.openSans(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.purple,
                    size: 25,
                  ),
                  Text(
                    "Ana Sayfa",
                    style: GoogleFonts.openSans(
                        color: Colors.purple, fontSize: 12, letterSpacing: -1),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code,
                    color: Colors.black,
                    size: 25,
                  ),
                  Text(
                    "QR İşlemleri",
                    style: GoogleFonts.openSans(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12,
                        letterSpacing: -1),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.send,
                    color: Colors.black,
                    size: 25,
                  ),
                  Text(
                    "Para Transferi",
                    style: GoogleFonts.openSans(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12,
                        letterSpacing: -1),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.library_books_sharp,
                    color: Colors.black,
                    size: 25,
                  ),
                  Text(
                    "Ödemeler",
                    style: GoogleFonts.openSans(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12,
                        letterSpacing: -1),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                  Text(
                    "Papara Card",
                    style: GoogleFonts.openSans(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12,
                        letterSpacing: -1),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
