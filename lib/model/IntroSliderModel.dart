import 'package:flutter/material.dart';


class IntroSliderModel{

  String imageAssetPath;
  String title;
  String desc;

  IntroSliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}


List<IntroSliderModel> getSlides(){

  List<IntroSliderModel> slides = new List<IntroSliderModel>();
  IntroSliderModel sliderModel = new IntroSliderModel();

  //1
  sliderModel.setDesc("Injoy your courtship period with adventure and romance.");
  sliderModel.setTitle("Courtship With Virtual Partner");
  sliderModel.setImageAssetPath("assets/intro_icon1.png");
  slides.add(sliderModel);

  sliderModel = new IntroSliderModel();

  //2
  sliderModel.setDesc("Please search the virtual parter for chating and dating and you can injoy as a virtual marriage.");
  sliderModel.setTitle("Chat With Virtual Partner");
  sliderModel.setImageAssetPath("assets/intro_icon2.png");
  slides.add(sliderModel);

  sliderModel = new IntroSliderModel();

  //3
  sliderModel.setDesc("You can find the virtual partner and you can injoy your momement with virtual partener.");
  sliderModel.setTitle("Call With Virtual Partner");
  sliderModel.setImageAssetPath("assets/intro_icon3.png");
  slides.add(sliderModel);

  sliderModel = new IntroSliderModel();

  return slides;
}