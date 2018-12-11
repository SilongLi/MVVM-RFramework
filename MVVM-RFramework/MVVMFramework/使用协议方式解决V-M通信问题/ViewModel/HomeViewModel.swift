//
//  HomeViewModel.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import Foundation

class HomeViewModel {

    /// 获取首页数据
    ///
    /// - Parameter completion: 数据回调
    func loadHomeDataSource(completion: (_ result: RequestResult, _ models: [BaseSectionModel], _ msg: String) -> ()) {
        HomeServices.loadHomeDataSource { (result, models, msg) in
            var sections = [BaseSectionModel]()
            switch result {
            case .successNotEmpty:
                for model in models {
                    if model.cellIdentifier == HomeCellIDType.oneCellID.rawValue {
                        let section = HomeViewModel.createOneSection(model)
                        sections.append(section)
                    } else if model.cellIdentifier == HomeCellIDType.twoCellID.rawValue {
                        let section = HomeViewModel.createOneSection(model)
                        sections.append(section)
                    } else if model.cellIdentifier == HomeCellIDType.threeCellID.rawValue {
                        let section = HomeViewModel.createOneSection(model)
                        sections.append(section)
                    }
                }
            case .successEmpty, .networkFail, .serviceFail:
                break
            }
            completion(result, sections, msg)
        }
    }
    
    private static func createOneSection(_ model: BaseModel) -> BaseSectionModel {
        return BaseSectionModel(cellType: model.cellIdentifier,
                                headerTitle: "",
                                footerTitle: "",
                                headerHeight: 8.0,
                                footerHeight: 0.001,
                                cellHeight: 0.0,
                                showCellCount: 1,
                                items: [model])
    }
    
    private static func createTwoSection(_ model: BaseModel) -> BaseSectionModel {
        return BaseSectionModel(cellType: model.cellIdentifier,
                                headerTitle: "",
                                footerTitle: "",
                                headerHeight: 8.0,
                                footerHeight: 0.001,
                                cellHeight: 0.0,
                                showCellCount: 1,
                                items: [model])
    }
    
    private static func createThreeSection(_ model: BaseModel) -> BaseSectionModel {
        return BaseSectionModel(cellType: model.cellIdentifier,
                                headerTitle: "",
                                footerTitle: "",
                                headerHeight: 8.0,
                                footerHeight: 0.001,
                                cellHeight: 0.0,
                                showCellCount: 1,
                                items: [model])
    }
}
