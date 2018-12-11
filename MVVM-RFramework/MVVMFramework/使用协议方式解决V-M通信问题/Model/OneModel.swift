//
//  OneModel.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation

class OneModel: BaseModel {
    var name: String = ""
    var orderPrice: String = ""
    var orderStatus: Int = 0
}

extension OneModel: OneTableViewCellViewModelProtocol {
    var title: String {
        return name
    }
    var price: String {
        return orderPrice
    }
    var status: Int {
        return orderStatus
    }
}
