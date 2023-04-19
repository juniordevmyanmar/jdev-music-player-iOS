//
//  NetworkManager.swift
//  MusicPlayerJuniorDeviOS
//
//  Created by Alvin  on 25/03/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

public class NetworkManager {
    
    static let shared = NetworkManager()
    
    // Create a dispatch group
    let group = DispatchGroup()
    
    private init() { }
    
    func call<D: Codable>(_ routers: APIRouter...,
                          dataType: D.Type,
                          completion: @escaping (Result<D, ErrorResponse>) -> Void) {
        var result = [(Result<D, ErrorResponse>)]()
        do {
            try routers.forEach { router in
                var req = try router.asURLRequest()
                req.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
                req.timeoutInterval = 20
                
                group.enter()
                AF.request(req).validate(statusCode: 200..<300).responseDecodable(of: D.self) { (response) in
                    let json = JSON(response.data)
                    print("Request: \(String(describing: response.request?.url ?? URL(string: "")))\n JSON Response: \(json)")
                    switch response.result {
                    case .success(let res):
                        self.group.leave()
                        result.append(.success(res))
                        //                        completion(.success(res))
                    case .failure(let error):
                        print(error.localizedDescription)
                        self.group.leave()
                        let errorModel = ErrorResponse()
                        errorModel.error = error
                        errorModel.message = json.dictionary?["message"]?.string ?? ""
                        errorModel.errorData = json.dictionary?["data"]?.dictionaryObject ?? [:]
                        errorModel.statusCode = error.responseCode ?? 0
                        result.append(.failure(errorModel))
                        //                        completion(.failure(errorModel))
                    }
                }
            }
        } catch {
            completion(.failure(ErrorResponse()))
        }
        
        // Configure a completion callback
        group.notify(queue: .main) {
            // All requests completed
            completion(result.first ?? .failure(ErrorResponse()))
        }
    }
}
