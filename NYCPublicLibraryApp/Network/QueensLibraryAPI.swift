//
//  QueensLibraryAPI.swift
//  NYCPublicLibraryApp
//
//  Created by Jane Zhu on 12/11/18.
//  Copyright © 2018 Jane Zhu. All rights reserved.
//

import Foundation

enum AppError {
    case badURL(String)
    case badData(Error)
    case badDecoding(Error)
}

final class QueensLibraryAPI {
    static func getAllBranches(completionHandler: @escaping (([QueensLibrary]?, AppError?) -> Void)) {
        guard let myURL = URL.init(string: "https://data.cityofnewyork.us/resource/b67a-vkqb.json") else { completionHandler(nil,.badURL("URL not working"))
            return }
        URLSession.shared.dataTask(with: myURL) { (data, response, error) in
        if let error = error {
            completionHandler(nil,.badData(error))
        }
        if let data = data {
            do {
                let queensLibraryData = try JSONDecoder().decode([QueensLibrary].self, from: data)
                completionHandler(queensLibraryData, nil)
            } catch {
                completionHandler(nil,.badDecoding(error))
            }
        }
    }.resume()
}
}


struct QueensLibraryFormatter {
    static func formatCompleteAddress(streetAddress: String, borough: String, postcode: String) -> String {
        return "Address: \n\(streetAddress) \n\(borough), New York \(postcode)"
    }
    
    static func formatHoursOfOperation(mon: String, tue: String, wed: String, thurs: String, fri: String, sat: String, sun: String) -> String {
        return "Hours of Operation: \nMonday: \(mon) \nTuesday: \(tue) \nWednesday: \(wed) \nThursday: \(thurs) \nFriday: \(fri) \nSaturday: \(sat) \nSunday: \(sun)"
    }
}