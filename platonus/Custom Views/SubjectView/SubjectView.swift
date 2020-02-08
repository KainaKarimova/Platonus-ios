//
//  GradesView.swift
//  platonus
//
//  Created by Karina Karimova on 10/19/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation
import UIKit

class SubjectView: BaseView {
  
  // MARK:- Properties
  
  fileprivate lazy var nameFrame: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
    view.layer.borderColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0).cgColor
    view.layer.borderWidth = 1
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  fileprivate lazy var chevron: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.image = #imageLiteral(resourceName: "chevron-right")
    iv.clipsToBounds = true
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  fileprivate lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textColor = .black
    label.font = Fonts.playRegular?.withSize(16)
    label.text = "Математическое и компьютерное моделирование"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  fileprivate lazy var colorViews: [UIView] = {
    var views = [UIView]()
    for i in 0 ..< categoriesData.count {
      let view = UIView()
      view.backgroundColor = i % 2 == 0 ? UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0) : UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
      view.translatesAutoresizingMaskIntoConstraints = false
      views.append(view)
    }
    return views
  }()
  
  fileprivate let categoriesData = ["Лекции", "Сро", "Практика"]
  
  fileprivate lazy var categoriesLabels: [UILabel] = {
    var labels = [UILabel]()
    for category in categoriesData {
      let label = UILabel()
      label.numberOfLines = 1
      label.textColor = .black
      label.font = Fonts.playRegular?.withSize(16)
      label.text = category
      label.translatesAutoresizingMaskIntoConstraints = false
      labels.append(label)
    }
    return labels
  }()
  
  // MARK:- Setup
  
  override func setupView() {
    super.setupView()
    addShadow()
    layer.cornerRadius = 5
    backgroundColor = .white
    
    configureViews()
    configureConstraints()
  }
  
  func configureViews() {
    [nameFrame, chevron, nameLabel].forEach {
      addSubview($0)
    }
    colorViews.forEach {
      addSubview($0)
    }
    categoriesLabels.forEach {
      addSubview($0)
    }
  }
  
  func configureConstraints() {
    [
      nameFrame.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11.0),
      nameFrame.topAnchor.constraint(equalTo: topAnchor, constant: 11.0),
      nameFrame.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11.0),
      
      chevron.widthAnchor.constraint(equalToConstant: 27.0),
      chevron.heightAnchor.constraint(equalToConstant: 27.0),
      chevron.centerYAnchor.constraint(equalTo: nameFrame.centerYAnchor),
      chevron.trailingAnchor.constraint(equalTo: nameFrame.trailingAnchor, constant: -5.0),
      
      nameLabel.leadingAnchor.constraint(equalTo: nameFrame.leadingAnchor, constant: 12.0),
      nameLabel.topAnchor.constraint(equalTo: nameFrame.topAnchor, constant: 10.0),
      nameLabel.bottomAnchor.constraint(equalTo: nameFrame.bottomAnchor, constant: -10.0),
      nameLabel.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -12.0),
      
      colorViews[0].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11.0),
      colorViews[0].topAnchor.constraint(equalTo: nameFrame.bottomAnchor, constant: 8.0),
      colorViews[0].trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11.0),
      colorViews[0].heightAnchor.constraint(equalToConstant: 37.0),
      
      categoriesLabels[0].leadingAnchor.constraint(equalTo: colorViews[0].leadingAnchor, constant: 8.0),
      categoriesLabels[0].centerYAnchor.constraint(equalTo: colorViews[0].centerYAnchor),
      categoriesLabels[categoriesLabels.count - 1].bottomAnchor.constraint(equalTo: bottomAnchor, constant: -27.0)
      ].forEach { $0.isActive = true }
    
    for i in 1 ..< categoriesLabels.count {
      [
        colorViews[i].leadingAnchor.constraint(equalTo: colorViews[i-1].leadingAnchor),
        colorViews[i].topAnchor.constraint(equalTo: colorViews[i-1].bottomAnchor),
        colorViews[i].trailingAnchor.constraint(equalTo: colorViews[i-1].trailingAnchor),
        colorViews[i].heightAnchor.constraint(equalTo: colorViews[i-1].heightAnchor),
        
        categoriesLabels[i].leadingAnchor.constraint(equalTo: categoriesLabels[i-1].leadingAnchor),
        categoriesLabels[i].centerYAnchor.constraint(equalTo: colorViews[i].centerYAnchor)
        ].forEach { $0.isActive = true }
    }
  }
  
  // MARK:- Actions
  
}
