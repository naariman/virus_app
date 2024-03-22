//
//  DashboardViewController.swift
//  VK Test Assignment
//
//  Created Nariman on 22.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Dastan Makhutov @mchutov
//

import UIKit

final class DashboardViewController: UIViewController, 
                                     DashboardViewProtocol {
	var presenter: DashboardPresenterProtocol?
    private var statisticsView: DashboardStatisticsView = .init()
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupUI()
    }
    
    func configure(with model: EpidemiologicalSpreadModel) {
        statisticsView.configure(with: model)
    }
}

private extension DashboardViewController {
    func setupUI() {
        view.backgroundColor = .white
        view.addSubviews(statisticsView)
        statisticsView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
}
