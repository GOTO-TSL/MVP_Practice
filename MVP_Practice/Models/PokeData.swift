//
//  PokeData.swift
//  MVP_Practice
//
//  Created by 後藤孝輔 on 2021/10/09.
//

import Foundation

struct PokeData: Codable {
    let name: String
    let flavor_text_entries: [FlavorTextEntry]
}

struct FlavorTextEntry: Codable {
    let flavor_text: String
    let language: Language
    let version: VersionClass
}

struct Language: Codable {
    let name: String
    let url: String
}

struct VersionClass: Codable {
    let name: String
    let url: String
}
