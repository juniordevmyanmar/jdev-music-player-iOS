//
//  Endpoint.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import Foundation
import Alamofire

enum BaseSite: Int {
    case local = 0
    
    var baseUrl: String {
        switch self {
        case .local: return "http://0.0.0.0:5000/"
        }
    }
}

struct EndpointConstant {
    static var baseSite: BaseSite {
        return .local
    }
}


public enum APIRouter: URLRequestConvertible {
    
    case login([String: Any])
    case register([String: Any])
    
    public func asURLRequest() throws -> URLRequest {
        let result: (path: String,
            query: [String: Any]?,
            method: String,
            authorization: Bool,
            body: [String: Any]?) = {
            switch self {
            case .login(let bodyParam):
                return ("login", nil, "POST", false, bodyParam)
            case .register(let bodyParam):
                return ("register", nil, "POST", false, bodyParam)
            }
        }()
        
        let urlComponents = NSURLComponents(string: EndpointConstant.baseSite.baseUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        
        if urlComponents?.queryItems == nil {
            urlComponents!.queryItems = []
        }
        
        result.query?.forEach({ (key, value) in
            urlComponents!.queryItems!.append(contentsOf: [URLQueryItem(name: key, value: "\(value)")])
            
        })
        
        let url = urlComponents!.url!
        var urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
        
        urlRequest.httpMethod = result.method
        if let _ = result.body {
            do {
                
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: result.body!, options: [])
            } catch let error as NSError {
                print(error)
                urlRequest.httpBody = nil
            }
        }
        
//        if result.authorization {
//            let token: String = DataStore.shared.token
//            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        }
//
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
//        urlRequest.setValue("0", forHTTPHeaderField: "X-RESPONSE-ENCRYPTED")
        
        return try URLEncoding.default.encode(urlRequest, with: nil)
    }
}
