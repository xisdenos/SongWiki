//
//  RegisterView.swift
//  SongWiki
//
//  Created by Franklin  Stilhano on 8/20/22.
//

import UIKit


class RegisterView: UIView {
    
    public var backButtonPopNavigation: (() -> Void)?
    private var viewModel: RegistrationViewModel = RegistrationViewModel()
    
    lazy var gradient: UIView =  {
        let view = GradientView(colors: [UIColor.systemPurple.cgColor, UIColor(red: 153/255, green: 0/255, blue: 51/255, alpha: 1).cgColor])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backButton: UIButton = {
       let button = BackButton()
        button.addTarget(self, action: #selector(backButtonControl), for: .touchUpInside)
        return button
    }()
    
    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mello")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameTextField:UITextField = {
        let tx = CustomTF(placeholder: "Digite seu Nome:", isSecure: false)
        return tx
    }()
    
    lazy var emailTextField:UITextField = {
        let tx = CustomTF(placeholder: "Digite seu E-mail:", isSecure: false)
        return tx
    }()
    
    lazy var passwordTextField:UITextField = {
        let tx = CustomTF(placeholder: "Digite sua Senha:", isSecure: true)
        return tx
    }()
    
    lazy var checkPasswordTextField:UITextField = {
        let tx = CustomTF(placeholder: "Digite novamente sua Senha:", isSecure: true)
        return tx
    }()
    
    lazy var registerButton:UIButton = {
       let button = AuthButton(placeholder: "Cadastrar-se")
        return button
    }()
    
    //MARK: - Delegates
    
    func configTextFieldDelegates(delegate: UITextFieldDelegate) {
        self.nameTextField.delegate = delegate
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.checkPasswordTextField.delegate = delegate
    }
    
    //MARK: - Notifications
    
    func configureNotificators() {
        nameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        checkPasswordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    
    //MARK: - OBJC functions
    
    @objc func textDidChange(_ sender: UITextField) {
        switch sender {
        case nameTextField: viewModel.user = sender.text
        case emailTextField: viewModel.email = sender.text
        case passwordTextField: viewModel.password = sender.text
        case checkPasswordTextField: viewModel.passwordConfirmation = sender.text
        default:
            print("Deu ruim")
        }
        updateForm()
    }
    
    @objc func backButtonControl() {
        self.backButtonPopNavigation?()
    }
    
    //MARK: - Helpers
    
    private func updateForm() {
        registerButton.isEnabled = viewModel.shouldEnableButton
        registerButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        registerButton.backgroundColor = viewModel.buttonBackgroundColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.setUpConstraints()
    }
    
    func configSuperView(){
        self.addSubview(gradient)
        self.addSubview(iconImage)
        self.addSubview(backButton)
        self.addSubview(nameTextField)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(checkPasswordTextField)
        self.addSubview(registerButton)
        self.configureNotificators()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            self.gradient.topAnchor.constraint(equalTo: self.topAnchor),
            self.gradient.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.gradient.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gradient.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            self.backButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.backButton.heightAnchor.constraint(equalToConstant: 50),
            self.backButton.widthAnchor.constraint(equalToConstant: 30),
        
            self.iconImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30),
            self.iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: -10),
            self.iconImage.heightAnchor.constraint(equalToConstant: 130),
            self.iconImage.widthAnchor.constraint(equalToConstant: 130),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.iconImage.bottomAnchor,constant: 20),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor,constant: 15),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.checkPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,constant:15),
            self.checkPasswordTextField.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.checkPasswordTextField.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.checkPasswordTextField.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.checkPasswordTextField.bottomAnchor,constant: 30),
            self.registerButton.leadingAnchor.constraint(equalTo: self.checkPasswordTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.checkPasswordTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.checkPasswordTextField.heightAnchor),
                ])
    }
}
