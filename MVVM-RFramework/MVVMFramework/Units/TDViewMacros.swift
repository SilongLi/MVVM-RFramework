//
//  TDPMacros.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

let TD_SCREEN_WIDTH = (UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height: UIScreen.main.bounds.width)
let TD_SCREEN_HEIGHT = (UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.width: UIScreen.main.bounds.height)

let TD_APP_WINDOW = UIApplication.shared.keyWindow!

// 屏幕尺寸适配
let TD_IPHONE_4 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 640, height: 960), (UIScreen.main.currentMode?.size)!) : false
let TD_IPHONE_5 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 640, height: 1136), (UIScreen.main.currentMode?.size)!) : false
let TD_IPHONE_6 = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 750, height: 1334), (UIScreen.main.currentMode?.size)!) : false
let TD_IPHONE_6P = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1242, height: 2208), (UIScreen.main.currentMode?.size)!) : false
let TD_IPHONE_6PBigMode = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1125, height: 2001), (UIScreen.main.currentMode?.size)!) : false
let TD_IPHONE_X: Bool = {
    var isFaceIDCapableDevices = false
    // iPhone X / iPhone XR
    isFaceIDCapableDevices = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1125, height: 2436), (UIScreen.main.currentMode?.size)!) : false
    guard isFaceIDCapableDevices == false else {
        return isFaceIDCapableDevices
    }
    // iPhone XS
    isFaceIDCapableDevices = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 828, height: 1792), (UIScreen.main.currentMode?.size)!) : false
    guard isFaceIDCapableDevices == false else {
        return isFaceIDCapableDevices
    }
    // iPhone XS Max
    isFaceIDCapableDevices = UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? __CGSizeEqualToSize(CGSize(width: 1242, height: 2688), (UIScreen.main.currentMode?.size)!) : false
    return isFaceIDCapableDevices
}()

let TD_NaviHeight: CGFloat = TD_IPHONE_X ? 88 : 64
let TD_TabbarHeight: CGFloat = TD_IPHONE_X ? 83 : 49
let TD_StatusHeight: CGFloat = TD_IPHONE_X ? 44 : 20

let suitParm: CGFloat = (TD_IPHONE_6P ? 1.12 : (TD_IPHONE_6 ? 1.0 : (TD_IPHONE_6PBigMode ? 1.01 : (TD_IPHONE_X ? 1.0 : 0.85))))

func RGB (r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

func RGBA (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

/// 国际化
func TDWLocalString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}
