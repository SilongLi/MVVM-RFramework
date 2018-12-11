//
//  BaseViewModelProtocol.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation
import CoreGraphics

/// TableView section 信息结构体模型协议，包含 section 标题信息等
protocol TableViewSectionProtocol {
    var cellType: String { get }
    var headerTitle: String { get }
    var footerTitle: String { get }
    var headerHeight: CGFloat { get }
    var footerHeight: CGFloat { get }
    var cellHeight: CGFloat { get }
    var showCellCount: Int { get }
    var items: [ViewModelProtocol] { get }
}

/// View需要的Model数据统一需要实现的protocol
protocol ViewModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: CGFloat { get }
}


