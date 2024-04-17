//
//  HitDetailsModel.swift
//  ImagePreview
//
//  Created by Sachin Kumar on 15/04/24.
//

import Foundation

struct HitDetails: Codable {
    let total: Int
    let totalHits: Int
    let hits: [HitItem]
}
struct HitItem: Codable, Identifiable{
    let id: Int
    let pageURL: String
    let type: String
    let tags: String
    let previewURL: String
}
