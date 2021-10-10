//
//  PokeVsData.swift
//  MVP_Practice
//
//  Created by 後藤孝輔 on 2021/10/10.
//

import Foundation
import UIKit

struct PokeVsData: Codable {
    let sprites: Sprites
}

struct Sprites: Codable {
    let versions: Versions
}

struct Versions: Codable {
    let generation_v: GenerationV
    
    enum CodingKeys: String, CodingKey {
        case generation_v = "generation-v"
    }
}

struct GenerationV: Codable {
    let blackwhite: BW
    
    enum CodingKeys: String, CodingKey {
        case blackwhite = "black-white"
    }
}

struct BW: Codable {
    let animated: Animated
}

struct Animated: Codable {
    let front_default: String
}

