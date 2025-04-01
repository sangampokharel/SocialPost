//
//  PostsViewController.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

protocol PostView:AnyObject {
    func getAllUsers(users:[UserModal])
    func getAllPost(post:[PostModel])
    func getUserPosts(post:[PostModel])
}

class PostsViewController: UIViewController {
    
    //MARK: Properties
    var presenter:PostPresenterProtocol?
    
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var tabView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var indicatorView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 2.5
        view.layer.cornerCurve = .continuous
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var tabButtons: [UIButton] = []
    private var viewControllers: [UIViewController] = []
    private var selectedUser:UserModal?
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpTabs()
        setUpViewControllers()
        setUpObserver()
        presenter?.viewDidLoad()
    }
    
    
    //MARK: SetUp NavBar
    private func setUpDropDown(users:[UserModal]) {
        let dropDownView = DropDownView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        dropDownView.users = users
        dropDownView.getSelectedUser = { [weak self] user in
            self?.selectedUser = user
            self?.presenter?.getSelectedUser(user: user)
           
        }
        self.navigationItem.titleView = dropDownView
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(presentCreatePostViewController))
        if !users.isEmpty, let user = users.first {
            self.selectedUser = user
            presenter?.getSelectedUser(user: user)
            
        }
        
        
    }
    
    //MARK: SetUp Tabs
    private func setupUI() {
        view.backgroundColor = UIColor(hex: "#192734")
        view.addSubview(tabView)
        tabView.addSubview(indicatorView)
        view.addSubview(scrollView)
        scrollView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            tabView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabView.heightAnchor.constraint(equalToConstant: 50),
            
            scrollView.topAnchor.constraint(equalTo: tabView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            indicatorView.heightAnchor.constraint(equalToConstant: 4),
            indicatorView.bottomAnchor.constraint(equalTo: tabView.bottomAnchor),
            
        ])
    }
    
    private func setUpTabs() {
        tabButtons = Tabs.allCases.enumerated().map { index, title in
            let button = UIButton(type: .system)
            button.setTitle(title.rawValue, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            button.tag = index
            button.addTarget(self, action: #selector(tabTapped(_:)), for: .touchUpInside)
            return button
        }
        
        let tabStackView = UIStackView(arrangedSubviews: tabButtons)
        tabStackView.axis = .horizontal
        tabStackView.distribution = .fillEqually
        tabStackView.translatesAutoresizingMaskIntoConstraints = false
        tabStackView.backgroundColor = .clear
        tabView.addSubview(tabStackView)
        
        NSLayoutConstraint.activate([
            tabStackView.topAnchor.constraint(equalTo: tabView.topAnchor),
            tabStackView.leadingAnchor.constraint(equalTo: tabView.leadingAnchor),
            tabStackView.trailingAnchor.constraint(equalTo: tabView.trailingAnchor),
            tabStackView.bottomAnchor.constraint(equalTo: indicatorView.topAnchor)
        ])
        
        
        if let firstButton = tabButtons.first {
            NSLayoutConstraint.activate([
                indicatorView.leadingAnchor.constraint(equalTo: firstButton.leadingAnchor),
                indicatorView.widthAnchor.constraint(equalTo: firstButton.widthAnchor)
            ])
        }
        
    }
    
    
    private func setUpViewControllers() {
        viewControllers = [
            ChildPostViewController(),
            ChildPostViewController(),
        ]
        
        viewControllers.forEach { vc in
            addChild(vc)
            scrollView.addSubview(vc.view)
            vc.didMove(toParent: self)
        }
        
        scrollView.contentSize = CGSize(
            width: view.frame.width * CGFloat(viewControllers.count),
            height: scrollView.frame.height
        )
        
        for (index, vc) in viewControllers.enumerated() {
            vc.view.frame = CGRect(
                x: view.frame.width * CGFloat(index),
                y: 0,
                width: view.frame.width,
                height: scrollView.frame.height
            )
        }
        
        scrollView.delegate = self
    }
    
    //MARK: Functionalities
    private func updateIndicatorPosition(for index: Int) {
        guard index < tabButtons.count else { return }
        let selectedButton = tabButtons[index]
        
        UIView.animate(withDuration: 0.3) {
            self.indicatorView.frame.origin.x = selectedButton.frame.origin.x
            self.indicatorView.frame.size.width = selectedButton.frame.width
        }
    }
    
    @objc private func tabTapped(_ sender: UIButton) {
        let xOffset = view.frame.width * CGFloat(sender.tag)
        scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
        updateIndicatorPosition(for: sender.tag)
    }
    
    @objc private func presentCreatePostViewController() {
        if let selectedUser {
            presenter?.showCreateViewController(user: selectedUser)
        }
    }
    
    private func setUpObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notifyFetchPost(_:)),
                                               name: .fetchPost,
                                               object: nil)
    }
    
    @objc private func notifyFetchPost(_ notification: Notification) {
        if let selectedUser {
            presenter?.getSelectedUser(user: selectedUser)
        }
        presenter?.reloadPost()
        
    }
}


//MARK: Extensions
extension PostsViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(scrollView.contentOffset.x / view.frame.width))
        updateIndicatorPosition(for: pageIndex)
    }
}
extension PostsViewController:PostView {
  
    
    func getAllPost(post: [PostModel]) {
        if let vc = viewControllers.last as? ChildPostViewController {
            vc.posts = post
        }
    }
    
    func getAllUsers(users: [UserModal]) {
        setUpDropDown(users: users)
    }
    
    func getUserPosts(post: [PostModel]) {
        if let vc = viewControllers.first as? ChildPostViewController {
            vc.posts = post
        }
    }
}
