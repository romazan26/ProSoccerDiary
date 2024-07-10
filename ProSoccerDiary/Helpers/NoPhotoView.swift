//
//  NoPhotoView.swift
//  Movieplanner
//
//  Created by Роман on 18.06.2024.
//

import SwiftUI

struct NoPhotoView: View {
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.4)
            Image(.noPhoto)
                .resizable()
                .frame(width: 26, height:24)
        }
        .frame(width: 170, height: 215)
        .cornerRadius(8)
    }
}

#Preview {
    NoPhotoView()
}
