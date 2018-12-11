//
//  TwoModel.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation

class TwoModel: BaseModel {
    var name: String = ""
    var articleContent: String = ""
}

extension TwoModel: TwoTableViewCellViewModelProtocol {
    var title: String {
        return name
    }
    var content: String {
        return articleContent
    }
}

