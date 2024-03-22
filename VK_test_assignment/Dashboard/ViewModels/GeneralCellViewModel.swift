//
//  GeneralCellViewModel.swift
//  VK_test_assignment
//
//  Created by Nariman on 23.03.2024.
//

import UIKit

enum InfectionType {
    case infected
    case uninfected
}

struct EntityViewModel {
    var type: InfectionType
    
    static var mockData: [EntityViewModel] = {
        var data = [EntityViewModel]()
        for _ in 0...1000 {
            let model = EntityViewModel(type: .uninfected)
            data.append(model)
        }
        return data
    }()
    
    var icon: UIImage {
        switch self.type {
        case .infected:
            return AppImage.zombie.uiImage ?? UIImage()
        case .uninfected:
            return AppImage.human.uiImage ?? UIImage()
        }
    }
}
