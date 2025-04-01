//
//  AddPostViewController.swift
//  SocialPost
//
//  Created by sangam pokharel on 01/04/2025.
//

import UIKit

class CreatePostViewController: UIViewController {

    //MARK: Properties
    
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var circularImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile.first")
        imageView.contentMode = .scaleAspectFill
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.layer.cornerRadius = 25
        imageView.layer.cornerCurve = .continuous
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Sangam"
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userNameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.text = "@sangam"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textEditor:UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.text = "Type here..."
        textView.backgroundColor = .clear
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.systemGray.cgColor
        textView.layer.cornerRadius = 8
        textView.textColor = .white
        textView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var imageView:UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "photo")
        imgView.tintColor = .white
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleImageTapped)))
        
        return imgView
    }()
    
    var isPostValid: Bool {
        return !(textEditor.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || textEditor.text == "Type here...")
               || imageView.image != UIImage(systemName: "photo")
    }

    
    //MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#192734")
        setUpNavBar()
        setUpViews()
    }
    
    //MARK: SetUp
    private func setUpNavBar() {
        self.navigationItem.title = "Create Post"
        self.navigationController?.navigationBar.titleTextAttributes = [
               .foregroundColor: UIColor.white
        ]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(handleCancelTapped))
        
        let postButton = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(handlePostTapped))
        postButton.isEnabled = false
        self.navigationItem.rightBarButtonItem = postButton
    }

    private func setUpViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(circularImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(textEditor)
        contentView.addSubview(imageView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            circularImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            circularImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            nameLabel.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: circularImageView.topAnchor),

            userNameLabel.leadingAnchor.constraint(equalTo: circularImageView.trailingAnchor, constant: 8),
            userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),

            textEditor.topAnchor.constraint(equalTo: circularImageView.bottomAnchor, constant: 10),
            textEditor.leadingAnchor.constraint(equalTo: circularImageView.leadingAnchor),
            textEditor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            textEditor.heightAnchor.constraint(equalToConstant: 250),
          
            
            imageView.topAnchor.constraint(equalTo: textEditor.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        
        ])
    }
  
    
    //MARK: Functionalities
    @objc private func handleCancelTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func handlePostTapped() {
        // update mock data and reload tableview in previous view
        self.dismiss(animated: true)
    }
    
    @objc private func handleImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true // Allow user to crop the image
        present(imagePicker, animated: true)
    }
    
    private func updatePostButtonState() {
        navigationItem.rightBarButtonItem?.isEnabled = isPostValid
    }

    
}

extension CreatePostViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        updatePostButtonState()
    }

}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            imageView.image = selectedImage // Display selected image
        } else if let originalImage = info[.originalImage] as? UIImage {
            imageView.image = originalImage
        }
        picker.dismiss(animated: true)
        updatePostButtonState()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
