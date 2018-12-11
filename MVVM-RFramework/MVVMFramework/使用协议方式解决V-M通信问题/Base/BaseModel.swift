//
//  BaseModel.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation
import CoreGraphics

class BaseModel: ViewModelProtocol {
    var cellHeight: CGFloat = 0.0
    var cellIdentifier: String = "BaseDefaultCellID"
}

struct BaseSectionModel: TableViewSectionProtocol {
    var cellType: String
    var headerTitle: String
    var footerTitle: String
    var headerHeight: CGFloat
    var footerHeight: CGFloat
    var cellHeight: CGFloat
    var showCellCount: Int
    var items: [ViewModelProtocol]
    
    init(cellType: String,
         headerTitle: String = "",
         footerTitle: String = "",
         headerHeight: CGFloat = 0.0,
         footerHeight: CGFloat = 0.0,
         cellHeight: CGFloat = 0.0,
         showCellCount: Int = 0,
         items: [ViewModelProtocol]) {
        self.cellType      = cellType
        self.headerTitle   = headerTitle
        self.footerTitle   = footerTitle
        self.headerHeight  = headerHeight
        self.footerHeight  = footerHeight
        self.cellHeight    = cellHeight
        self.showCellCount = showCellCount
        self.items         = items
    }
}
