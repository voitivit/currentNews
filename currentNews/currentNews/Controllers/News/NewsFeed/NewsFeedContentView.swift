//
//  NewsFeedContentView.swift
//  currentNews
//
//  Created by Lewis on 26.06.2022.
//

import UIKit

final class NewsFeedContentView: UIView {
    
    // MARK: - Subviews
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.rowHeight = UITableView.automaticDimension
        tv.rowHeight = 60
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(NewsFeedCell.self, forCellReuseIdentifier: NewsFeedCell.reuseIdentifier)
        return tv
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        addViews()
        setupConstraints()
    }
    
    private func addViews() {
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
