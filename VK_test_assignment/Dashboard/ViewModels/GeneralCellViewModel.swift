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
    
    static var mockData: [EntityViewModel] = [
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
        .init(type: .uninfected),
    ]
    
    var icon: UIImage {
        switch self.type {
        case .infected:
            return AppImage.zombie.uiImage ?? UIImage()
        case .uninfected:
            return AppImage.human.uiImage ?? UIImage()
        }
    }
}
