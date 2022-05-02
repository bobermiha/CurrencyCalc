//
//  CoursesProtocols.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 02.05.2022.
//

import Foundation

//View
protocol CoursesDisplayLogic: AnyObject {
}

//Interactor
protocol CoursesBussinessLogic: AnyObject {
    func loadCurrentCourses()
}

protocol CoursesPresentationLogic: AnyObject {
    
}
