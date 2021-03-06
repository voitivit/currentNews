//
//  NewsFeedView.swift
//  currentNews
//
//  Created by Margarita Novokhatskaia on 28/06/2022.
//

import UIKit

class NewsFeedView: UIView {
    
    var newsFeedEntry: Headline? {
        willSet(item) {
            guard let item = item
            else {
                self.titleLabel.text = "News title"
                self.sourceLabel.text = "Sourse"
                self.dateLabel.text = "Date"
                return
            }
            
            self.titleLabel.text = item.title
            self.sourceLabel.text = item.source.name
            
            guard let dateInFormat = dateFormatter.date(from: item.publishedAt) else { return }
            dateFormatter.dateFormat = "d MMM y"
            self.dateLabel.text = dateFormatter.string(from: dateInFormat)
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter
    }()
    
    // MARK: - Subviews
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor(red: 0.92, green: 0.93, blue: 0.95, alpha: 1.00).cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let sourceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
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
    
    // MARK: - Private Methods
    
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
