import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_string.dart';

import 'package:shoping_app/widgets/custom_Bottom_NavigationBar.dart';
import 'package:shoping_app/widgets/text-field_widget.dart';
import 'package:shoping_app/widgets/text_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.groupId,
   
  });
  final int? groupId;


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchProductsController = TextEditingController();
  bool _isSwitched = false;
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Press the mic to start speaking...';
  final TextEditingController _searchController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  final List<String> imgList = [
    "assets/bag.jpg",
    "assets/online.jfif",
    "assets/watch.jfif",
  ];

  final List<Map<String, String>> imgListWithText = [
    {
      'image': 'assets/scan.png',
      'text': "Scan & pay  ",
    },
    {
      'image': 'assets/fastion.jfif',
      'text': "Women's \n Fashion",
    },
    {
      'image': 'assets/men.jfif',
      'text': "Men's \n Fashion",
    },
    {
      'image': 'assets/beuty.jfif',
      'text': 'Beauty',
    },
    {
      'image': 'assets/elec.jfif',
      'text': 'Electric',
    },
    {
      'image': 'assets/kids.jfif',
      'text': "Kid's Fashion",
    },
  ];

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the picked image
    }
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('onStatus: $status'),
        onError: (error) => print('onError: $error'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) {
            setState(() {
              _text = val.recognizedWords;
              _searchController.text = _text; // Update search bar with recognized text
            });
          },
        );
      }
    }
  }

  void _stopListening() {
    setState(() => _isListening = false);
    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildCarouselSlider(imgList, 150.h, 1.0, true),
            SizedBox(height: 5.h),
            _buildIconCarouselSlider(),
            SizedBox(height: 15.h),
            _buildBannerSection(),
            SizedBox(height: 15.h),
            _buildProductSection(),
            SizedBox(height: 18.h),
            _buildProductSection(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  _buildHeader() {
    return Row(
      children: [
        Image.asset("assets/shop.png", width: 55.w),
        SizedBox(width: 20.w),
        TextWidget(
          data: AppString.shoppingDay,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ],
    );
  }

  _buildSearchBar() {
    return Container(
      height: 57.h,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                data: AppString.brand,
                color: AppColors.white,
              ),
              SizedBox(height: 7.h),
              Container(
                height: 18.h,
                child: Switch(
                  value: _isSwitched,
                  onChanged: (value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                  activeColor: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 42.h,
                width: 240.w,
                child: TextFormFieldWidget(
                  onOutSideTap: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  hintText: AppString.SerachName,
                  color: Colors.white,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.mic, size: 30),
                        onPressed: _startListening,
                      ),
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined, size: 30),
                        onPressed: _pickImageFromCamera,
                      ),
                    ],
                  ),
                  controller: _searchProductsController,
                  onChanged: (String? value) {
                    // Handle search logic here if needed
                  },
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.r),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildCarouselSlider(List<String> images, double height,
      double viewportFraction, bool autoPlay) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: autoPlay,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: viewportFraction,
      ),
      items: images.map((item) {
        return Container(
          child: ClipRRect(
            child: Image.asset(
              item,
              fit: BoxFit.cover,
              height: 100.h,
              width: double.infinity,
            ),
          ),
        );
      }).toList(),
    );
  }

  _buildIconCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 85.h,
        autoPlay: false,
        aspectRatio: 16 / 9,
        viewportFraction: 0.21,
      ),
      items: imgListWithText.map((item) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
              ),
              height: 50.h,
              width: 50.h,
            ),
            TextWidget(
              data: item['text']!,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        );
      }).toList(),
    );
  }

  _buildBannerSection() {
    return Container(
      height: 130.h,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBannerItem("assets/Group.png", AppString.enjoyship),
            _buildBannerItem("assets/layer1.png", AppString.easyreturn),
            _buildBannerItem("assets/medal.png", AppString.rateproduct),
          ],
        ),
      ),
    );
  }

  _buildBannerItem(String imagePath, String text) {
    return Column(
      children: [
        Container(
          height: 80.h,
          width: 80.w,
          color: const Color.fromARGB(94, 214, 157, 148),
          child: Column(
            children: [
              CircleAvatar(
                radius: 38,
                backgroundImage: AssetImage(imagePath),
              ),
            ],
          ),
        ),
        TextWidget(
          data: text,
          color: AppColors.white,
        ),
      ],
    );
  }

  _buildProductSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildProductItem(
                "assets/rect1.png", AppString.mtshirts, AppString.speoffer),
            _buildProductItem(
                "assets/rect2.png", AppString.truewireless, AppString.speoffer),
            _buildProductItem(
                "assets/rect3.png", AppString.wtshirt, AppString.speoffer),
          ],
        ),
      ],
    );
  }

  _buildProductItem(String imagePath, String title, String offer) {
    return Container(
      height: 125.h,
      width: 93.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFF000000),
          width: 1.0,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                height: 70.h,
                width: 80.w,
              ),
            ],
          ),
          TextWidget(
            data: title,
            color: AppColors.black,
            fontSize: 12,
          ),
          TextWidget(
            data: offer,
            color: AppColors.green,
          ),
        ],
      ),
    );
  }
}
