//
//  DataManager.swift
//  Assignment
//
//  Created by Apple on 16/11/20.
//

import Foundation


final class DataManager {
   
    let sharedSession = URLSession.shared
    static let sharedInstance = DataManager()
    
    private init () {
    }
    
    //Create get url Request
    func CreateGetUrlRequest(_ url: String) -> NSMutableURLRequest{
        
        let urlString = url
        if let url = URL(string: urlString){
            let header = ["Content-Type": "application/json"]
            let urlRequest = NSMutableURLRequest(url: url as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 360)
            urlRequest.httpMethod = "Get"
            urlRequest.allHTTPHeaderFields = header
            return urlRequest
        }
        return NSMutableURLRequest()
    }
    
    //PRAGMAMARK:- Api used for getting News Data
    func getAllNewsList(_ serviceUrl: String, completion: @escaping (Int, [String: AnyObject]) -> ()){
        
        // Call CreateGettUrlRequest Function for creating Get request
        let urlRequest = CreateGetUrlRequest(serviceUrl)
        let task = sharedSession.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) in
            if error != nil{
                completion(900, ["": AnyObject.self as AnyObject])
            }else{
                let httpResponse = response as! HTTPURLResponse
                
                if let dataExist = data{
                    let responseData: Any?
                    do{
                        if httpResponse.statusCode == 200 {
                            
                            responseData = try JSONSerialization.jsonObject(with: dataExist, options: .allowFragments)
                           /* if let datastring = NSString(data: dataExist, encoding: String.Encoding.utf8.rawValue){
                                
                                completion(httpResponse.statusCode)
                            }*/
                            if let dictData = responseData as? [String : AnyObject] {
                                print(dictData)
                                
                                completion(200, dictData)
                            }
                        }
                    }catch{
                        responseData = nil
                        completion(200, ["": AnyObject.self as AnyObject])
                    }
                }
            }
        })
        task.resume()
    }


}
