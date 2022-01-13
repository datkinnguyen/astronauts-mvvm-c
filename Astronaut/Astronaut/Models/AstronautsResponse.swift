//
//  AstronautsResponse.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation

struct AstronautsResponse {
    var count: Int = 0
    var next: String?
    var previous: String?
    var astronauts: [Astronaut] = []
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        self.astronauts = try container.decode([Astronaut].self, forKey: .astronauts)
        self.next = try container.decode(String?.self, forKey: .next)
        self.previous = try container.decode(String?.self, forKey: .previous)
    }
}

extension AstronautsResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case count
        case astronauts = "results"
        case next
        case previous
    }
}
