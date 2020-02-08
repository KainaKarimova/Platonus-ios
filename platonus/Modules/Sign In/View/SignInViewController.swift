//
//  SignInViewController.swift
//  platonus
//
//  Created by Karina Karimova on 10/17/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController {
  
  // MARK:- Properties
  
  var presenter: SignInPresentation?
  
  fileprivate lazy var enuLogo: UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "enuLogo")
    iv.contentMode = UIViewContentMode.scaleAspectFill
    iv.clipsToBounds = true
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  fileprivate lazy var iinInput: TextInputView = {
    let view = TextInputView()
    view.iconImage = #imageLiteral(resourceName: "profile")
    view.inputTextField.placeholder = Constants.SignIn.enterIIN
    view.type = .iin
    view.textfieldDelegate = self
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  fileprivate lazy var passwordInput: TextInputView = {
    let view = TextInputView()
    view.iconImage = #imageLiteral(resourceName: "lock")
    view.inputTextField.placeholder = Constants.SignIn.password
    view.type = .password
    view.isUserInteractionEnabled = true
    view.inputTextField.isSecureTextEntry = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  fileprivate lazy var signInButton: UIButton = {
    let button = UIButton()
    button.setTitle(Constants.SignIn.signIn, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addShadow(cornerRadius: 10.0)
    button.titleLabel?.font = Fonts.playBold?.withSize(18.0)
    button.backgroundColor = DesignUtil.platonusThemeBlue()
    button.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  // MARK:- Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Colors.mainBackgroundColor
    configureViews()
    configureConstraints()
  }
  
  // MARK:- Setup
  
  fileprivate func configureViews() {
    [enuLogo, iinInput, passwordInput, signInButton].forEach {
      contentView.addSubview($0)
    }
  }
  
  fileprivate func configureConstraints() {
    [
      enuLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      enuLogo.widthAnchor.constraint(equalToConstant: 276.0),
      enuLogo.heightAnchor.constraint(equalToConstant: 109.0),
      enuLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60.0),
      
      iinInput.widthAnchor.constraint(equalToConstant: 269.0),
      iinInput.heightAnchor.constraint(equalToConstant: 52.0),
      iinInput.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      iinInput.topAnchor.constraint(equalTo: enuLogo.bottomAnchor, constant: 60.0),
      
      passwordInput.widthAnchor.constraint(equalToConstant: 269.0),
      passwordInput.heightAnchor.constraint(equalToConstant: 52.0),
      passwordInput.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      passwordInput.topAnchor.constraint(equalTo: iinInput.bottomAnchor, constant: 20.0),
      
      signInButton.widthAnchor.constraint(equalToConstant: 269.0),
      signInButton.heightAnchor.constraint(equalToConstant: 52.0),
      signInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      signInButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 30.0),
      
      contentView.bottomAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 40.0)
      ].forEach { $0.isActive = true }
  }
  
  // MARK:- Actions
  
  @objc func didTapSignIn() {
    print("Signing in")
    [iinInput.inputTextField, passwordInput.inputTextField].forEach {
      $0.resignFirstResponder()
    }
    
    presenter?.didTapSignIn(iin: iinInput.getText(), password: passwordInput.getText())
  }
  
}

extension SignInViewController: TextInputDelegate {
  func didChange(_ textInput: TextInputView) {
    
  }
  
  func didBeginEditing(_ textInput: TextInputView) {
    
  }
  
  func didFinishEditing(_ textInput: TextInputView) {
    
  }
}

extension SignInViewController: SignInView {
  // TODO: implement view output methods
}
