//
//  ListView.swift
//  ImagePreview
//
//  Created by Sachin Kumar on 15/04/24.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel = ListViewModel()
    var body: some View {
        NavigationView() {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                List(self.viewModel.list) { item in
                    ItemRow(item: item)
                } .listStyle(.plain)
                    .navigationTitle(Constants.hits)
                    .onAppear() {
                        self.viewModel.getListData()
                    }.navigationBarTitleDisplayMode(.large)
            }
        }
    }
}
extension ListView {
    func getListView() -> some View {
        return self
    }
}

