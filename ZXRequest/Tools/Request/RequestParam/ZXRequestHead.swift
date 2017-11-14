//
//  ZXRequestHead.swift
//  ZXRequest
//
//  Created by Biocome on 2017/10/23.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import Foundation

class ZXRequestHead: ZXHandyJSON {
    /**
     * APP_ID(访问权限)
     */
    var appID: String? = nil
    /**
     * 登录用户ID(账户Id)
     */
    var loginID: Int = 0
    /**
     * 语言编码
     */
    var lanCode: String? = nil
    /**
     * 操作系统类型 1-Android 或 2-IOS
     */
    var osVersion: Int = 2
    /**
     * 软件版本 2.0.1
     */
    var softwareVersion: String? = nil
}
