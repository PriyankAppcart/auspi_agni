import 'package:flutter/material.dart';
import 'package:auspi_agni_flutter/SizeConfig.dart';

class sectetionList extends StatelessWidget {

  var dataList;
  final Function(String,String,String) onSelected;

  sectetionList({
    @required this.dataList,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(3 * SizeConfig.widthMultiplier),
          ),
      child:  new ListView.builder(
    padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        itemCount: dataList.length,
        itemBuilder:
            (BuildContext context,
            int index) {
          return Container(
              child: GestureDetector(
                onTap: () {
                  onSelected(dataList?[index]["city"],dataList?[index]["lat"],dataList?[index]["long"]);
                  Navigator.pop(context);
                },
                child: Container(
                  width: 100 * SizeConfig.widthMultiplier,
                  color: Colors.white70,
                  margin: EdgeInsets.all(3.5 * SizeConfig.widthMultiplier),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <
                        Widget>[
                     // SizedBox(height:SizeConfig.heightMultiplier,),
                      Text(dataList?[index]["city"],
                          textAlign: TextAlign.start,
                          maxLines:2,),
                      SizedBox(height:  SizeConfig.heightMultiplier,),
                      Divider(color:Colors.grey),
                      //manPowerList.last?SizedBox(height: 10 * SizeConfig.heightMultiplier,):Container(),
                    ],
                  ),
                ),
              ));
        }),
    );
  }
}
