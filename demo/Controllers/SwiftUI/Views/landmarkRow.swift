//
//  landmarkRow.swift
//  demo
//
//  Created by Jason on 2020/8/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import SwiftUI

struct landmarkRow: View {
    var landmark: Landmark

    var bodyTitle: some View {
        HStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
    }
    
    var body: some View {
        
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "start.fill").imageScale(.medium)
                    .foregroundColor(.yellow)
            }

        }
        
    }
}

struct landmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            landmarkRow(landmark: landmarkData[0])
            landmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}

struct HikeItem: Identifiable {
    var id: Int
    //...//
}
