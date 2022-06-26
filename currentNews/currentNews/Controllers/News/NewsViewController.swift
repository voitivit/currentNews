//
//  NewsViewController.swift
//  currentNews
//
//  Created by emil kurbanov on 11.06.2022.
//

import UIKit

final class NewsViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    private var newsFeedView: NewsContentView {
        return self.view as! NewsContentView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = NewsContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        newsFeedView.tableView.dataSource = self
        newsFeedView.tableView.delegate = self
    }
    
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.reuseIdentifier, for: indexPath)
        
        return cell
    }
}
