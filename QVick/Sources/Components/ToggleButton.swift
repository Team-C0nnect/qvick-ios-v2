//
//  ToggleButton.swift
//  QVick
//
//  Created by dgsw8th16 on 1/22/24.
//

import SwiftUI

struct ToggleButton: View {
    @Binding var isOn: Bool
    
    init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
    
    var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
            .tint(Color.baseBlue)
    }
}
