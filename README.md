# ZXRequest
swift网络请求封装

ZXRequest是基于Moya网络请求的应用示例。
1.对请求参数（包括请求头和请求体）进行封装处理，使用时只需要设置对应参数即可；
2.返回数据统一在ZXBaseModel中处理

#请求接口示例（可以复制到浏览器中直接查看）：
https://suggest.taobao.com/sug?q=abcdefgh
#返回的数据结构
```swift
	{
	"result" : [
			[
			"abcdefghijklmnop",
			"5"
			],
			[
			"abcdefghi",
			"73"
			]
	]
	}

#应用示例
```swift 
let success:(Any?)->Void = { data in
guard data != nil else {
   print("data is nil")
   return
   }
   self.goodsArray = ZXBaseModel.goodsModelWithData(data: data)
   
   ZXRequest.request(.query(q:goodName), success: success, error: { errorCode, errorMessage in
         print("\(errorCode) : \(errorMessage)")
         self.view.makeToast("\(errorMessage)")
   })


#返回数据示例
```swift
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
