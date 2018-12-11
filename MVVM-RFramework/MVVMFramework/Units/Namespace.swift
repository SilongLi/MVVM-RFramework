//
//  Namespace.swift
//  PrivateEquity
//
//  Created by leoli on 2017/11/22.
//  Copyright © 2017年 TDW.CN. All rights reserved.
//

import UIKit

public protocol NamespaceWrappable {
    associatedtype WrapperType
    var td: WrapperType { get set }
    static var td: WrapperType.Type { get }
}

public extension NamespaceWrappable {
    var td: NamespaceWrapper<Self> {
        get {
            return NamespaceWrapper(value: self)
        }
        set {}
    }

    static var td: NamespaceWrapper<Self>.Type {
        return NamespaceWrapper.self
    }
}

public struct NamespaceWrapper<Base> {
    public var wrappedValue: Base
    public init(value: Base) {
        self.wrappedValue = value
    }
}

extension UIView: NamespaceWrappable {}
extension String: NamespaceWrappable {}
extension UIViewController: NamespaceWrappable {}
extension Bool: NamespaceWrappable {}
extension NSMutableAttributedString: NamespaceWrappable {}
extension UITapGestureRecognizer: NamespaceWrappable {}
