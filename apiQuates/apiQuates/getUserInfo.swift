//
//  getUserInfo.swift
//  apiQuates
//
//  Created by Ömer Oğuz Çelikel on 5.09.2022.
//

import Foundation
//func getUserInfo() {
//
//    let url = "https://a3d4-13-94-229-122.eu.ngrok.io/api/UserSkills/users"
//
//    let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
//        guard let data = data, error == nil else {
//            print("something went wrong")
//            return
//        }
//        // have data
//        var result: Response6?
//        do {
//            result = try JSONDecoder ().decode(Response6.self, from: data)
//        }
//        catch {
//            print("failed to convert \(error.localizedDescription)")
//        }
//        guard let json = result else {
//            return
//        }
//        print(json)
//        print(json.succeeded)
//        print(json.data.skillName)
//        print(json.data.skillLevel)
//    })
//    task.resume()
//}
func getUserInfo() {
    print("getUserInfo worked:")
    guard let url = URL(string: "https://a3d4-13-94-229-122.eu.ngrok.io/api/User/Login") else {
        return
    }
    
    print("Making api call...")
    
    var request = URLRequest(url: url)
    
    //method body headers
    
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: AnyHashable] = [
        "email": "a@d-teknoloji.com.tr",
        "password": "12345678",
        "token": "string"
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    
    // Make the request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            print("failed with error")
            return
        }
        do {
            let response = try JSONDecoder().decode(Response2.self, from: data)
            //let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            //print("SUCCESS: \(response)")
            print("result response: \(response.succeeded)")
            print("result response email: \(response.data.email)")
            print("result response token: \(response.data.token)")
            print("type of response.data.token", type(of: response.data.token))
            //postToken = String(response.data.token)
            //print("postToken: ", postToken)
            let tokenToUserRequest = response.data.token
            
            
        } catch {
            print("error1: ",error)
        }
        
    }
    task.resume()
    
}
struct Response6: Codable {
    let data: MyResult2
    let succeeded: String
}
struct MyResult2: Codable {
    let userSkillId: Int
    let skillLevel: Int
    let skillName: String
    let category: String
    let userId: Int
}
