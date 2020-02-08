//
//  TemplateViewController.swift
//  platonus
//
//  Created by Karina Karimova on 10/16/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import UIKit

class TemplateViewController: BaseViewController {
  
  // MARK:- Properties
  
  var presenter: TemplatePresentation?
  
  // MARK:- Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Colors.mainBackgroundColor
    configureViews()
    configureConstraints()
  }
  
  // MARK:- Setup
  
  fileprivate func configureViews() {
    [].forEach {
      contentView.addSubview($0)
    }
  }
  
  fileprivate func configureConstraints() {
//    [
//      contentView.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: 40.0)
//      ].forEach { $0.isActive = true }
  }
  
  // MARK:- Actions
  
}

extension TemplateViewController: TemplateView {
  // TODO: implement view output methods
}
