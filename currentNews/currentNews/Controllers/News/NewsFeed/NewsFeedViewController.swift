//
//  NewsFeedViewController.swift
//  currentNews
//
//  Created by emil kurbanov on 11.06.2022.
//

import UIKit

final class NewsFeedViewController: UIViewController {
    
    var presenter: NewsFeedPresenter?
    
    private var newsFeedView: NewsFeedContentView {
        return self.view as! NewsFeedContentView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = NewsFeedContentView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTableView()
        presenter?.getMainFeed()
    }
    
    // MARK: - Private Methods
    
    private func setupNavBar() {
        title = "News"
        navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        newsFeedView.tableView.dataSource = self
        newsFeedView.tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension NewsFeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.headlines.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.reuseIdentifier,
                                                       for: indexPath) as? NewsFeedCell,
              let headlines = presenter?.headlines
                
        else { return NewsFeedCell() }
        
        cell.configure(model: headlines[indexPath.row])
        
        return cell
    }
}

extension NewsFeedViewController: NewsFeedInput {
    
    func reloadController() {
        DispatchQueue.main.async {
            self.newsFeedView.tableView.reloadData()
        }
    }
}
