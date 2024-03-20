import 'package:flutter/material.dart';

class Sonuc_ekrani extends StatefulWidget {

  bool sonuc;
  Sonuc_ekrani({required this.sonuc});

  @override
  State<Sonuc_ekrani> createState() => _Sonuc_ekraniState();
}

class _Sonuc_ekraniState extends State<Sonuc_ekrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc ? Image.asset("resimler/mutlu_resim.png"): Image.asset("resimler/uzgun_resim.png"),
            Text(widget.sonuc ? "KAZANDINIZ" : "KAYBETTİNİZ" ,style: TextStyle(fontSize: 40,color: Colors.black54),),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: Colors.deepOrangeAccent),
                  ),
                ),
                child: Text("TEKRAR DENE",style: TextStyle(fontSize:20,color: Colors.black87),),
                onPressed: (){
                  Navigator.pop(context);
                },

              ),
            ),
          ],
        ),
      ),

    );
  }
}
