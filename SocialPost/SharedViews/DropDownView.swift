//
//  DropDownView.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//
//
//  DropDownView.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

class DropDownView: UIView {
    
    lazy var dropdownButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        config.title = "Select Item"
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .clear
        config.image = UIImage(systemName: "chevron.down")
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.cornerStyle = .medium
        
        // Reduce the size of the icon
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 12, weight: .regular)

        let button = UIButton(configuration: config, primaryAction: UIAction { _ in
            self.handleBtnTapped()
        })

        // Apply circular border with corner radius 8
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true // Ensures proper corner radius clipping

        return button
    }()

    
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
        
    }
    
    private func configureMenu() {
        let option1 = UIAction(title: "John", image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
            print("Selected Option 1")
            self.dropdownButton.setTitle("Option 1 ⬇️", for: .normal)
        }
        
        let option2 = UIAction(title: "Mary", image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
            print("Selected Option 2")
            self.dropdownButton.setTitle("Option 2 ⬇️", for: .normal)
        }
        
        let option3 = UIAction(title: "Aryan", image: nil, identifier: nil, discoverabilityTitle: nil, state: .off) { _ in
            print("Selected Option 3")
            self.dropdownButton.setTitle("Option 3 ⬇️", for: .normal)
        }
        
        let menu = UIMenu(title: "", options: .displayInline, children: [option1, option2, option3])
        
        dropdownButton.menu = menu
        dropdownButton.showsMenuAsPrimaryAction = true
    }
    
    @objc private func handleBtnTapped() {
        configureMenu()
    }
}
