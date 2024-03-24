//
//  SimulationEndView.swift
//  VK_test_assignment
//
//  Created by Nariman on 24.03.2024.
//

import UIKit

final class SimulationEndView: VKView {
    
    private struct Constants {
        static let title = "Симуляция окончена, \n вот результаты!"
        static let timeLabelSuffix = "Общее время заражения: "
        static let timeIntervalSuffix = "Частота заражения: "
        static let groupSizeSuffix = "Количество людей: "
        static let infectionFactorSuffix = "Количество людей зараженный одним человеки: "
        static let buttonTitle = "Продолжить"
        static let seconds = " секунд"
    }
    
    private let titleLabel: VKLabel = .init(
        text: Constants.title,
        font: .systemFont(ofSize: 18, weight: .bold),
        color: .txt,
        textAlignment: .center
    )
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    private var groupSizeLabel: VKLabel = .init(
        font: .systemFont(ofSize: 12, weight: .semibold),
        color: .txt
    )
    
    private var totalTimeLabel: VKLabel = .init(
        font: .systemFont(ofSize: 12, weight: .semibold),
        color: .txt
    )
    
    private var timeIntervalLabel: VKLabel = .init(
        font: .systemFont(ofSize: 12, weight: .semibold),
        color: .txt
    )

    private let continueButton: VKButton = .init()
    
    init() {
        super.init()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: UserInputModel, totalTime: String) {
        groupSizeLabel.text = Constants.groupSizeSuffix + model.groupSize.description
        totalTimeLabel.text = Constants.timeLabelSuffix + totalTime
        timeIntervalLabel.text = Constants.timeIntervalSuffix + model.recalculationInfected.description + Constants.seconds
    }
    
    func setupUI() {
        layer.cornerRadius = 12
        addSubviews(titleLabel, continueButton, mainStackView)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(32)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(continueButton.snp.top).offset(-16)
        }
        
        mainStackView.addArrangedSubviews(
            groupSizeLabel,
            totalTimeLabel,
            timeIntervalLabel
        )
        
        continueButton.setTitle(Constants.buttonTitle, for: .normal)
        continueButton.backgroundColor = .main
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.addTarget(
            self, 
            action: #selector(continueDidTap),
            for: .touchUpInside
        )
    }
    
    @objc
    private func continueDidTap() {
        UIHelper.setRoot(DataCollectionRouter.createModule())
    }
    
}
