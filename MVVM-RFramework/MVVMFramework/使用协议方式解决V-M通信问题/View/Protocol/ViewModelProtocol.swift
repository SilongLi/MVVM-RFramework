//
//  ViewModelProtocol.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//


// OneTableViewCell
protocol OneTableViewCellViewModelProtocol: ViewModelProtocol {
    var title: String { get }
    var price: String { get }
    var status: Int { get }
}

// TwoTableViewCell
protocol TwoTableViewCellViewModelProtocol: ViewModelProtocol {
    var title: String { get }
    var content: String { get }
}

// ThreeTableViewCell
protocol ThreeTableViewCellViewModelProtocol: ViewModelProtocol {
    var id: String { get }
    var title: String { get }
    var image: String { get }
}
