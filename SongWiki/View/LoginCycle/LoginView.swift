//
//  LoginView.swift
//  SongWiki
//
//  Created by Lucas Pinto on 19/08/22.
//

import UIKit

//criacao do protocolo -------------
protocol LoginViewProtocol: AnyObject{
    func actionRegisterButton()
    func actionEsqueceuSenhaButton()
}

class LoginView: UIView {
    

    var viewModel: LoginViewModel = LoginViewModel()
    
    //MARK: - Components

    // criacao do delgate  -----------------
    private weak var delegate:LoginViewProtocol?
    
    
    lazy var gradient: UIView =  {
        let view = GradientView(colors: [UIColor.systemPurple.cgColor, UIColor(red: 153/255, green: 0/255, blue: 51/255, alpha: 1).cgColor])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mello")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var loginTextField: UITextField = {
        let tf = CustomTF(placeholder: "Email", isSecure: false)
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = CustomTF(placeholder: "Senha", isSecure: true)
        tf.keyboardType = .default
        return tf
    }()
    
    lazy var logInButton: UIButton = {
        let button = AuthButton(placeholder: "LogIn")
        button.isEnabled = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Adicionando acao do botaoo ---------------------
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    
    lazy var forgottenPasswordButton: UIButton = {
        let button = AuthButton()
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: 15)]
        let attributedTitle = NSMutableAttributedString(string: "Esqueceu sua senha? ", attributes: atts)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 15)]
        attributedTitle.append(NSAttributedString(string: "Clique aqui!", attributes: boldAtts))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0)
        button.translatesAutoresizingMaskIntoConstraints = false

        // Adicionando acao do botaoo ---------------------
        button.addTarget(self, action: #selector(self.tappedEsqueceuSenhaButton), for: .touchUpInside)
        return button
    }()
    
    lazy var divider: DividerView = {
        let divider = DividerView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    lazy var googleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "google"), for: .normal)
        button.setTitle(" LogIn com Google", for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    lazy var noAccountButton: UIButton = {
        let button = AuthButton()
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: 15)]
        let attributedTitle = NSMutableAttributedString(string: "Não tem uma conta? ", attributes: atts)
        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: 15)]
        attributedTitle.append(NSAttributedString(string: "Registre-se", attributes: boldAtts))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = UIColor(white: 1, alpha: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - StackViews
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.addArrangedSubview(loginTextField)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(logInButton)
        stack.distribution = .fillEqually
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    lazy var secondStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 28
        stack.addArrangedSubview(forgottenPasswordButton)
        stack.addArrangedSubview(divider)
        stack.addArrangedSubview(googleButton)
        stack.distribution = .fillEqually
        stack.isUserInteractionEnabled = true
        return stack
    }()
    

    //MARK: - Delegates
    
    public func configTextFieldDelegates(delegate: UITextFieldDelegate) {
        self.loginTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    func delegate(delegate:LoginViewProtocol?) {
        self.delegate = delegate
    }
    
    //MARK: - Notificators
    
    func configureNotificators() {
        loginTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    //MARK: - OBJC functions
    
    @objc func textDidChange(_ sender: UITextField) {
        if sender == loginTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        updateForm()
    }
    
    // Metedos de ativacao do botao ------------------------
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
            }
    @objc private func tappedLoginButton(){
        //To-Do
            }
    @objc private func tappedEsqueceuSenhaButton(){
        self.delegate?.actionEsqueceuSenhaButton()
            }
    
    //MARK: - Helpers
    
    private func updateForm() {
        logInButton.isEnabled = viewModel.shouldEnableButton
        logInButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        logInButton.backgroundColor = viewModel.buttonBackgroundColor
    }


    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.gradient)
        self.addSubview(self.iconImage)
        self.addSubview(self.stackView)
        self.addSubview(self.secondStackView)
        self.addSubview(self.noAccountButton)
        self.configureNotificators()
        self.configConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: -Constraints

    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.gradient.topAnchor.constraint(equalTo: self.topAnchor),
            self.gradient.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.gradient.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.gradient.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -10),
            self.iconImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            self.iconImage.widthAnchor.constraint(equalToConstant: 125),
            self.iconImage.heightAnchor.constraint(equalToConstant: 125),
            
            self.stackView.topAnchor.constraint(equalTo: self.iconImage.bottomAnchor, constant: 20),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            self.loginTextField.heightAnchor.constraint(equalToConstant: 40),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            self.logInButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.secondStackView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 20),
            self.secondStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            self.secondStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            self.noAccountButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.noAccountButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10)

        ])
    }
}
