//
//  ZXRequest.swift
//  ZXRequest
//
//  Created by zhaoxin on 2017/10/18.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import UIKit
import Moya

struct ZXRequest {
    
    static let zxProvider = MoyaProvider<ZXEnum>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])
    
    static func request(_ target: ZXEnum,
                        success successCallback:@escaping (Any?)->Void,
                        error errorCallback:@escaping (Int, String)->Void) {
        zxProvider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    try response.filterSuccessfulStatusCodes()

                    // responseData为json类型
                    let responseData = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers)
                    if response.statusCode == 200
                    {
                        successCallback(responseData)

                    }else
                    {
                        errorCallback(-1, "请求失败，请稍后再试。。。")
                    }
                    

                }
                catch let error {
                    // 如果数据获取失败，则返回错误状态码
                    print("ZXRequest error : \(error)")
                    errorCallback(-1, "请求失败，请稍后再试。。。")
                }
            case let .failure(error):
                // 如果连接异常，则返回错误信息
                print("ZXRequest failure : \(error)")
                errorCallback(-1, "请求失败，请稍后再试。。。")
            }
        }
    }
    
    
    private static func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }
}
