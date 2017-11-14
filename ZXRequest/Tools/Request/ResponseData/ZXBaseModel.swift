//
//  ZXBaseModel.swift
//  ZXRequest
//
//  Created by zhaoxin on 2017/11/14.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import UIKit

class ZXBaseModel:NSObject {
    
    
    /// 解析数据
    ///
    /// - Parameter data: 网络返回的数据
    /// - Returns:处理后的商品的数组
    ///网络返回数据的结构
    //    {
    //        "result" : [
    //            [
    //            "abcdefghijklmnop",
    //            "5"
    //            ],
    //            [
    //            "abcdefghi",
    //            "73"
    //            ]
    //        ]
    //    }
    class func goodsModelWithData(data:Any) -> Array<ZXGoodsModel> {
        var dataArray:Array<ZXGoodsModel> = Array()
        
        if data is Dictionary<String, Array<Any>>
        {
            let dic = data as! Dictionary<String, Array<Any>>
            if dic["result"] != nil
            {
                let goodsArray:Array<Any> = (dic["result"])!
                for (index,_) in goodsArray.enumerated()
                {
                    let model: ZXGoodsModel = ZXGoodsModel()
                    let goods =  goodsArray[index] as! Array<Any>

                    for (_,_) in goods.enumerated()
                    {
                        model.goodsName = goods.first as! String
                        model.goodsCode = goods.last as! String
                    }
                    dataArray.append(model)

                }
                
            }
        }
        
        return dataArray
    }
}
