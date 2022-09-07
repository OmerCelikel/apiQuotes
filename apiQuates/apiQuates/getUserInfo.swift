//
//  getUserInfo.swift
//  apiQuates
//
//  Created by Ömer Oğuz Çelikel on 5.09.2022.
//

import Foundation

func getUserInfo(userToken: String) {
    print("getUserInfo worked2:")
    guard let url = URL(string: "https://05a0-88-253-133-95.eu.ngrok.io/api/UserSkills/users") else {
        return
    }
    
    print("Making api call...")
    
    var request = URLRequest(url: url)
    
    //method body headers
    
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("Bearer \(userToken)", forHTTPHeaderField: "Authorization")
    
    // Make the request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            print("failed with error")
            return
        }
        do {
            let suggestions = try JSONDecoder().decode(Suggestions.self, from: data)

            print(suggestions)
            //let response = try JSONDecoder().decode(Suggestions.self, from: data)
            //let response = try JSONDecoder().decode([myData].self, from: data)
            //let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            //print("SUCCESS: \(response)")
            //print("result response: \(response)")
            
            
        } catch {
            print("error1: ",error)
        }
        
    }
    task.resume()
    
}

struct Suggestions: Codable {
    let succeeded: Bool
    let data: [myData]
}

struct myData: Codable {
    let userSkillId: Int
    let skillLevel: Int
    let skillName: String
    let category: String
    let userId: Int
}

//struct Response6: Codable {
//    let data: [myData]
//    let succeeded: String
//}
//struct myData: Codable {
//    let userSkillId: Int
//    let skillLevel: Int
//    let skillName: String
//    let category: String
//    let userId: Int
//}
