//
//  ListViewModel.swift
//  ImagePreview
//
//  Created by Sachin Kumar on 15/04/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var list = [HitItem]()
    @Published var isLoading = true
    var url: URL?
    var dataService: DataServiceProtocol?
    
    init(url: URL? = ApiUrl.hits.Url, dataService: DataServiceProtocol = DataService()) {
        self.url = url
        self.dataService = dataService
    }
    
    // get hit list from server
    func getListData() {
        dataService?.getHitListResponse(url: self.url, success: { result in
            self.isLoading = false
            self.list = result
        }, failure: { error in })
    }
}
