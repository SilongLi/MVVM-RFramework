//
//  HomeViewController.swift
//  MVVMFramework
//
//  Created by lisilong on 2018/12/5.
//  Copyright © 2018 lisilong. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.grouped)
        tableView.delegate        = self
        tableView.dataSource      = self
        tableView.separatorStyle  = .none
        tableView.backgroundColor = UIColor.lightGray
        tableView.showsVerticalScrollIndicator = false
        tableView.register(OneTableViewCell.self, forCellReuseIdentifier: HomeCellIDType.oneCellID.rawValue)
        tableView.register(TwoTableViewCell.self, forCellReuseIdentifier: HomeCellIDType.twoCellID.rawValue)
        tableView.register(ThreeTableViewCell.self, forCellReuseIdentifier: HomeCellIDType.threeCellID.rawValue)
        if #available(iOS 11, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        return tableView
    }()
    
    var viewModel: HomeViewModel = HomeViewModel()
    var sections: [BaseSectionModel] = [BaseSectionModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        loadDataSource()
    }
    
    func setupSubViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(TD_StatusHeight)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func loadDataSource() {
        viewModel.loadHomeDataSource { [weak self] (result, sections, msg) in
            switch result {
            case .successNotEmpty:
                self?.sections = sections
                self?.tableView.reloadData()
            case .successEmpty:
                print("暂无数据！")
            case .networkFail:
                print("网络请求错误：\(msg)")
            case .serviceFail:
                print("网络请求错误：\(msg)")
            }
        }
    }
}

// MARK: - <UITableViewDelegate, UITableViewDataSource>
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].showCellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as! BaseTableViewCell
        cell.setupContent(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        if section.cellHeight > 0.0 {
            return section.cellHeight
        }
        let model  = section.items[indexPath.row]
        let cell   = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as! BaseTableViewCell
        let height = cell.cellHeight(model)
        sections[indexPath.section].cellHeight = height
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sections[section].footerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - <OneTableViewCellDelegate>
extension HomeViewController: OneTableViewCellDelegate {
    func didClickedShowDetailInfoButtonAction(model: OneTableViewCellViewModelProtocol) {
        print("展示“\(model.title)”详情")
    }
}
