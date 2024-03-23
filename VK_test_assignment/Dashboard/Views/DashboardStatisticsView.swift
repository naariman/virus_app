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
    
    private let uninfectedView: ImageWithTextHorizontal = .init()
    private let infectedView: ImageWithTextHorizontal = .init()
    private let timerView: ImageWithTextHorizontal = .init()
    
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
    
    func configure(with model: EpidemicOverallStatistic) {
        uninfectedView.configure(
            image: Constants.groupSizeViewImage ?? UIImage(),
            text: model.uninfectedCount.description
        )
        infectedView.configure(
            image: Constants.infectionFactorViewImage ?? UIImage(),
            text: model.infectedCount.description
        )
        timerView.configure(
            image: Constants.recalculationInfectedViewImage ?? UIImage(),
            text: "00:00"
        )
    }
    
    
    func updateTimer(with text: String) {
        timerView.updateText(with: text)
    }
    
    func updateMainStatistic(uninfected: String, infected: String) {
        uninfectedView.updateText(with: uninfected)
        infectedView.updateText(with: infected)
    }
}

private extension DashboardStatisticsView {
    
    func setupUI() {
        addSubviews(mainStackView)
        backgroundColor = .white
        mainStackView.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(32)
        }
        mainStackView.addArrangedSubviews(
            timerView,
            uninfectedView,
            infectedView
        )
    }
}
