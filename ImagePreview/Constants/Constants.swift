//
//  Constants.swift
//  ImagePreview
//
//  Created by Sachin Kumar on 15/04/24.
//
import Foundation

class Constants {
    static let hits = "Hits"
}
enum ApiUrl {
    case hits
    var Url: URL? {
        switch self {
        case .hits:
            return URL(string: "https://www.jsonkeeper.com/b/6JS0")
        }
    }
}
enum CustomError: Error {
    case invalidData
    case invalidUrl
}
