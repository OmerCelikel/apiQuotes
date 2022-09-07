//
//  postRequest.swift
//  apiQuates
//
//  Created by Ömer Oğuz Çelikel on 5.09.2022.
//

import Foundation

func makePostRequest() {
    print("makePostRequest worked:")
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        return
    }
    
    print("Making api call...")
    
    var request = URLRequest(url: url)
    
    //method body headers
    
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: AnyHashable] = [
        "userId" : 1,
        "title" : "Hello From Oguz",
        "body": "The weather is perfect"
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    // Make the request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            //let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            //print("SUCCESS: \(response)")
            print("\n response user ID: \(response.userId) \n")
        } catch {
            print("error1: ",error)
        }
        
    }
    task.resume()
    
}

struct Response: Codable {
    let body: String
    let id: Int
    let title: String
    let userId: Int
}

struct Response5: Codable {
    let succeeded: String
    let id: Int
    let title: String
    let userId: Int
}
