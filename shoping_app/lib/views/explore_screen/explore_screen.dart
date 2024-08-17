import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoping_app/views/shop_screen/shop_sceen.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:shoping_app/const/app_color.dart';
import 'package:shoping_app/const/app_image.dart';
import 'package:shoping_app/const/app_string.dart';
import 'package:shoping_app/widgets/app_size.dart';
import 'package:shoping_app/widgets/text_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<int> selectedRatings = List<int>.generate(10, (index) => 5);
  final ImagePicker _picker = ImagePicker();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _showSearchBar = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
   build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              border: Border.all(color: AppColors.black),
            ),
            child: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0,
              title: _showSearchBar
                  ? _buildSearchBar()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(
                          data: AppString.explores,
                        ),
                        _icons(),
                      ],
                    ),
              iconTheme: const IconThemeData(color: AppColors.black),
            ),
          ),
        ),
        body: _gridView(),
      ),
    );
  }

   _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              _showSearchBar = false;
              _searchController.clear();
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.mic),
          onPressed: _startListening,
        ),
      ],
    );
  }

   _icons() {
    return Row(
      children: [
        SizedBoxWidget(width: 10.w),
        IconButton(
          icon: const Icon(Icons.search_rounded, color: AppColors.black),
          onPressed: () {
            setState(() {
              _showSearchBar = true;
            });
          },
        ),
        SizedBoxWidget(width: 5.w),
        IconButton(
          icon: const Icon(Icons.settings_voice, color: AppColors.black),
          onPressed: () {
            if (!_showSearchBar) {
              setState(() {
                _showSearchBar = true;
              });
            }
            _startListening();
          },
        ),
        SizedBoxWidget(width: 5.w),
        IconButton(
          icon: const Icon(Icons.camera_alt, color: AppColors.black),
          onPressed: _openCamera,
        ),
        SizedBoxWidget(width: 5.w),
        IconButton(
          icon: const Icon(Icons.shopping_cart_checkout_outlined,
              color: AppColors.black),
          onPressed: () {
            // Handle cart navigation
          },
        ),
      ],
    );
  }

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print("Image picked: ${image.path}");
    }
  }

  void _startListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() {
          _isListening = true;
          if (!_showSearchBar) {
            _showSearchBar = true;
          }
        });
        _speech.listen(
          onResult: (val) {
            setState(() {
              _searchController.text = val.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

   _gridView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.65,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopScreen(
                    itemName: 'Item $index', // Pass relevant data here
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      AppImages.sadi,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120.h,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          data: 'KRIVITY',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          data: 'Embroidered Bollywood cotton',
                          fontSize: 11.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹1,999',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.5,
                              ),
                            ),
                            TextWidget(
                              data: '₹499',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget(
                              data: '38% Off',
                              fontSize: 10.sp,
                              color: Colors.green,
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: List.generate(5, (starIndex) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: Icon(
                                    starIndex < selectedRatings[index]
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: AppColors.green,
                                    size: 14.h,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
