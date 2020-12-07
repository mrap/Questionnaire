//
//  UserData.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/7/20.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    @Published var activeQuestionnaire = mainQuestionnaire
}
