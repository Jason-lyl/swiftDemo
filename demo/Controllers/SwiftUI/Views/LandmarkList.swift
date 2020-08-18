//
//  LandmarkList.swift
//  demo
//
//  Created by Jason on 2020/8/18.
//  Copyright © 2020 youzy. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            //list view
            List(landmarkData) { landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    landmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("LandMarks"))
        }

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XR"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
