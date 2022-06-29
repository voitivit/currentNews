//
//  NewsFeedHeaderView.swift
//  currentNews
//
//  Created by Margarita Novokhatskaia on 29/06/2022.
//

import UIKit

class NewsFeedHeaderView: UIView {
    
    var buttonHeandler: (() -> Void)?
    
    // MARK: - Subviews
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = AppLayout.Images.smallLogo
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.layer.borderWidth = 2
        image.layer.borderColor = AppLayout.Colors.mainPink.cgColor
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppLayout.Fonts.mediumBold
        label.textColor = AppLayout.Colors.darkBlue
        label.text = Text.currentNews
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = AppLayout.Colors.lightestPink
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.imageView?.tintColor = AppLayout.Colors.mainPink
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = AppLayout.Colors.background
        
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
        setupConstraints()
        addButtonAction()
    }
    
    private func addViews() {
        addSubview(image)
        addSubview(label)
        addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            image.heightAnchor.constraint(equalToConstant: 40),
            image.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 18)
        ])
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            button.heightAnchor.constraint(equalToConstant: 38),
            button.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func addButtonAction() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        buttonHeandler?()
    }
}
