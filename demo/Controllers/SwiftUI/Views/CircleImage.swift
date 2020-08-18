//
//  CircleImage.swift
//  demo
//
//  Created by Jason on 2020/8/17.
//  Copyright © 2020 youzy. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("code")
        .fixedSize()
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        .shadow(radius: 10)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
