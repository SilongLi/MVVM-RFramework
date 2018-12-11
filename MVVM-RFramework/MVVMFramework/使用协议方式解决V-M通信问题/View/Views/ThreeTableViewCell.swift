//
//  ThreeTableViewCell.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

class ThreeTableViewCell: BaseTableViewCell {
    
    override var item: ViewModelProtocol? {
        didSet {
            if item is ThreeTableViewCellViewModelProtocol {
                let model = item as! ThreeTableViewCellViewModelProtocol
                self.textLabel?.text = "\(model.id)  \(model.title) \(model.image)"
            }
        }
    }
    
    override func setupContent<T>(model: T) {
        guard model is ThreeTableViewCellViewModelProtocol else {
            return
        }
        let model = model as! ThreeTableViewCellViewModelProtocol
        self.textLabel?.text = "\(model.id)  \(model.title) \(model.image)"
    }
    
    override func cellHeight<T>(_ model: T) -> CGFloat {
        var height: CGFloat = 0.0
        guard model is ThreeTableViewCellViewModelProtocol else {
            return height
        }
        let model = model as! ThreeTableViewCellViewModelProtocol
        // 返回内存缓存的高度
        guard model.cellHeight == 0.0 else {
            return CGFloat(model.cellHeight)
        }
        
        // TODO: 更加model计算cell的高度
        height = 50.0 + 100.0
        return height
    }
}
