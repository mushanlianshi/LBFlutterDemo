import 'package:dio/dio.dart';
import 'package:lb_flutter_project/module/bean/common_resp.dart';
import 'package:lb_flutter_project/module/bean/lb_test_entity.dart';
import 'package:lb_flutter_project/net/http.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';



// 1.声明他的注解生成文件 rest_client.g.dart  会自动创建生成rest_client.g.dart文件
// 2.每次修改过这个文件都执行下  flutter pub run build_runner build 重新生成.g.dart文件
part 'rest_client.g.dart';

@RestApi(baseUrl: Http.defaultBaseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


  @POST('App401/Index/getSubwayAndAreaList')
  @FormUrlEncoded()
  Future<CommonResp<Map<String, dynamic>>> getSubwayAndAreaList(
      @Body() Map<String, dynamic> params);

  // 登录-获取滑块验证码 url
  @POST('App404/Index/getVerifyUrl')
  Future<CommonResp<LbTestResult>> getVerifyUrl();

  // 登录-请求发送短信验证码
  @POST('user/captcha/wanjianhaofang/send/smsCode')
  Future<CommonResp<String>> sendSmsCode(@Body() Map<String, dynamic> params);

  // 登录-获取滑块验证码 url
  // @POST('App404/Index/getMainWebUrl')
  // Future<CommonResp<LbTestResult>> getMainWebUrl();

  // // 登录-请求发送短信验证码
  // @POST('user/wanjianhaofang/login')
  // Future<CommonResp<UserInfoResp?>> login(@Body() Map<String, dynamic> params);
  //
  // @POST('App404/House/getLocation')
  // @FormUrlEncoded()
  // Future<CommonResp<LocationResp>> getLocation(
  //     @Body() Map<String, dynamic> params,
  //     {@CancelRequest() CancelToken? cancelToken});
  //
  // ///搜索
  // @POST('App404/House/smartSearch')
  // @FormUrlEncoded()
  // Future<CommonResp<SearchRespEntity>> getSearchResult(
  //     @Body() Map<String, dynamic> params);
  //
  // ///房源列表
  // @POST('App404/House/houseList')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseListRespEntity>> getHouseList(
  //     @Body() Map<String, dynamic> params);
  //
  // ///首页
  // @POST('App404/Index/indexMain')
  // @FormUrlEncoded()
  // Future<CommonResp<HomeRespEntity>> getHomeData(
  //     @Body() Map<String, dynamic> params);
  //
  // ///获取添加企微信息
  // @POST('App404/User/userWorkWxInfo')
  // @FormUrlEncoded()
  // Future<CommonResp<HomeWechatServiceRespEntity>> getWorkWxInfo(
  //     @Body() Map<String, dynamic> params);
  //
  // @POST('App404/User/registerUser')
  // // @POST('https://m.baletu.com/Onlinelookhouseapi/HouseList')
  // Future<CommonResp<ImTokenRespEntity>> getIMToken();
  //
  // ///获取用户信息列表
  // @POST('App404/User/getInfoByUserImIds')
  // @FormUrlEncoded()
  // Future<CommonResp<ImUserListRespEntity>> getIMUserList(
  //     @Body() Map<String, dynamic> params);
  //
  // ///我的信息
  // @POST('App404/User/getOnlineHome')
  // @FormUrlEncoded()
  // Future<CommonResp<MineInfoRespEntity>> getMineInfo(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 提交公司地址
  // @POST('App404/User/updateInfo')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> getUpdateUserLocation(
  //     @Body() Map<String, dynamic> params);
  //
  // ///我的-收藏列表
  // @POST('App404/House/collectList')
  // @FormUrlEncoded()
  // Future<CommonResp<CommomHouseListRespEntity>> getCollectList(
  //     @Body() Map<String, dynamic> params);
  //
  // ///我的-浏览的房源
  // @POST('App404/House/openList')
  // @FormUrlEncoded()
  // Future<CommonResp<CommomHouseListRespEntity>> getOpenList(
  //     @Body() Map<String, dynamic> params);
  //
  // ///城市列表配置文件
  // // @GET('https://blt-test-1253618833.cos.ap-shanghai.myqcloud.com/Uploads/wanjianhaofang_config/wanjianhaofang_city_list.json')
  // // Future<CommonResp<Map<String, dynamic>>> getCityList(@Header('If-Modified-Since') String modifiedTime);
  //
  // ///房源详情问题弹窗信息
  // @POST('App404/House/houseProblem')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseDetailQuestionAlertEntity>> getHouseDetailQuestionData(
  //     @Body() Map<String, dynamic> params);
  //
  // ///提交房源详情问题弹窗信息
  // @POST('App404/House/renterProblemSubmit')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> getSubmitHouseDetailQuestion(
  //     @Body() Map<String, dynamic> params);
  //
  // ///房源详情
  // @POST('App404/House/detail')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseDetailRespEntity>> getHouseDetail(
  //     @Body() Map<String, dynamic> params);
  //
  // ///搜藏/取消房源
  // @POST('App404/House/collect')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> collectHouse(
  //     @Body() Map<String, dynamic> params);
  //
  // ///公司地址信息
  // @POST('App404/User/commuteInfo')
  // @FormUrlEncoded()
  // Future<CommonResp<CompanyInfoRespEntity>> getCompanyInfo(
  //     @Body() Map<String, dynamic> params);
  //
  // ///同小区房源
  // @POST('App404/House/getSubHouse')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseListRespEntity>> getSubHouse(
  //     @Body() Map<String, dynamic> params);
  //
  // ///同小区房源
  // @POST('App404/House/getOtherRoomList')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseListRespEntity>> getOtherRoomList(
  //     @Field("house_id") String houseId);
  //
  // ///附近三公里
  // @POST('App404/House/getNearHouse')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseDetailNearyHouseRespEntity>> getNearHouse(
  //     @Body() Map<String, dynamic> params);
  //
  // ///同小区房源
  // @POST('App404/House/houseProblemAnswer')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseDetailAnswerRespEntity>> houseProblemAnswer(
  //     @Body() Map<String, dynamic> params);
  //
  // ///同小区房源
  // @GET('http://192.168.61.30:8080/queryVerifyCode')
  // Future<String?> queryVerifyCodeLocal(@Query("mobile") String mobile);
  //
  // ///房源详情咨询的
  // @POST('App404/House/getServiceUser')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseDetailServicerRespEntity>> getServiceUser(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 自动发送消息
  // @POST('App404/House/autoSendMsg')
  // @FormUrlEncoded()
  // Future<CommonResp<String>> autoSendMsg(@Body() Map<String, dynamic> params);
  //
  // /// 房源详情获取行程信息
  // @POST('App404/House/getNearestDemand')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseDemandRespEntity>> getNearestDemand(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 房源详情加入行程的
  // @POST('App404/House/userTripAddHouse')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> userTripAddHouse(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 联系房东
  // @POST('App404/House/connectLandlord')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> connectLandlord(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 首页房源上新的
  // @POST('App404/Index/getAreaHouseList')
  // @FormUrlEncoded()
  // Future<CommonResp<HouseListUpdateRespEntity>> houseUpdateList(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 订制找房 房源标签配置等
  // @POST('App404/Index/findHouseLabel')
  // @FormUrlEncoded()
  // Future<CommonResp<CustomFindHouseInfoRespEntity>> findHouseInfo(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 订制找房详情的
  // @POST('App404/Index/renterDemandDetail')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> findHouseDetail(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 提交订制找房的
  // @POST('App404/Index/findHouseDemand')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> submitFindHouse(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 微信直签，获取是否添加状态的
  // @POST('App404/Index/checkWorkWxRelation')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> applyWechatState(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 微信直签，申请添加的
  // @POST('App404/Index/replyWorkWxRelation')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> applyAddWechat(
  //     @Body() Map<String, dynamic> params);
  //
  // /// 微信直签，banner
  // @POST('App404/Index/wxBannersList')
  // @FormUrlEncoded()
  // Future<CommonResp<Map<String, dynamic>>> addWechatBanner(
  //     @Body() Map<String, dynamic> params);

}
