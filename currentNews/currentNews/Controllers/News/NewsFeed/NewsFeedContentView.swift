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
        tv.separatorStyle = UITableViewCell.SeparatorStyle.none
        tv.rowHeight = UITableView.automaticDimension
        tv.rowHeight = 150
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
        backgroundColor = .white
        addViews()
        setupConstraints()
    }
    
    private func addViews() {
        self.addSubview(tableView)
    }
    
    private func setupConstraints() {
        let margins = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
}
