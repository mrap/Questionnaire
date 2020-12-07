//
//  FieldRow.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/5/20.
//

import SwiftUI

struct FieldRow: View {
    var field: Field
    
    var body: some View {
        Text(field.prompt)
    }
}

struct FieldRow_Previews: PreviewProvider {
    static var previews: some View {
        FieldRow(field: mainQuestionnaire.fields[0])
    }
}
