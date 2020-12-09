//
//  FieldRow.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/5/20.
//

import SwiftUI

struct FieldRow: View {
    @Binding var field: Field

    var body: some View {
        VStack(alignment: .leading) {
            Text(field.prompt)
            switch field.type {
            case "text":
                FieldTextInput(placeholder: field.options?.placeholder ?? "", value: $field.value)
            default:
                EmptyView()
            }
            
        }
    }
}
