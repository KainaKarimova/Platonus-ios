//
//  Subject.swift
//  platonus
//
//  Created by Karina Karimova on 10/19/19.
//  Copyright © 2019 Karina Karimova. All rights reserved.
//

import Foundation

class SubjectCategory {
  var titleCode: String?
  var title: String?
  var r1grades: [String]?
  var r2grades: [String]?
  
  init(subjectString: [String], r1gradesCount: Int, r2gradesCount: Int) {
    titleCode = subjectString[0]
    if titleCode!.lowercased().last == "l" {
      title = "Лекции"
    }
    if titleCode!.lowercased().last == "p" {
      title = "Практика"
    }
    if titleCode!.lowercased().range(of:"-sro") != nil {
      title = "СРО"
    }
    if titleCode!.lowercased().range(of:"-lab") != nil {
      title = "Лабораторные"
    }
    r1grades = [String]()
    r2grades = [String]()
    for i in 0 ..< r1gradesCount {
      r1grades?.append(subjectString[i+1])
    }
    for i in 0 ..< r2gradesCount {
      let ind = r1gradesCount + i + 1
      r2grades?.append(subjectString[ind])
    }
  }
}

class Subject {
  var title: String?
  var categories: [SubjectCategory]?
  var scaleItems: [String]?
  var rk1: String?
  var r1: String?
  var rk2: String?
  var r2: String?
  var courseworkGrade: String?
  var practiceGrade: String?
  var researchGrade: String?
  var admittanceRating: String?
  var examGrade: String?
  var finalGrade: String?
  
  init(scaleItems: [String], content: [[String]]) {
    var firstRow = content[0]
    title = firstRow[0]
    firstRow.remove(at: 0)
    var rk1Ind = -1
    var r1Ind = -1
    var rk2Ind = -1
    var r2Ind = -1
    for i in scaleItems.indices {
      if scaleItems[i] == "РК1" {
        rk1Ind = i
      }
      if scaleItems[i] == "Р1" {
        r1Ind = i
      }
      if scaleItems[i] == "РК2" {
        rk2Ind = i
      }
      if scaleItems[i] == "Р2" {
        r2Ind = i
      }
    }
    let r1GradesCount = rk1Ind
    let r2GradesCount = rk2Ind - r1Ind - 1
    rk1 = firstRow[rk1Ind + 1]
    r1 = firstRow[r1Ind + 1]
    rk2 = firstRow[rk2Ind + 1]
    r2 = firstRow[r2Ind + 1]
    courseworkGrade = firstRow[r2Ind + 1 + 1]
    practiceGrade = firstRow[r2Ind + 1 + 2]
    researchGrade = firstRow[r2Ind + 1 + 3]
    admittanceRating = firstRow[r2Ind + 1 + 4]
    examGrade = firstRow[r2Ind + 1 + 5]
    finalGrade = firstRow[r2Ind + 1 + 6]
    var firstSubjectArray = [firstRow[0]]
    for i in 0 ..< rk1Ind {
      firstSubjectArray.append(firstRow[i+1])
    }
    for i in r1Ind+1 ..< rk2Ind {
      firstSubjectArray.append(firstRow[i+1])
    }
    
    categories = [SubjectCategory(subjectString: firstSubjectArray, r1gradesCount: r1GradesCount, r2gradesCount: r2GradesCount)]
    
    for i in 1 ..< content.count {
      let category = SubjectCategory(subjectString: content[i], r1gradesCount: r1GradesCount, r2gradesCount: r2GradesCount)
      categories?.append(category)
    }
    
  }
  
}
