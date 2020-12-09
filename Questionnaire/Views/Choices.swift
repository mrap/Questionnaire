//
//  Choices.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/8/20.
//

import SwiftUI

struct Choices: View {
    @Binding var chosen: Int
    @Binding var choices: [String]

    var body: some View {
        Picker(selection: $chosen, label: Text("")) {
            ForEach(0 ..< choices.count) {
                Text(choices[$0])
            }
        }
    }
}
