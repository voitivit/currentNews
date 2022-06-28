//
//  NewsFeedView.swift
//  currentNews
//
//  Created by Margarita Novokhatskaia on 28/06/2022.
//

import UIKit

class NewsFeedView: UIView {
    
    // MARK: - Subviews
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor(red: 0.92, green: 0.93, blue: 0.95, alpha: 1.00).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Population revealed in census shows it has grown by 6.3% in the last 10 years - Sky News"
        return label
    }()
    
    let sourceLabel: UILabel = {
        let label = UILabel()
        label.text = "Sourse"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = UIColor(red: 1.00, green: 0.50, blue: 0.48, alpha: 1.00)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [titleLabel, sourceLabel, dateLabel])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addViews()
        setupConstraints()
    }
    
    private func addViews() {
        addSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            sourceLabel.heightAnchor.constraint(equalToConstant: 24),
            dateLabel.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: containerView.topAnchor),
            image.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            image.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
}
