//
//  Questionnaire.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/5/20.
//

import Foundation

// MARK: - Questionnaire
struct Questionnaire: Codable {
    let id: Int?
    let fields: [Field]
}

// MARK: - Field
struct Field: Codable {
    let type, prompt: String
    let options: Options?
    let choices: [String]?
    let values: [String]?
}

// MARK: - Options
struct Options: Codable {
    let multi: Bool
    let dropdown: Bool?
}
