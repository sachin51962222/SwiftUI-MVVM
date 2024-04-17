//
//  ListViewTest.swift
//  ImagePreview
//
//  Created by Sachin kumar on 15/04/24.
//

import XCTest
import SwiftUI
@testable import ImagePreview
import SnapshotTesting

final class ListViewTest: XCTestCase {
    var viewController: UIViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let hit1 = HitItem(id: 0, pageURL: "", type: "", tags: "pink, cherry blossoms, flower", previewURL: "")
        let hit2 = HitItem(id: 1, pageURL: "", type: "", tags: "marguerite, daisy, flower", previewURL: "")
        let dataService = DataServiceMock()
        dataService.hitItem = [hit1,hit2]
        let viewModel = ListViewModel(dataService: dataService)
        let hitListView = ListView(viewModel: viewModel)
        viewController = UIHostingController(rootView: hitListView)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
    }
    
    func testListViewOniPhone13ProMax() throws {
        assertSnapshot(matching: viewController, as: .image(on: .iPhone13ProMax))
    }
    
    func testListViewOniPhoneSE() throws {
        assertSnapshot(matching: viewController, as: .image(on: .iPhoneSe))
    }
    
    func testListViewOniPhoneDarkMode() throws {
        let traitDarkMode = UITraitCollection(
            userInterfaceStyle: UIUserInterfaceStyle.dark)
        assertSnapshot(
            matching: viewController,
            as: .image(on: .iPhone13ProMax, traits: traitDarkMode))
    }
}
