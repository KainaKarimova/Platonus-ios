//
//  GradesViewController.swift
//  platonus
//
//  Created by Karina Karimova on 10/19/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import UIKit

class GradesViewController: BaseViewController {
  
  // MARK:- Properties
  
  var presenter: GradesPresentation?
  
  fileprivate lazy var subjectView: SubjectView = {
    let view = SubjectView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
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
    [subjectView].forEach {
      contentView.addSubview($0)
    }
  }
  
  fileprivate func configureConstraints() {
    [
      subjectView.widthAnchor.constraint(equalToConstant: 341.0),
      subjectView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      subjectView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      contentView.bottomAnchor.constraint(equalTo: subjectView.bottomAnchor, constant: 40.0)
      ].forEach { $0.isActive = true }
  }
  
  // MARK:- Actions
  
}

extension GradesViewController: GradesView {
  // TODO: implement view output methods
}
