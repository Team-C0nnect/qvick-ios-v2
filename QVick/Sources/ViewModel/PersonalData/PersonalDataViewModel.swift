//
//  PersonalDataViewModel.swift
//  QVick
//
//  Created by dgsw8th36 on 1/16/24.
//

import SwiftUI
import Alamofire

class PersonalDataViewModel: ObservableObject {
    
    @Published var personModel: [PersonalDataModel] = [
        PersonalDataModel(label: "서비스 이용약관 (필수)", url: ""),
        PersonalDataModel(label: "개인정보 수집 / 이용 동의 (필수)", url: "")
    ]
    
    
    var totalAccept: Bool {
        get {
            return self.checkBoolList()
        }
        set {
            self.setAll()
        }
    }
    
    func toggleTotalAccept() {
        totalAccept.toggle()
    }
    
    
    func getClickedSelection(_ index: Int) {
        self.personModel[index].isClicked.toggle()
    }
    
    func setAll() {
        if !checkBoolList() {
            self.personModel.indices.forEach {
                self.personModel[$0].isClicked = false
            }
        }
        else {
            self.personModel.indices.forEach {
                self.personModel[$0].isClicked = true
            }
        }
        
    }
    
    
    func checkBoolList() -> Bool {
        if (self.personModel.indices.filter{self.personModel[$0].isClicked==false}.count <= 0) {
            return false
        }
        else {
            return true
        }
        
        
    }
}
