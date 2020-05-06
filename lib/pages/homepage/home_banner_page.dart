import 'package:bx_app/model/home/homecontent_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerPage extends StatefulWidget {
  final HomeContentData contentData;
  HomeBannerPage(this.contentData, {Key key}) : super(key: key);

  @override
  _HomeBannerPageState createState() => _HomeBannerPageState();
}

class _HomeBannerPageState extends State<HomeBannerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(333),
        width: ScreenUtil().setWidth(750),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network("${widget.contentData.slides[index].image}",
                fit: BoxFit.fill);
          },
          itemCount: widget.contentData.slides.length,
          pagination: new SwiperPagination(),
          autoplay: true,
        ));
  }
}
