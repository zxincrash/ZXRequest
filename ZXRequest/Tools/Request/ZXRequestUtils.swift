//
//  ZXRequestUtils.swift
//  ZXRequest
//
//  Created by Biocome on 2017/10/20.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import Foundation

class ZXRequestUtils {

    static func getRequestParams<T: ZXHandyJSON>(requestBody: T?) -> [String: String] {
        
        let params = ZXRequestParam()
        params.requestHead = getRequestHead().toJSONString()
        params.requestBody = requestBody?.toJSONString()
        
        return params.convertDictionary()
    }

    static func getRequestHead() -> ZXRequestHead {
        let reqHead = ZXRequestHead()

        reqHead.appID = ZXConstants.APP_ID
        reqHead.loginID = ZXConstants.LOGIN_ID
        reqHead.lanCode = ZXConstants.LAN_CODE
        reqHead.osVersion = ZXConstants.OS_VERSION
        reqHead.softwareVersion = ZXConstants.SOFTWARE_VERSION

        return reqHead
    }
    
    struct ZXConstants {
        /// 合法访问的凭证
        static let APP_ID = "adsddasdasdasdadaad"
        static var LOGIN_ID = 1
        /// 系统版本
        static let OS_VERSION = 2
        /// 软件版本号
        static let SOFTWARE_VERSION = "1.0.0"
        /// 语言编码
        static let LAN_CODE = "zh-cn"
    }
}
