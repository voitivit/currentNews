//
//  NewsFeedCell.swift
//  currentNews
//
//  Created by Lewis on 26.06.2022.
//

import UIKit

final class NewsFeedCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsFeedCell"
    
    let view = NewsFeedView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Headline) {
        view.newsFeedEntry = model
    }
    
    // MARK: - UI
    
    private func configureUI() {
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
