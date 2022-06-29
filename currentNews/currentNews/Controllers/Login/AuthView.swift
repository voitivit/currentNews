//
//  AuthView.swift
//  currentNews
//
//  Created by Margarita Novokhatskaia on 19/06/2022.
//

import UIKit

class AuthView: UIView {
    
    var goButtonHandler: ((String?, String?) -> Void)?
    var passwordRecoveryButtonHandler: ((String?) -> Void)?
    var isAccountExist: Bool = false
    
    // MARK: - Private Properties
    
    
    
    // MARK: - Subviews
    
    private var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AppLayout.Fonts.bigBold
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = AppLayout.Fonts.regularBold
        label.text = Text.email
        label.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameStarLabel: UILabel = {
        let label = UILabel()
        label.font = AppLayout.Fonts.regularBold
        label.textColor = UIColor.red
        label.text = Text.starSimbol
        label.setContentHuggingPriority(.init(rawValue: 250), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.font = AppLayout.Fonts.regularBold
        label.text = Text.password
        label.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordStarLabel: UILabel = {
        let label = UILabel()
        label.font = AppLayout.Fonts.regularBold
        label.textColor = UIColor.red
        label.text = Text.starSimbol
        label.setContentHuggingPriority(.init(rawValue: 250), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let goButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = AppLayout.Fonts.regularBold
        button.tintColor = .white
        button.backgroundColor = AppLayout.Colors.mainPink
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let passwordRecoveryButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = AppLayout.Fonts.regularBold
        button.setTitle(Text.forgotPassword, for: .normal)
        button.tintColor = AppLayout.Colors.mainPink
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let accountStateLabel: UILabel = {
        let label = UILabel()
        label.font = AppLayout.Fonts.regularBold
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let accountStateButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = AppLayout.Fonts.regularBold
        button.contentHorizontalAlignment = .left
        button.tintColor = AppLayout.Colors.mainPink
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var usernameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [usernameLabel, usernameStarLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [passwordLabel, passwordStarLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var accountStateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [accountStateLabel, accountStateButton])
        stack.axis = .horizontal
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var accountStateView: UIView = {
        let view = UIView()
        view.addSubview(accountStateStackView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews:
                                    [titleLabel,
                                     usernameStackView,
                                     usernameTextField,
                                     passwordStackView,
                                     passwordTextField,
                                     goButton])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        backgroundColor = .white
        addSubview(image)
        addSubview(stackView)
        addSubview(passwordRecoveryButton)
        addSubview(accountStateView)
        image.image = UIImage(named: AppLayout.Images.bigLogo)
        setupConstraints()
        setupSignText()
        setButtonsAction()
    }
    
    private func setupConstraints() {
        
        let margins = layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: margins.topAnchor),
            image.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
    ])
    
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: image.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 160),
            image.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            goButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            passwordRecoveryButton.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            passwordRecoveryButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            passwordRecoveryButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            passwordRecoveryButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            accountStateView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            accountStateView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            accountStateView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            accountStateStackView.centerXAnchor.constraint(equalTo: accountStateView.centerXAnchor),
            accountStateStackView.topAnchor.constraint(equalTo: accountStateView.topAnchor),
            accountStateStackView.bottomAnchor.constraint(equalTo: accountStateView.bottomAnchor),
        ])
    }
    
    private func setupSignText() {
        if isAccountExist {
            titleLabel.text = Text.letsSignIn
            goButton.setTitle(Text.signIn, for: .normal)
            accountStateLabel.text = Text.dontHaveAccount
            accountStateButton.setTitle(Text.signUp, for: .normal)
            
            passwordRecoveryButton.isHidden = false
        } else {
            titleLabel.text = Text.createAccount
            goButton.setTitle(Text.signUp, for: .normal)
            accountStateLabel.text = Text.haveAccount
            accountStateButton.setTitle(Text.signIn, for: .normal)
            
            passwordRecoveryButton.isHidden = true
        }
    }
    
    private func setButtonsAction() {
        accountStateButton.addTarget(self, action: #selector(toogleAccountState), for: .touchUpInside)
        goButton.addTarget(self, action: #selector(self.goButtonPressed), for: .touchUpInside)
        passwordRecoveryButton.addTarget(self, action: #selector(self.passwordRecoveryButtonPressed), for: .touchUpInside)
    }
    
    @objc private func goButtonPressed() {
        goButtonHandler?(self.usernameTextField.text, self.passwordTextField.text)
    }
    
    @objc private func passwordRecoveryButtonPressed() {
        passwordRecoveryButtonHandler?(self.usernameTextField.text)
    }
    
    @objc private func toogleAccountState() {
        isAccountExist.toggle()
        setupSignText()
    }
}
