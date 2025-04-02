//
//  DropDownView.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//
//

import UIKit

class DropDownView: UIView {
    
    lazy var dropdownButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .clear
        config.image = UIImage(systemName: "chevron.down")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.cornerStyle = .medium
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 5, weight: .regular)
        let button = UIButton(configuration: config)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        return button
    }()
    
    var users:[UserModal] = [] {
        didSet {
            configureMenu()
        }
    }
    
    var getSelectedUser: ((UserModal) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(dropdownButton)
        dropdownButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropdownButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            dropdownButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            dropdownButton.topAnchor.constraint(equalTo: topAnchor),
            dropdownButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        dropdownButton.showsMenuAsPrimaryAction = true
        
    }
    
    private func configureMenu() {
        let userMenuActions = users.map { user in
            UIAction(title:user.name){ _ in
                self.dropdownButton.setTitle(user.name, for: .normal)
                self.getSelectedUser?(user)
            }}
        let menu = UIMenu(children: userMenuActions)
        dropdownButton.menu = menu
        self.dropdownButton.setTitle(users.first?.name, for: .normal)
        if let user = users.first {
            getSelectedUser?(user)
        }
    }
    
    
}

