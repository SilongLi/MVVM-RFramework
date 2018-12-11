//
//  HomeServices.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/11.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation

class HomeServices {
    
    static func loadHomeDataSource(completion: (_ result: RequestResult, _ models: [BaseModel], _ msg: String) -> ()) {
        
        let oneModel = OneModel()
        oneModel.cellIdentifier = HomeCellIDType.oneCellID.rawValue
        oneModel.name = "One 值"
        oneModel.orderPrice  = "100元"
        oneModel.orderStatus = 1
        
        let twoModel = TwoModel()
        twoModel.cellIdentifier = HomeCellIDType.twoCellID.rawValue
        twoModel.name = "two"
        twoModel.articleContent = "是科学家"
        
        let threeModel = ThreeModel()
        threeModel.cellIdentifier = HomeCellIDType.threeCellID.rawValue
        threeModel.userId = "20181212"
        threeModel.name   = "three"
        threeModel.icon   = "帅气的头像"
        
        let models: [BaseModel] = [oneModel, twoModel, threeModel, oneModel, twoModel, threeModel, oneModel, twoModel, threeModel]
//        let models: [BaseModel] = [twoModel, oneModel, threeModel, twoModel, oneModel, threeModel, twoModel, oneModel, threeModel]
        completion(RequestResult.successNotEmpty, models, "")
    }
    
}
