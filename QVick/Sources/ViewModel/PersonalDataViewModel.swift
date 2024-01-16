//
//  PersonalDataViewModel.swift
//  QVick
//
//  Created by dgsw8th36 on 1/16/24.
//

import Foundation

class PersonalDataViewModel: ObservableObject {
    @Published var personModel = PersonalDataModel(label: "", isClicked: false)
    
    var label: String {
        var label = personModel.label
        return label
    }
}
