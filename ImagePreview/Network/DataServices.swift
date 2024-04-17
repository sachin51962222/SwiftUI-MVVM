//
//  DataServices.swift
//  ImagePreview
//
//  Created by Sachin Kumar on 15/04/24.
//

import Foundation

protocol DataServiceProtocol {
    func getHitListResponse(url: URL?,
                            success: @escaping ([HitItem]) -> Void,
                            failure: @escaping (Error) -> Void)
}

class DataService: DataServiceProtocol {
    func getHitListResponse(url: URL?, 
                            success: @escaping ([HitItem]) -> Void,
                            failure: @escaping (Error) -> Void) {
        NetworkManager.shared.getResponse(url: url, expecting: HitDetails.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    success(data.hits)
                case .failure(let error): failure(error)
                }
            }
        }
    }
}
