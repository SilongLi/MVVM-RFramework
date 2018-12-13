//
//  Namespace.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
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
