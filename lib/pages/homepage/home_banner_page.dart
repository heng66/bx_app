import 'package:bx_app/model/home/homecontent_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';
import '../../provide/homecontent_provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerPage extends StatefulWidget {
  HomeBannerPage({Key key}) : super(key: key);

  @override
  _HomeBannerPageState createState() => _HomeBannerPageState();
}

class _HomeBannerPageState extends State<HomeBannerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Provide<HomeContentProvide>(
        builder: (BuildContext context, Widget child,
            HomeContentProvide contentProvide) {
          if (contentProvide.contentModel != null) {
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                    "${contentProvide.contentModel.data.slides[index].image}",
                    fit: BoxFit.fill);
              },
              itemCount: contentProvide.contentModel.data.slides.length,
              pagination: new SwiperPagination(),
              autoplay: true,
            );
          } else {
            return Text('...');
          }
        },
      ),
    );
  }
}
