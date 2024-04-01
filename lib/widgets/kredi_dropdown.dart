import 'package:dinamik_ortalama_hesaplama_app/app_constanst.dart';
import 'package:dinamik_ortalama_hesaplama_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediDropdown extends StatefulWidget {
  const KrediDropdown({super.key, required this.onKrediSecildi});

  final Function onKrediSecildi;

  @override
  State<KrediDropdown> createState() => _KrediDropdownState();
}

class _KrediDropdownState extends State<KrediDropdown> {
  double secilenKrediDeger = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropdownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenKrediDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade300,
        onChanged: (deger) {
          setState(() {
            secilenKrediDeger = deger!;
            widget.onKrediSecildi(secilenKrediDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}