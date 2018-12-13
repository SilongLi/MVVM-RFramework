//
//  OneTableViewCell.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

class OneTableViewCell: BaseTableViewCell {
    
    lazy var showBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("show", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.layer.borderWidth = 1.0
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(showDetailInfoClicked), for: .touchUpInside)
        return btn
    }()
    
    var model: OneTableViewCellViewModelProtocol?
    weak var delegate: OneTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(showBtn)
        showBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 60.0, height: 35.0))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var item: ViewModelProtocol? {
        didSet {
            if item is OneTableViewCellViewModelProtocol {
                 let model = item as! OneTableViewCellViewModelProtocol
                self.model = model
                self.textLabel?.text = "\(model.title) \(model.price) \(model.status)"
            }
        }
    }
    
    override func setupContent<T>(model: T) {
        self.delegate = self.td.atViewController() as? OneTableViewCellDelegate
        guard model is OneTableViewCellViewModelProtocol else {
            return
        }
        let model = model as! OneTableViewCellViewModelProtocol
        self.model = model
        self.textLabel?.text = "\(model.title) \(model.price) \(model.status)"
    }
    
    override func cellHeight<T>(_ model: T) -> CGFloat {
        var height: CGFloat = 0.0
        guard model is OneTableViewCellViewModelProtocol else {
            return height
        }
        let model = model as! OneTableViewCellViewModelProtocol
        // 返回内存缓存的高度
        guard model.cellHeight == 0.0 else {
            return CGFloat(model.cellHeight)
        }
        
        // TODO: 根据model计算cell的高度
        height = 50.0 + 100.0
        return height
    }
    
    @objc func showDetailInfoClicked() {
        if let model = self.model {
            self.delegate?.didClickedShowDetailInfoButtonAction(model: model)
        }
    }
}
