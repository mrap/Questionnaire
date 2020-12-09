//
//  FieldTextInput.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/7/20.
//

import SwiftUI

struct FieldTextInput: View {
    var placeholder: String
    @Binding var value: String
    
    var body: some View {
        TextField(placeholder, text: $value)
    }
}

struct FieldTextInput_Previews: PreviewProvider {
    static var previews: some View {
        FieldTextInput(placeholder: "My Value", value: .constant("Value"))
    }
}
