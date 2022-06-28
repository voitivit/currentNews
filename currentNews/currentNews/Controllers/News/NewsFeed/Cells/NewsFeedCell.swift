//
//  NewsFeedCell.swift
//  currentNews
//
//  Created by Lewis on 26.06.2022.
//

import UIKit

final class NewsFeedCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsFeedCell"
    
    // MARK: - Subviews
    
    let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Here will be title"
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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [titleLabel, sourceLabel, dateLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        addViews()
        setupConstraints()
    }
    
    private func addViews() {
        addSubview(image)
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        let margins = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: margins.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
}
