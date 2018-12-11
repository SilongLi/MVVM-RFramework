//
//  ThreeModel.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation

class ThreeModel: BaseModel {
    var userId: String = ""
    var name: String = ""
    var icon: String = ""
}

extension ThreeModel: ThreeTableViewCellViewModelProtocol { 
    var id: String {
        return userId
    }
    var title: String {
        return name
    }
    var image: String {
        return icon
    }
}

