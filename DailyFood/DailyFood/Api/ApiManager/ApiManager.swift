//
//  ApiManager.swift
//  DailyFood
//
//  Created by m223 on 23.03.2023.
//

import Foundation

    enum ApiType {
        
        case login
        case getFood
        case getInfoUsers
        
        
        var baseURL: String{
            
            return "http://20.4.141.232"
        }
        
        var headers: [String: String]{
            switch self {
            case .login:
                return [:]
            default:
                return [:]
                
            }
        }
        
        var path: String {
            switch self{
            case .login: return "/users/logining"
                
            case .getFood: return "/loh"
                
            case .getInfoUsers: return "/loh"
                
            }
            
        }
        
        var request: URLRequest {
            var url = URL(string: path, relativeTo: URL(string: baseURL)!)!
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = headers
            switch self {
            case .login: request.httpMethod = "GET"
                return request
            default: request.httpMethod = "POST"
                return request
                
            }
            
        }
        
        
    }


class ApiManager {
    
    static let shared = ApiManager()
    

    
    func loginFunc(login: String, password: String, completion: @escaping (ModelUsers) -> Void) {
        var headers = ApiType.login.headers
        headers["login"] = login
        headers["password"] = password
        
        let path = "\(login)/\(password)"
        
        let url = URL(string: path, relativeTo: URL(string: "http://20.4.141.232/users/logining/")!)!
        var request = URLRequest(url: url)
        
        //var request = ApiType.login.request
        request.allHTTPHeaderFields = headers
        print("Request: \(request)")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data, let user = try? JSONDecoder().decode(ModelUsers.self, from: data){
                completion(user)
            }else{
                print("SomethingWrong")
            }
            
        }
        task.resume()
    }
    
}
