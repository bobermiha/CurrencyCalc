//
//  CoursesInteractor.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 02.05.2022.
//

import Foundation

class CoursesInteractor: CoursesBussinessLogic {
    
    private var apiController = CoursesApiController()
    var presenter: CoursesPresentationLogic?
    
    func loadCurrentCourses() {
    }
}
