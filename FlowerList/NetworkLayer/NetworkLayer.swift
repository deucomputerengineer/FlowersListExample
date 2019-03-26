//
//  NetworkLayer.swift
//  FlowerList
//
//  Created by Merve on 26.03.2019.
//  Copyright © 2019 Merve Sahan. All rights reserved.
//

import Foundation


typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void
typealias ErrorHandler = (String) -> Void

class NetworkLayer {
    
    static let genericError = "Tekrar deneyiniz."
    
    func get<T: Decodable>(urlString: String,
                           headers: [String: String] = [:],
                           successHandler: @escaping (T) -> Void,
                           errorHandler: @escaping ErrorHandler) {
        
        
   
        let completionHandler: NetworkCompletionHandler = { (data,response,error) in
            
            if let error = error {
                errorHandler(NetworkLayer.genericError)
                return
            }
            
            if let responseStatusCode = response as? HTTPURLResponse {
                let code = responseStatusCode.statusCode
                
                if self.isSuccessCode(code){
                    guard let data = data else {
                        return errorHandler(NetworkLayer.genericError)
                    }
                    if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                        successHandler(responseObject)
                        return
                    }
                }
            }
            errorHandler(NetworkLayer.genericError)
        }
        
        guard let url = URL(string: urlString) else {
            return errorHandler("Yanlış url")
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: (completionHandler))
        
        task.resume()
        
    }
    
    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
    
    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccessCode(urlResponse.statusCode)
    }
    
    
    
}
