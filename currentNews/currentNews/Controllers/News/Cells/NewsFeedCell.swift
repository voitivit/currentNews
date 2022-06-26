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
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "НОВОСТИ"
        return label
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
        self.addSubview(label)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
        ])
    }
}
