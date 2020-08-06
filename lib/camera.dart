

import 'dart:io';

import 'package:adv_camera/adv_camera.dart';
import 'package:flutter/material.dart';

class CameraApp extends StatefulWidget {
  final String id;

  const CameraApp({Key key, this.id}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}






class _CameraAppState extends State<CameraApp> {
  List<String> pictureSizes = [];
  String imagePath;
bool flag1 =false;
bool flag2 =false;
bool flag3 =false;
bool flag4 =false;

bool issettingEnable =false;


@override
  void dispose() {
    
    super.dispose();
    cameraController.turnOffCamera();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
          // alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
        
            
        
                Expanded(
                                    child:
                                    
                                     Container(
                                      child: Stack(
                                        children: <Widget>[
                                              AdvCamera(
                                                    onCameraCreated: _onCameraCreated,
                                                    onImageCaptured: (String path) {
                                                          print("onImageCaptured => " + path);
                                                          if (this.mounted)
                                                            setState(() {
                                                              imagePath = path;
                                                            });
                                                    },
                                                    cameraPreviewRatio: CameraPreviewRatio.r16_9,
                                                  ),

                                                  Padding(
                                                    padding:  EdgeInsets.only(top: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                              GestureDetector(
                                                                onTap: (){
                                                                  if(flag1)
                                                                  {
                                                                      cameraController.setFlashType(FlashType.off);
                                                                      flag1 =false;
                                                                  }
                                                                  else
                                                                  {     cameraController.setFlashType(FlashType.auto);
                                                                        flag1 =true;
                                                                        flag2 =false;
                                                                        flag3 =false;
                                                                        flag4 =false;
                                                                  }
                                                                        setState(() {});                                                                
                                                                        },
                                                                                                                              child: CircleAvatar(
                                                                 backgroundColor:flag1 ? Colors.black.withOpacity(0.2) :Colors.black.withOpacity(0.06),
                                                                  child: Text('Auto',style: TextStyle(fontSize: 11.5,color:flag1 ? Colors.yellow : Colors.white),),
                                                                  maxRadius: 25,
                                                                ),
                                                              ),

                                                              
                                                              GestureDetector(
                                                                 onTap: (){
                                                                  if(flag2)
                                                                  {
                                                                       cameraController.setFlashType(FlashType.off);
                                                                      flag2 =false;
                                                                  }
                                                                  else
                                                                  {
                                                                        cameraController.setFlashType(FlashType.on);
                                                                        flag2 =true;
                                                                        flag1 =false;
                                                                        flag3 =false;
                                                                        flag4 =false;
                                                                  }
                                                                  setState(() {});    
                                                                },
                                                                                                                              child: CircleAvatar(
                                                                  backgroundColor:flag2 ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.06),
                                                                  child: Text('On',style: TextStyle(fontSize: 11.5,color:flag2 ? Colors.yellow : Colors.white),),
                                                                  maxRadius: 25,
                                                                ),
                                                              ),

                                                            GestureDetector(
                                                               onTap: (){
                                                                  if(flag3)
                                                                  {
                                                                      cameraController.setFlashType(FlashType.on);
                                                                      flag3 =false;
                                                                  }
                                                                  else
                                                                  {
                                                                        cameraController.setFlashType(FlashType.off);
                                                                        flag3 =true;
                                                                        flag2 =false;
                                                                        flag1 =false;
                                                                        flag4 =false;
                                                                  }
                                                                  setState(() {});    
                                                                },
                                                          child: CircleAvatar(
                                                                                                                        backgroundColor:flag3 ? Colors.black.withOpacity(0.2) :Colors.black.withOpacity(0.06),
                                                                  child: Text('Off',style: TextStyle(fontSize: 11.5,color:flag3 ? Colors.yellow : Colors.white),),
                                                                  maxRadius: 25,
                                                                ),
                                                              ),


                                                              GestureDetector(
                                                                                  onTap: (){
                                                                  if(flag4)
                                                                  {
                                                                      cameraController.setFlashType(FlashType.off);
                                                                      flag4 =false;
                                                                  }
                                                                  else
                                                                  { 
                                                                        cameraController.setFlashType(FlashType.torch);
                                                                        flag4 =true;
                                                                        flag2 =false;
                                                                        flag3 =false;
                                                                        flag1 =false;
                                                                  }
                                                                  setState(() {});    
                                                                },
                                                                child: CircleAvatar(
                                                                                                                        backgroundColor:flag4? Colors.black.withOpacity(0.2) :Colors.black.withOpacity(0.06),
                                                                  child: Text('Torch',style: TextStyle(fontSize: 11.5,color:flag4 ? Colors.yellow : Colors.white),),
                                                                  maxRadius: 25,
                                                                ),
                                                              ),
                                                                 GestureDetector(
                                                                   onTap: (){
                                                                     Navigator.pop(context);
                                                                   },
                                                                                                                                    child: CircleAvatar(
                                                                backgroundColor: Colors.black.withOpacity(0.06),
                                                                child: Icon(Icons.close,color: Colors.white,),
                                                                maxRadius: 25,
                                                              ),
                                                                 ),
                                                      ],
                                                    ),
                                                  ),

                                                  Align(alignment: Alignment.bottomCenter,
                                                  child: Padding(
                                                    padding:  EdgeInsets.all(14),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: GestureDetector(
                                                            onTap: (){
                                                               if(issettingEnable)
                                                               {

                                                                 issettingEnable = false;
                                                                 setState(() {});
                                                               }
                                                               else
                                                               {
                                                                 issettingEnable = true;
                                                                 setState(() {});
                                                               }
                                                            },
                                                            child: CircleAvatar(
                                                                                                                        backgroundColor:Colors.black.withOpacity(0.15),
                                                                  child: Icon(Icons.settings,color:issettingEnable ? Colors.yellow : Colors.white,),
                                                                  maxRadius: 25,
                                                                ),
    
                                                          ),
                                                                                                                ),
                                                        Align(
                                                          alignment: Alignment.bottomCenter,
                                                          child: GestureDetector(
                                                            onTap: (){
                                                              cameraController.captureImage();
                                                            },
                                                                                                                      child: Container(
                    height: 60,
                    width: 60,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.white),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black.withOpacity(0.2),width: 2),
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                                                          ),
                                                        ),


                                                         Align(
                                                          alignment: Alignment.bottomRight,
                                                          child: GestureDetector(
                                                            onTap: (){
                                                               cameraController.switchCamera();
                                                            },
                                                            child: CircleAvatar(
                                                                                                                        backgroundColor:Colors.black.withOpacity(0.15),
                                                                  child: Icon(Icons.switch_camera,color: Colors.white,),
                                                                  maxRadius: 25,
                                                                ),
    
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  )
                                        ],
                                      )
                                      
                                      
                                    ))
              
              ],
            ),
        issettingEnable ?  Align(
            alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 120,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 100,left: 20,right: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  
                  ratioOfphoto(),
                  picturesize(),

                ],
              ),
            ),
          ) : SizedBox(),
