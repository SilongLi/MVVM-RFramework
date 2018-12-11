//
//  HomeViewDelegate.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/10.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation

/// OneTableViewCell 事件代理
protocol OneTableViewCellDelegate: class {
    func didClickedShowDetailInfoButtonAction(model: OneTableViewCellViewModelProtocol)
}
