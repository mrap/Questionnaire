//
//  QuestionnaireView.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/5/20.
//

import SwiftUI

struct QuestionnaireView: View {
    @EnvironmentObject var userData: UserData
    
    var activeQuestionnaire: Questionnaire {
        return self.userData.activeQuestionnaire
    }
    
    var body: some View {
        List(self.activeQuestionnaire.fields.indices, id: \.self) { index in
            FieldRow(field: self.activeQuestionnaire.fields[index])
        }
    }
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView().environmentObject(UserData())
    }
}
