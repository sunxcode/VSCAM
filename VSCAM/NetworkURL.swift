

import UIKit

//MARK:- 接口地址
class NetworkURL {

    //MARK:- 基地址
    static let baseUrl = "http://vscam.co/x/"

    //MARK:- 接口地址
    //图片列表 - 首页 or 用户页
    static let imageList = "?a=h"
    //图片详细页
    static let imageDetail = "?a=p"
    //获取个人信息
    static let userInfoList = "?a=u&uid="

    //预览图微博基地址
    static let imageWBSmall = "http://ww2.sinaimg.cn/bmiddle/"
    //完整图微博基地址
    static let imageWBBig = "http://ww2.sinaimg.cn/large/"
    //备份预览图
    static let imageOriginSmall = "http://vscam.co/img/s/{origin}.jpg"
    //备份完整图
    static let imageOriginBig = "http://vscam.co/img/m/{origin}.jpg"
    //地图图片
    static let imageMap = "http://vscam.co/x/maps/{gps}%7C11%7C800*300.png"
    //Web详情页地址
    static let imageDetailPage = "http://vscam.co/#!g/{pid}"
    //头像
    static let avatarSmall = "http://vscam.co/avatar/s/{avatar}.jpg"
    static let avatarBig = "http://vscam.co/avatar/b/{avatar}.jpg"
    //个人页面地址
    static let userDetailPage = "http://vscam.co/#!u/{name}"

    //MARK:- 其他
    //AppStore
    static let appStore = "https://itunes.apple.com/cn/app/VSCAM/id1163589746?mt=8"
}

