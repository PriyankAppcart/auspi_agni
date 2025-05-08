import 'package:auspi_agni_flutter/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class PhotosViewPage extends StatelessWidget {

  var imgList;
  PhotosViewPage(imgList){
    this.imgList = imgList;
  }
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: Colors.white,
              height: 100 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,

              child: PhotoViewGallery.builder(
                scrollPhysics:  BouncingScrollPhysics(),
                backgroundDecoration:BoxDecoration(color: Colors.white),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: AssetImage(imgList[index]),
                    initialScale: PhotoViewComputedScale.contained * 0.8,
                    heroAttributes: PhotoViewHeroAttributes(tag: imgList[index]),

                  );
                },
                itemCount: imgList.length,
                loadingBuilder: (context, event) => Center(
                  child: Container(
                    color: Colors.white,
                    width: 90,
                    height: 90.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5 * SizeConfig.widthMultiplier,
                      backgroundColor:Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF29b1ef)),
                      // semanticsLabel: "Downloading file abc.mp3",
                      // semanticsValue: "Percent " + (100).toString() + "%",
                      value: event == null
                          ? 0
                          : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                    ),
                  ),
                ),
              )
          ),
          Padding(
            padding:  EdgeInsets.only(top: 90 * SizeConfig.heightMultiplier),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:Color(0xFF29b1ef), // border color
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('Back',
                            style: TextStyle(
                              color:  Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 1.8 * SizeConfig.textMultiplier,fontFamily: 'Abel',)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }


}

