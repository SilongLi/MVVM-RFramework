//
//  HomeRouter.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/11.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

enum HomeRouterTable: String {
    /// 首页模块
    case home
}

class HomeRouter: NSObject {
    /// 界面跳转路由
    ///
    /// - Parameters:
    ///   - route: 跳转类型
    ///   - parameters: 参数
    ///   - fromViewController: 当前页面
    static func pushTo(_ route: HomeRouterTable, parameters: [String: Any]?, fromViewController: UIViewController) {
        switch route {
        case .home:
            let VC = HomeViewController()
            DispatchQueue.main.async {
                fromViewController.navigationController?.pushViewController(VC, animated: true)
            }
        }
    }
}
