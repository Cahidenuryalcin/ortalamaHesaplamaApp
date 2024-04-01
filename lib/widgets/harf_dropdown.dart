import 'package:dinamik_ortalama_hesaplama_app/app_constanst.dart';
import 'package:dinamik_ortalama_hesaplama_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropDown extends StatefulWidget {
  const HarfDropDown({super.key, required this.onHarfSecildi});

  final Function onHarfSecildi;

  @override
  State<HarfDropDown> createState() => _HarfDropDownState();
}

class _HarfDropDownState extends State<HarfDropDown> {
  double secilenHarfDeger = 4;
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
        value: secilenHarfDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade300,
        onChanged: (deger) {
          setState(() {
            secilenHarfDeger = deger!;
            widget.onHarfSecildi(secilenHarfDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHafleri(),
      ),
    );
  }
}