//
//  UIView+Helper.swift
//  PrivateEquity
//
//  Created by leoli on 2017/11/28.
//  Copyright © 2017年 TDW.CN. All rights reserved.
//

import UIKit

extension NamespaceWrapper where Base: UIView {

    /// 视图所在控制器
    public func atViewController() -> UIViewController? {
        var view: UIView? = wrappedValue
        repeat {
            if let nextResponder = view?.next {
                if let viewController = (nextResponder as? UIViewController) {
                    return viewController
                } else {
                    view = view?.superview
                }
            } else {
                return nil
            }
        } while view != nil
        return nil
    }

    /// 视图截图
    public func imageFromView() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(wrappedValue.frame.size, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            wrappedValue.layer.render(in: context)
            if let image = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext()
                return image
            }
        }
        UIGraphicsEndImageContext()
        return nil
    }

    /// 设置视图单个圆角
    ///
    /// - Parameters:
    ///   - corner: 圆角的左右，底部左右
    ///   - size: 大小
    public func makeCornerWithDirection(_ corner: UIRectCorner, size: CGSize) {
        let path = UIBezierPath(roundedRect: wrappedValue.bounds, byRoundingCorners: corner, cornerRadii: size)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        wrappedValue.layer.mask = mask
    }

    /// 设置圆角
    ///
    /// - Parameter radius: 大小
    public func cornerRadius(_ radius: CGFloat) {
        wrappedValue.layer.cornerRadius  = radius
        wrappedValue.clipsToBounds = true
    }
}
