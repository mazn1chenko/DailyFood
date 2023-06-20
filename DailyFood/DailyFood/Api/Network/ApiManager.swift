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
            
            return "http://20.4.124.65"
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
                
            case .getFood: return "/empty"
                
            case .getInfoUsers: return "/empty"
                
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
    
    var userID : Int = 0
    
    var nameOfUser = ""
    var surnameOfUser = ""
    var allIdOfUser = [Int]()
    
    
    func loginFunc(login: String, password: String, completion: @escaping (ModelUsers) -> Void) {
        var headers = ApiType.login.headers
        headers["login"] = login
        headers["password"] = password
        
        let path = "\(login)/\(password)"
        
        let url = URL(string: path, relativeTo: URL(string: "http://20.4.124.65/users/logining/")!)!
        var request = URLRequest(url: url)
        
        //var request = ApiType.login.request
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data, let user = try? JSONDecoder().decode(ModelUsers.self, from: data){
                self.userID = user.id ?? 000
                self.nameOfUser = user.name ?? "NoName"
                self.surnameOfUser = user.surname ?? "NoSurname"
                completion(user)
            }else{
                print("SomethingWrong")
            }
            
        }
        task.resume()
    }
    
    func gettingTypeOfFood(completion: @escaping ([TypeOfFoodAPIElement]) -> Void) {
        let path = "/categories/"
        let url = URL(string: path, relativeTo: URL(string: "http://20.4.124.65")!)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data, let typeOfFood = try? JSONDecoder().decode([TypeOfFoodAPIElement].self, from: data){
                completion(typeOfFood)
            }else{
                print("SomethingWrongInAPIManagerFuncGettingTypeOfFood")
            }
            
        }
        task.resume()
        
    }
    
    func gettingSpecificTypeOfFood(completion: @escaping([SpecificTypeOfFoodElement]) -> Void)  {
        let path = "/dishes"
        let url = URL(string: path, relativeTo: URL(string: "http://20.4.124.65")!)!
        let request = URLRequest(url: url)
        print(request)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data, let food = try? JSONDecoder().decode([SpecificTypeOfFoodElement].self, from: data){
                completion(food)
            }else{
                print("SomethingWrongInAPIManagerFuncGettingSpecificTypeOfFood")
            }
            
        }
        task.resume()
        
    }
    
    func gettingAllOrdersOfUser(completion: @escaping ([AllOrdersOfUserElement]) -> Void) {
        //http://20.4.141.232/orders/user/2
        let headers = userID
        let path = "\(headers)"
        let url = URL(string: path, relativeTo: URL(string: "http://20.4.124.65/orders/user/")!)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data, let orders = try? JSONDecoder().decode([AllOrdersOfUserElement].self, from: data){
                completion(orders)
                
            }else{
                print("SomethingWrongInAPIManagerFuncGettingAllOrdersOfUser")
            }
            
        }
        task.resume()
        
    }
    func gettingSpecificDataOfUserOrders(headerOfId: Int, completion: @escaping ([SpecificOrderElement]) -> Void) {
        let headers = headerOfId
        let path = "\(headers)"
        let url = URL(string: path, relativeTo: URL(string: "http://20.4.124.65/orderparts/orderid/")!)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data, let specificOrder = try? JSONDecoder().decode([SpecificOrderElement].self, from: data){
                completion(specificOrder)
                
            }else{
                print("SomethingWrongInAPIManagerFuncGettingSpecificDataOfUserOrders")
            }
            
        }
        task.resume()
        
    }
    
}
        


