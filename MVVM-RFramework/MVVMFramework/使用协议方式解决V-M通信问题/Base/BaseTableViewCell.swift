//
//  BaseTableViewCell.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    /// 更加模型数据更新UI，方式一
    var item: ViewModelProtocol?
    
    /// 更加模型数据更新UI，方式二
    func setupContent<T>(model: T) {}
    
    /// 根据数据计算高度
    ///
    /// - Parameter model: 模型数据
    /// - Returns: 视图高度
    func cellHeight<T>(_ model: T) -> CGFloat { return 0.0 }
}
