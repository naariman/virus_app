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
        static let groupSizeSuffix = "Количество людей: "
        static let totalTimeLabelSuffix = "Общее время заражения: "
        static let updateFrequencySuffix = "Частота обновления: "
        static let infectedWithTapSuffix = "Количество зараженных нажатием: "
        static let infectionByOne = "Зараженные одним: "
        static let buttonTitle = "Завершить"
        static let seconds = " секунд(а)"
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
    
    private var updateFrequencyLabel: VKLabel = .init(
        font: .systemFont(ofSize: 12, weight: .semibold),
        color: .txt
    )
    
    private var infectedWithTapLabel: VKLabel = .init(
        font: .systemFont(ofSize: 12, weight: .semibold),
        color: .txt
    )
    
    private var infectionByOneLabel: VKLabel = .init(
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
    
    func configure(with model: SimulationEndModel) {
        groupSizeLabel.text = Constants.groupSizeSuffix + model.userInputModel.groupSize.description
        totalTimeLabel.text = Constants.totalTimeLabelSuffix + model.totalTime
        updateFrequencyLabel.text = Constants.updateFrequencySuffix + model.userInputModel.recalculationInfected.description + Constants.seconds
        infectedWithTapLabel.text = Constants.infectedWithTapSuffix + model.tapAmount.description
        infectionByOneLabel.text = Constants.infectionByOne + model.userInputModel.infectionFactor.description
    }
    
    func setupUI() {
        clipsToBounds = false
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.txt.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 15
        addSubviews(titleLabel, continueButton, mainStackView)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(continueButton.snp.top).offset(-16)
        }
        
        mainStackView.addArrangedSubviews(
            groupSizeLabel,
            totalTimeLabel,
            updateFrequencyLabel,
            infectedWithTapLabel,
            infectionByOneLabel
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
