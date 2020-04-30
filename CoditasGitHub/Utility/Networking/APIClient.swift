//
//  APIClient.swift
//  CoditasGitHub
//
//  Created by Apple on 30/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

class APIClient {
    
    class func getData(apiName: String, headers: HTTPHeaders?, completionHandler: @escaping ((_ isSuccess:Bool, _ response: Any?) -> Void)) {
        
        DispatchQueue.global().async {
            
            print("API name = \(apiName)")
            guard let url = URL.init(string: apiName) else {
                return completionHandler(false, Constant.INVALID_URL + apiName)
            }
            
            if Connectivity.isConnectedToInternet() {
                                
                AF.request(url, method: .get, parameters: nil, headers: headers).validate().responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        print("API response = \(value)")
                        completionHandler(true, value)
                    case .failure(let error):
                        print("API error " + error.localizedDescription)
                        completionHandler(false, Constant.SOMETHING_WENT_WRONG)
                    }
                }

            } else {
                completionHandler(false, Constant.NO_INTERNET)
            }
        }
        
    }
    
    class func postData(apiName: String, parameters: [String: Any], headers: HTTPHeaders?, completionHandler: @escaping ((_ isSuccess:Bool, _ response: Any?) -> Void)) {
        
        DispatchQueue.global().async {
            print("API name = \(apiName)")
            print("Parameters = \(parameters)")
            guard let url = URL.init(string: apiName) else {
                return completionHandler(false, Constant.INVALID_URL + apiName)
            }
            
            if Connectivity.isConnectedToInternet() {
                
                AF.request(url, method: .post, parameters: parameters, headers: headers).validate().responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        print("API response = \(value)")
                        completionHandler(true, value)
                    case .failure(let error):
                        print("API error " + error.localizedDescription)
                        completionHandler(false, Constant.SOMETHING_WENT_WRONG)
                    }
                }
                
            } else {
                completionHandler(false, Constant.NO_INTERNET)
            }
        }
    }
    
}
