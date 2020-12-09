//
//  DatePickerInput.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/8/20.
//

import SwiftUI

struct DatePickerInput: View {
    @Binding var date: Date
    
    var body: some View {
        DatePicker("", selection: $date, displayedComponents: .date)
    }
}

struct DatePickerInput_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerInput(date: .constant(Date()))
    }
}
