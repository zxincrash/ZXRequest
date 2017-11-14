//
//  ZXRequestParam.swift
//  ZXRequest
//
//  Created by zhaoxin on 2017/10/20.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import Foundation

class ZXRequestParam: ZXHandyJSON {
    var sign: String?
    var requestHead: String?
    var requestBody: String?
    
    func convertDictionary() -> [String: String] {
        var dic = [String: String]()
        if let sign = self.sign {
            dic["sign"] = sign
        }
        if let requestHead = self.requestHead {
            dic["requestHead"] = requestHead
        }
        if let requestBody = self.requestBody {
            dic["requestBody"] = requestBody
        }
        return dic
    }
}
