import 'package:dinamik_ortalama_hesaplama_app/app_constanst.dart';
import 'package:dinamik_ortalama_hesaplama_app/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama_app/model/ders.dart';
import 'package:dinamik_ortalama_hesaplama_app/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesaplama_app/widgets/harf_dropdown.dart';
import 'package:dinamik_ortalama_hesaplama_app/widgets/kredi_dropdown.dart';
import 'package:dinamik_ortalama_hesaplama_app/widgets/ortalama_goster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;

  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    ortalama: DataHelper.ortalamaHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length),
              ),
            ],
          ),
          Expanded(
         
              child: DersListesi(
                onElemenCikarildi: (index) {
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {
                    
                  });
                },
              ),
            ),
          
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropDown(
                    onHarfSecildi: (harf){
                      secilenHarfDeger=harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdown(
                    onKrediSecildi: (kredi){
                      secilenKrediDeger=kredi;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _dersEkleVeOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios),
                color: Sabitler.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return "Ders adını giriniz";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "ders adi",
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }


 

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          dersAdi: girilenDersAdi,
          harfDegeri: secilenHarfDeger,
          kredi: secilenKrediDeger);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
