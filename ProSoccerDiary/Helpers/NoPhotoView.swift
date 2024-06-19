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
                .cornerRadius(8)
                .opacity(0.4)
                .frame(width: 135, height: 245)
            Image(.noPhoto)
                .resizable()
                .frame(width: 26, height:24)
        }
    }
}

#Preview {
    NoPhotoView()
}
