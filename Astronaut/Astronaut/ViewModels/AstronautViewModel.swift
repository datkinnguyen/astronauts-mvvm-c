//
//  AstronautViewModel.swift
//  Astronaut
//
//  Created by Danny Nguyen on 13/1/2022.
//

import Foundation

class AstronautViewModel {
    
    let id: Int!
    let name: String?
    let url: String?
    let status: AstronautStatus?
    let type: AstronautType?
    let dateOfBirth: Date?
    let dateOfDeath: Date?
    let nationality: String?
    let bio: String?
    let profileImage: String?
    let profileImageThumbnail: String?
    let firstFlight: Date?
    let lastFlight: Date?
    
    init(astronaut: Astronaut!) {
        self.id = astronaut.id
        self.name = astronaut.name
        self.url = astronaut.url
        self.status = astronaut.status
        self.type = astronaut.type
        self.dateOfBirth = astronaut.dateOfBirth
        self.dateOfDeath = astronaut.dateOfDeath
        self.nationality = astronaut.nationality
        self.bio = astronaut.bio
        self.profileImage = astronaut.profileImage
        self.profileImageThumbnail = astronaut.profileImageThumbnail
        self.firstFlight = astronaut.firstFlight
        self.lastFlight = astronaut.lastFlight
    }
}
