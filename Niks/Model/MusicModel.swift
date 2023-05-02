//
//  Music.swift
//  Niks
//
//  Created by Abner Edgar on 29/04/23.
//

import Foundation

struct MusicModel: Identifiable{
    let id: UUID = UUID()
    let name: String
    let image: String
    
    func getName() -> String{
        return self.name
    }
    func getImage() -> String{
        return self.image
    }
}
