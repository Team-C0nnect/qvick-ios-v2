//
//  SchoolSelectionVIewModel.swift
//  QVick
//
//  Created by dgsw8th32 on 1/16/24.
//

import Foundation

class SchoolSelectionViewModel: ObservableObject {
    @Published var school = SchoolSelectionModel()
    
    @Published var content: String = ""
    
    var schoolList: [SchoolModel]? {
        let schoolList = school.schoolList
        
        return schoolList
    }
}
