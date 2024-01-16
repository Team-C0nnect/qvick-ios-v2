//
//  PersonalDataViewModel.swift
//  QVick
//
//  Created by dgsw8th36 on 1/16/24.
//

import SwiftUI

class PersonalDataViewModel: ObservableObject {
    @Published var personModel: [PersonalDataModel] = [
        PersonalDataModel(label: "개인정보 처리방침", isClicked: false, url: "")
    ]
    
    func getClickedSelection(_ index: Int) {
        self.personModel[index].isClicked.toggle()
    }
    
}
