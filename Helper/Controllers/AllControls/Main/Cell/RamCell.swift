//
//  RamCell.swift
//  Helper
//
//  Created by Владислав Куликов on 27.02.2023.
//

import UIKit

class RamCell: UICollectionViewCell {
    
    
    static let identifier = "RamCell"
    
    private lazy var cpu: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ram")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds  = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 23
        image.layer.borderColor = Resources.Colors.black.cgColor
        image.layer.borderWidth = 0.2
        return image
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            layoutTextField()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutTextField()  {
        contentView.addSubview(cpu)
        NSLayoutConstraint.activate([
            cpu.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cpu.topAnchor.constraint(equalTo: contentView.topAnchor),
            cpu.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cpu.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

