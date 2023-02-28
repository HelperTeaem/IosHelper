//
//  MainController.swift
//  Helper
//
//  Created by Владислав Куликов on 26.02.2023.
//

import UIKit

final class MainController: BaseController {
    
    private lazy var collectionView: UICollectionView = {
            let collectionView: UICollectionView
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
            collectionView.backgroundColor = UIColor.white
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(CpuCell.self, forCellWithReuseIdentifier: CpuCell.identifier)
            collectionView.register(MotherbroadCell.self, forCellWithReuseIdentifier: MotherbroadCell.identifier)
        collectionView.backgroundColor = Resources.Colors.mainBackgroundColor
            collectionView.register(GpuCell.self, forCellWithReuseIdentifier: GpuCell.identifier)
            collectionView.register(RamCell.self, forCellWithReuseIdentifier: RamCell.identifier)
            collectionView.register(PowerCell.self, forCellWithReuseIdentifier: PowerCell.identifier)
            collectionView.register(SsdCell.self, forCellWithReuseIdentifier: SsdCell.identifier)
            collectionView.register(CoolerCpuCell.self, forCellWithReuseIdentifier: CoolerCpuCell.identifier)
            collectionView.register(CaseCell.self, forCellWithReuseIdentifier: CaseCell.identifier)
            collectionView.register(CaseCoolerCell.self, forCellWithReuseIdentifier: CaseCoolerCell.identifier)
            return collectionView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HELPER"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.main
        navigationController?.navigationBar.backgroundColor = Resources.Colors.mainGreen
        navigationController?.hidesBarsOnSwipe = true
        layoutCollectionView()
    }
    
    func layoutCollectionView () {
            view.addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
                view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
            ])
        }
}

extension MainController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2 - 5, height: view.frame.size.width/2 - 5)
    }
    
}

extension MainController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cpu = collectionView.dequeueReusableCell(withReuseIdentifier: arrayIdComponents[indexPath.item], for: indexPath)
        return cpu
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
}