imagePath != null && imagePath !='' ?GestureDetector(
  onTap: (){
    Navigator.pop(context);
  },
  child:   Align(
              alignment: Alignment.bottomLeft,
                        child: Container(
                          
                          height: 120,
                          width: 85,
                padding: EdgeInsets.all(1.5),
                margin: EdgeInsets.only(bottom: 100,left: 20,right: 20),
                decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.2)),  
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ClipRRect(
                  
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(File(imagePath),fit: BoxFit.cover,)),
              ),
            ),
) : SizedBox()


          ],
        ),
      );
  }

  AdvCameraController cameraController;

  _onCameraCreated(AdvCameraController controller) {
    this.cameraController = controller;

    this.cameraController.getPictureSizes().then((pictureSizes) {
      setState(() {
        this.pictureSizes = pictureSizes;
      });
    });
  }
  ratioOfphoto()
  {
    return     SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    // color: Colors.orange,
                    child: Row(
                      children: [
                        FlatButton(
                          child: Text(Platform.isAndroid ? "1:1" : "Low"),
                          onPressed: () {
                            cameraController
                                .setPreviewRatio(CameraPreviewRatio.r1);
                            cameraController
                                .setSessionPreset(CameraSessionPreset.low);
                                issettingEnable =false;
                                setState(() {});
                          },
                        ),
                        FlatButton(
                          child: Text(Platform.isAndroid ? "4:3" : "Medium"),
                          onPressed: () {
                            cameraController
                                .setPreviewRatio(CameraPreviewRatio.r4_3);
                            cameraController
                                .setSessionPreset(CameraSessionPreset.medium);
                                  issettingEnable =false;
                                setState(() {});
                          },
                        ),
                        FlatButton(
                          child: Text(Platform.isAndroid ? "11:9" : "High"),
                          onPressed: () {
                            cameraController
                                .setPreviewRatio(CameraPreviewRatio.r11_9);
                            cameraController
                                .setSessionPreset(CameraSessionPreset.high);
                                  issettingEnable =false;
                                setState(() {});
                          },
                        ),
                        FlatButton(
                          child: Text(Platform.isAndroid ? "16:9" : "Best"),
                          onPressed: () {
                            cameraController
                                .setPreviewRatio(CameraPreviewRatio.r16_9);
                            cameraController
                                .setSessionPreset(CameraSessionPreset.photo);
                                  issettingEnable =false;
                                setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
  }
  picturesize()
  {
    return         Container(
                  // color: Colors.blue,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: this.pictureSizes.map((pictureSize) {
                        return FlatButton(
                          child: Text(pictureSize),
                          onPressed: () {
                            cameraController.setPictureSize(
                                int.tryParse(pictureSize.substring(
                                    0, pictureSize.indexOf(":"))),
                                int.tryParse(pictureSize.substring(
                                    pictureSize.indexOf(":") + 1,
                                    pictureSize.length)));
                                issettingEnable =false;
                                setState(() {});
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
  }
}