import 'package:dinamik_ortalama_hesaplama_app/app_constanst.dart';
import 'package:dinamik_ortalama_hesaplama_app/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama_app/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemenCikarildi;
  const DersListesi({super.key, required this.onElemenCikarildi});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;

    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (a) {
                 onElemenCikarildi(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].dersAdi),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].kredi)
                              .toStringAsFixed(0),
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].kredi} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "Lütfen Ders Ekleyin",
              style: Sabitler.baslikStyle,
            )),
          );
  }
}
