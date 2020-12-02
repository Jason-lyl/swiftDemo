//
//  SizeRatio.swift
//  demo
//
//  Created by Jason on 2020/12/1.
//  Copyright © 2020 youzy. All rights reserved.
//

import Foundation
import UIKit


/// 尺寸缩放比例
struct SizeRatio {
    /// 宽度比例 取值范围 0~1
    var width: CGFloat
    /// 高度比例 取值范围 0~1
    var height: CGFloat

    init(width: CGFloat) {
        self.width = width
        self.height = 1
    }

    init(height: CGFloat) {
        self.width = 1
        self.height = height
    }

    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }

    static var min: SizeRatio {
        return SizeRatio(width: 0, height: 0)
    }

    static var mid: SizeRatio {
        return SizeRatio(width: 0.5, height: 0.5)
    }

    static var max: SizeRatio {
        return SizeRatio(width: 1, height: 1)
    }
}
