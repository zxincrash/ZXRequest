//
//  ZXApi.swift
//  ZXRequest
//
//  Created by zhaoxin on 2017/10/19.
//  Copyright © 2017年 zhaoxin. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider support
private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

// MARK: - 请求分类
public enum ZXEnum {
    case query(q: String)

}

// MARK：- 请求配置
extension ZXEnum: TargetType {
    /// 服务器地址
    public var baseURL: URL { return URL(string: "https://suggest.taobao.com")! }
    
    /// 各个请求的具体路径
    public var path: String {
        switch self {
        case .query:
            return "/sug"
        
        }
    }
    
    /// 设置请求方式
    public var method: Moya.Method {
        switch self {
        case .query:
            return .get
        default:
            return .post
        }
    }
    
    /// 请求任务事件
    public var task: Task {
        switch self {
        case let .query(queryContent):
        return .requestCompositeParameters(bodyParameters: ["q":queryContent], bodyEncoding: JSONEncoding.default, urlParameters: ["q":queryContent])

//            return .requestParameters(
//                parameters: ["q":queryContent],
//                encoding: JSONEncoding.default)

        default:
            return .requestPlain
        }
    }
    
    /// 是否执行Alamofire验证
    public var validate: Bool {
        return true
    }
    
    /// 模拟测试数据只有在测试时有效
    public var sampleData: Data {
        switch self {
        case .query(_):
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        default:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        }
    }
    
    /// 请求头参数
    public var headers: [String: String]? {
        var requestHeaders = ["Cache-Control":"no-cache"]
        switch self {
        case .query:
            return [
                "X-Requested-With":"XMLHttpRequest",
                "Content-Type":"application/x-www-form-urlencoded",
                "Cache-Control":"no-cache"
            ]
        default:
            return requestHeaders
        }
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers
extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}
