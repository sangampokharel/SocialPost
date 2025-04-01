//
//  MyPostViewController.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit
import SwiftUI


class ChildPostViewController: UIViewController {
    
    //MARK: Properties
    private lazy var postTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(hex: "#192734")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    var posts:[PostModel] = [] {
        didSet {
            populateData()
        }
    }
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#192734")
        setUp()
     
    }
    
    //MARK: SetUp
    private func setUp() {
        view.addSubview(postTableView)
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.topAnchor),
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        postTableView.separatorInset = .zero
    }
    
    
    //MARK: Functionalities
    func populateData() {
        postTableView.reloadData()
    }
    
   
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ChildPostViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") else {
            return UITableViewCell()
        }
        let post = posts[indexPath.row]
        cell.contentView.backgroundColor = UIColor(hex: "#192734")
        cell.contentConfiguration = UIHostingConfiguration(content: {
            PostCellView(post: post)
        }).margins(.all,.zero)
        
        return cell
    }
}

extension ChildPostViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //handle the case to navigate to post detail page
    }
}
