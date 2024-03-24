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

private struct Constants {
    static var itemSize = 32
    static let maxItemSize = 48
    static let minItemSize = 12
    static var itemSpacing = 10.0
}

final class DashboardViewController: UIViewController {
	var presenter: DashboardPresenterProtocol?
    
    private let emptyTopView: VKView = .init()
    private let statisticsView: DashboardStatisticsView = .init()
    private let playView: PlayView = .init()

    private lazy var zoomButtonsView: ZoomButtonsView = .init()
    
    lazy private var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.estimatedItemSize = CGSize(width: Constants.itemSize, height: Constants.itemSize)
        layout.minimumLineSpacing = Constants.itemSpacing
           layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(GeneralCell.self)
        return collectionView
    }()
    
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupUI()
    }
    
    func configureStatisticsView(with model: EpidemicOverallStatistic) {
        statisticsView.configure(with: model)
    }
}

private extension DashboardViewController {
    func setupUI() {
        view.backgroundColor = .dashboardBackground
        
        view.addSubviews(
            emptyTopView,
            statisticsView,
            collectionView,
            playView,
            zoomButtonsView
        )
        
        emptyTopView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        statisticsView.snp.makeConstraints { make in
            make.top.equalTo(emptyTopView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
    
        collectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(statisticsView.snp.bottom).offset(16)
            make.bottom.equalTo(playView.snp.top)
            make.leading.trailing.equalToSuperview()
        }

        zoomButtonsView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
        
        playView.snp.makeConstraints { make in
            make.height.equalTo(85)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        zoomButtonsView.delegate = self
    }
}

// MARK: - DashboardViewProtocol
extension DashboardViewController: DashboardViewProtocol {
    func update() {
        collectionView.reloadData()
    }
    
    func updateTimer(with text: String) {
        statisticsView.updateTimer(with: text)
    }
    
    func updateMainStatistic(uninfected: String, infected: String) {
        statisticsView.updateMainStatistic(uninfected: uninfected, infected: infected)
    }
    
    func updateProgressView(_ progress: Float) {
        playView.updateProgress(progress)
    }
    
    func end(with model: SimulationEndModel) {
        collectionView.isUserInteractionEnabled = false
        let endView = SimulationEndView()
        view.addSubview(endView)
        UIView.animate(withDuration: 0.3) {
            endView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            endView.layoutIfNeeded()
        }
        endView.configure(with: model)
    }
}

// MARK: - UICollectionViewDataSource
extension DashboardViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter?.entities.count ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        presenter?.entities[section].count ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let presenter else { return UICollectionViewCell() }
        let cell: GeneralCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(entity: presenter.entities[indexPath.section][indexPath.row])
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension DashboardViewController: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        presenter?.select(at: indexPath)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: Constants.itemSize, height: Constants.itemSize)
    }
}

extension DashboardViewController: ZoomButtonsViewDelegate {
    func zoomInDidTap() {
        guard Constants.itemSize < Constants.maxItemSize else { return }
        
        Constants.itemSize += 1
        Constants.itemSpacing += 0.3
        updateCellConstraints(with: Constants.itemSize)
        updateCollectionViewLayout()
    }

    func zoomOutDidTap() {
        guard Constants.itemSize > Constants.minItemSize else { return }
        
        Constants.itemSize -= 1
        Constants.itemSpacing -= 0.3
        updateCellConstraints(with: Constants.itemSize)
    }

    func updateCellConstraints(with size: Int) {
        collectionView.visibleCells.forEach { cell in
            if let generalCell = cell as? GeneralCell {
                generalCell.updateConstraints(with: size)
            }
        }
        updateCollectionViewLayout()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func updateCollectionViewLayout() {
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
           layout?.minimumLineSpacing = Constants.itemSpacing
    }
}
