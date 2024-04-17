//
//  ItemRow.swift
//  ImagePreview
//
//  Created by Sachin Kumar on 15/04/24.
//

import SwiftUI

struct ItemRow: View {
    let item: HitItem
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.previewURL)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(width: imageSize, height: imageSize)
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(item.tags)
            }
        }
    }
}
