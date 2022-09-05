//
//  getSunriseSunset.swift
//  apiQuates
//
//  Created by Ömer Oğuz Çelikel on 5.09.2022.
//

import Foundation

func getDataSunrise() {
    let url = "https://api.sunrise-sunset.org/json?date=2020-01-01&lat=-74.0060&lng=40.7128&formatted=0"
    
    let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
        guard let data = data, error == nil else {
            print("something went wrong")
            return
        }
    // have data
    var result: Response3?
    do {
        result = try JSONDecoder ().decode(Response3.self, from: data)
    }
    catch {
        print("failed to convert \(error.localizedDescription)")
    }
    guard let json = result else {
        return
        }
        print(json)
        print(json.status)
        print(json.results.sunrise)
        print(json.results.sunrise)
        print(json.results.solar_noon)
        })
    task.resume()
    }

        struct Response3: Codable {
            let results: MyResult
            let status: String
        }
        struct MyResult: Codable {
            let sunrise: String
            let sunset: String
            let solar_noon: String
            let day_length: Int
            let civil_twilight_begin: String
            let civil_twilight_end: String
            let nautical_twilight_begin: String
            let nautical_twilight_end: String
            let astronomical_twilight_begin: String
            let astronomical_twilight_end: String
            
        }
