//
//  Questionnaire.swift
//  Questionnaire
//
//  Created by Mike Rapadas on 12/5/20.
//

import Foundation

// MARK: - Questionnaire
class Questionnaire: Codable, ObservableObject {
    @Published var id: Int?
    @Published var fields: [Field] = []
    
    init(id: Int, fields: [Field]) {
        self.id = id
        self.fields = fields
    }
    
    enum CodingKeys: CodingKey {
        case id, fields
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if id != nil {
            try container.encode(id, forKey: .id)
        }
        try container.encode(fields, forKey: .fields)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if container.contains(.id) {
            id = try container.decode(Int.self, forKey: .id)
        } else {
            id = nil
        }
        fields = try container.decode([Field].self, forKey: .fields)
    }
}

// MARK: - Field
class Field: Codable, ObservableObject {
    @Published var type: String
    @Published var prompt: String
    @Published var options: Options?
    @Published var choices: [String]?
    @Published var value: String
    @Published var values: [String]?

    init(type: String, prompt: String, options: Options?, choices: [String]?, value: String, values: [String]?) {
        self.type = type
        self.prompt = prompt
        self.options = options
        self.choices = choices
        self.value = value
        self.values = values
    }
    
    enum CodingKeys: CodingKey {
        case type, prompt, options, choices, value, values
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(value, forKey: .value)

        if options != nil {
            try container.encode(options, forKey: .options)
        }
        if choices != nil {
            try container.encode(choices, forKey: .choices)
        }
        
        if values != nil {
            try container.encode(values, forKey: .values)
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(String.self, forKey: .type)
        prompt = try container.decode(String.self, forKey: .prompt)
        
        if container.contains(.options) {
            options = try container.decode(Options.self, forKey: .options)
        } else {
            options = nil
        }
        
        if container.contains(.choices) {
            choices = try container.decode([String].self, forKey: .choices)
        } else {
            choices = nil
        }
        
        if container.contains(.value) {
            value = try container.decode(String.self, forKey: .value)
        } else {
            value = ""
        }
        
        if container.contains(.values) {
            values = try container.decode([String].self, forKey: .values)
        } else {
            values = nil
        }
    }
}

// MARK: - Options
class Options: Codable, ObservableObject {
    @Published var multi: Bool
    @Published var dropdown: Bool?
    @Published var placeholder: String?
    
    init(multi: Bool, dropdown: Bool?) {
        self.multi = multi
        self.dropdown = dropdown
    }
    
    enum CodingKeys: CodingKey {
        case multi, dropdown, placeholder
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(multi, forKey: .multi)
        
        if dropdown != nil {
            try container.encode(dropdown, forKey: .dropdown)
        }
        if placeholder != nil {
            try container.encode(placeholder, forKey: .placeholder)
        }
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        multi = try container.decode(Bool.self, forKey: .multi)
        if container.contains(.dropdown) {
            dropdown = try container.decode(Bool.self, forKey: .dropdown)
        } else {
            dropdown = nil
        }
        
        if container.contains(.placeholder) {
            placeholder = try container.decode(String.self, forKey: .placeholder)
        } else {
            placeholder = nil
        }
    }
}
