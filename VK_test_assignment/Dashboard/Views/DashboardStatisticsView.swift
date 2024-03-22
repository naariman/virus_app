//
//  DashboardNavigationBar.swift
//  VK_test_assignment
//
//  Created by Nariman on 22.03.2024.
//

import UIKit

final class DashboardStatisticsView: VKView {
    
    private struct Constants {
        static let groupSizeViewImage = AppImage.human.uiImage
        static let infectionFactorViewImage = AppImage.zombie.uiImage
        static let recalculationInfectedViewImage = AppImage.time.uiImage
    }
    
    private let groupSizeView: ImageWithTextHorizontal = .init()
    private let infectionFactorView: ImageWithTextHorizontal = .init()
    private let recalculationInfectedView: ImageWithTextHorizontal = .init()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        return stackView
    }()
    
    override init(
        backgroundColor: UIColor = .white,
        cornerRadius: CGFloat = 0,
        borderColor: UIColor = .clear,
        borderWidth: CGFloat = 0,
        maskToBounds: Bool = true
    ) {
        super.init(
            backgroundColor: backgroundColor,
            cornerRadius: cornerRadius,
            borderColor: borderColor,
            borderWidth: borderWidth
        )
            self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: EpidemiologicalSpreadModel) {
        groupSizeView.configure(
            image: Constants.groupSizeViewImage ?? UIImage(),
            text: model.groupSize.description
        )
        infectionFactorView.configure(
            image: Constants.infectionFactorViewImage ?? UIImage(),
            text: model.infectionFactor.description
        )
        recalculationInfectedView.configure(
            image: Constants.recalculationInfectedViewImage ?? UIImage(),
            text: model.recalculationInfected.description
        )
    }
}

private extension DashboardStatisticsView {
    
    func setupUI() {
        clipsToBounds = false
        layer.shadowColor = UIColor.txt.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        addSubviews(mainStackView)
        backgroundColor = .white
        mainStackView.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(48)
        }
        mainStackView.addArrangedSubviews(
            groupSizeView,
            infectionFactorView,
            recalculationInfectedView
        )
    }
}
