//
//  SignInPresenter.swift
//  platonus
//
//  Created by Karina Karimova on 10/17/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

class SignInPresenter: CommonPresenter {
  
  // MARK: Properties
  
  weak var view: SignInView?
  var router: SignInWireframe?
  var interactor: SignInUseCase?
  let signInManager = SignInManager()
  let fetcher = SubjectsFetcher()
}

extension SignInPresenter: SignInPresentation {
  // TODO: implement presentation methods
  func refresh() {
    
  }
  func didTapLeftButton() {
    router?.popBack()
  }
  
  func didTapSignIn(iin: String, password: String) {
    view?.showActivityIndicator()
    signInManager.delegate = self
    signInManager.signIn(iin: iin, pass: password)
  }
}

extension SignInPresenter: SignInManagerDelegate {
  func success() {
    print("success")
    view?.showSuccess()
//    fetcher.delegate = self
//    fetcher.fetchSubjects()
    router?.showGrades()
  }
  
  func fail() {
    print("Fail")
    view?.showError(with: "Неверный ИИН или пароль")
  }
  
  
}

extension SignInPresenter: SubjectsFetcherDelegate {
  func gotSubjects(subjects: [Subject]) {
    for subject in subjects {
      print("Title:", subject.title)
      print("Categories:")
      for category in subject.categories ?? [SubjectCategory]() {
        print("--Title code:",category.titleCode)
        print("--Title:", category.title)
        print("--r1Grades:",terminator: " ")
        for grade in category.r1grades! {
          print(grade,terminator: " ")
        }
        print()
        print("--r2Grades:",terminator: " ")
        for grade in category.r2grades! {
          print(grade,terminator: " ")
        }
        print()
        print("*********")
      }
      print("rk1:",subject.rk1)
      print("r1:",subject.r1)
      print("rk2:",subject.rk2)
      print("r2:",subject.r2)
      print("Coursework grade:", subject.courseworkGrade)
      print("Practice grade:", subject.practiceGrade)
      print("Research grade:", subject.researchGrade)
      print("Admittance rating:", subject.admittanceRating)
      print("Exam grade:", subject.examGrade)
      print("Final grade:", subject.finalGrade)
      print("---------------------")
    }
  }
  
  
}

extension SignInPresenter: SignInInteractorOutput {
  
  // TODO: implement interactor output methods
}
