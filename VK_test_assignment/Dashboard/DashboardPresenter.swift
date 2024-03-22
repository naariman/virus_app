//
//  DashboardPresenter.swift
//  VK Test Assignment
//
//  Created Nariman on 22.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Dastan Makhutov @mchutov
//

import UIKit

final class DashboardPresenter: DashboardPresenterProtocol {
    weak private var view: DashboardViewProtocol?
    var interactor: DashboardInteractorProtocol?
    private let router: DashboardWireframeProtocol
    private let epidemiologicalSpreadModel: EpidemiologicalSpreadModel
    
    init(
        interface: DashboardViewProtocol,
        interactor: DashboardInteractorProtocol?,
        router: DashboardWireframeProtocol,
        model: EpidemiologicalSpreadModel
    ) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.epidemiologicalSpreadModel = model
    }
    
    func viewDidLoad() {
        view?.configure(with: epidemiologicalSpreadModel)
    }
}
