//
//  BaseViewModelProtocol.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

/// TableView section 信息结构体模型协议，包含 section 标题信息等
protocol TableViewSectionProtocol {
    var headerTitle: String? { get }
    var footerTitle: String? { get }
}

/// View需要的Model数据统一需要实现的protocol
protocol ViewModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: Float { get }
}


