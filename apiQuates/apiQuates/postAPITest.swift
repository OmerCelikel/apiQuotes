//
//  postAPITest.swift
//  apiQuates
//
//  Created by Ömer Oğuz Çelikel on 5.09.2022.
//

import Foundation

func makePostRequestLogin() {
    print("makePostRequestDoveloper worked:")
    guard let url = URL(string: "https://05a0-88-253-133-95.eu.ngrok.io/api/User/Login") else {
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
            getUserInfo(userToken: tokenToUserRequest)
            
        } catch {
            print("error1: ",error)
        }
        
    }
    task.resume()
    
}

struct Response2: Codable {
    let succeeded: Bool
    var data: MyDataResult
    let message: String
}

struct MyDataResult: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var token: String
    var profilePicturePath: String
}
