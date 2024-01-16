//
//  SchoolSelectionViewModel.swift
//  QVick
//
//  Created by dgsw8th32 on 1/16/24.
//

import Foundation

class SchoolSelectionViewModel: ObservableObject {
    @Published var school = SchoolSelectionModel(textFieldContent: "")
    
    var content: String {
        var textFieldContnet = school.textFieldContent
        return textFieldContnet
    }
    
    var schoolList: [SchoolModel]? {
        var schoolList = school.schoolList
        return schoolList
    }
}
