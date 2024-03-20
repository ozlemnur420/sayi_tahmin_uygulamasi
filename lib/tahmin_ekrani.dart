import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_uygulamasi/sonuc_ekrani.dart';

class Tahmin_ekrani extends StatefulWidget {
  const Tahmin_ekrani({super.key});

  @override
  State<Tahmin_ekrani> createState() => _Tahmin_ekraniState();
}

class _Tahmin_ekraniState extends State<Tahmin_ekrani> {

  var tf_tahmin=TextEditingController();
  int rastgele_sayi=0;
  int kalan_hak=5;
  String yonlendirme="";

  @override
  void initState() {
    super.initState();

    rastgele_sayi= Random().nextInt(101); // 0-100 arası
    print("Rastgele sayı: $rastgele_sayi");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text("Kalan Hak : $kalan_hak",style: TextStyle(fontSize: 40,color: Colors.deepPurple),),
            Text("YARDIM: $yonlendirme",style: TextStyle(fontSize: 20,color: Colors.purpleAccent),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller:tf_tahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "TAHMİN",
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),

                ),


              ),
            ),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
                child: Text("Tahmin et",style: TextStyle(fontSize:20 , color: Colors.black87),),
                onPressed: (){
                  setState(() {
                    kalan_hak=kalan_hak-1;
                  });
                  int tahmin=int.parse(tf_tahmin.text);

                  if(tahmin==rastgele_sayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Sonuc_ekrani(sonuc: true,)));
                    return;
                  }
                  
                  if(tahmin>rastgele_sayi){
                    setState(() {
                      yonlendirme="Tahmini azalt";
                    });
                  }

                  if(tahmin<rastgele_sayi){
                    setState(() {
                      yonlendirme="Tahmini arttır";
                    });
                  }

                  if(kalan_hak==0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Sonuc_ekrani(sonuc: false,)));
                  }

                  tf_tahmin.text="";

                },

              ),
            ),

          ],
        ),
      ),

    );
  }
}
