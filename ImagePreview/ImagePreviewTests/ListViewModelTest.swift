//
//  ListViewModelTest.swift
//  ImagePreviewTests
//
//  Created by Sachin Kumar on 15/04/24.
//

import XCTest
import Combine
@testable import ImagePreview

final class ListViewModelTest: XCTestCase {
    private var listViewModel: ListViewModel?
    
    override func setUp() {
        super.setUp()
        listViewModel = ListViewModel(url: ApiUrl.hits.Url)
    }
    override func tearDown() {
        listViewModel = nil
        super.tearDown()
    }
    func testSuccessGetListData() {
        let hitItem = [HitItem(id: 10, pageURL: "", type: "Photo", tags: "Test", previewURL: "")]
        let dataService = DataServiceMock()
        dataService.hitItem = hitItem
        listViewModel = ListViewModel(url: ApiUrl.hits.Url, dataService: dataService)
        listViewModel?.getListData()
        XCTAssertNotNil(listViewModel?.list)
    }
    func testFailureGetListData() {
        let dataService = DataServiceMock()
        listViewModel = ListViewModel(url: ApiUrl.hits.Url, dataService: dataService)
        listViewModel?.getListData()
        XCTAssertEqual(listViewModel?.list.count, 0)
    }
}

class DataServiceMock: DataServiceProtocol {
    var hitItem = [HitItem]()
    func getHitListResponse(url: URL?, success: @escaping ([ImagePreview.HitItem]) -> Void, failure: @escaping (Error) -> Void) {
        if hitItem.isEmpty {
            failure(CustomError.invalidData)
        } else {
            success(hitItem)
        }
    }
}
