//
//  TwoTableViewCell.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

class TwoTableViewCell: BaseTableViewCell {
    
    let marge: CGFloat = 20.0
    let marge1: CGFloat = 30.0
    
    override var item: ViewModelProtocol? {
        didSet {
            if item is TwoTableViewCellViewModelProtocol {
                let model = item as! TwoTableViewCellViewModelProtocol
                self.textLabel?.text = "\(model.title) \(model.content)"
            }
        } 
    }
    
    override func setupContent<T>(model: T) {
        guard model is TwoTableViewCellViewModelProtocol else {
            return
        }
        let model = model as! TwoTableViewCellViewModelProtocol
        self.textLabel?.text = "title: \(model.title)  content: \(model.content)"
    }
    
    override func cellHeight<T>(_ model: T) -> CGFloat {
        var height: CGFloat = 0.0
        guard model is TwoTableViewCellViewModelProtocol else {
            return height
        }
        let model = model as! TwoTableViewCellViewModelProtocol
        // 返回内存缓存的高度
        guard model.cellHeight == 0.0 else {
            return CGFloat(model.cellHeight)
        }
        
        // TODO: 根据model计算cell的高度
        height = 60.0
        return height
    }

}
