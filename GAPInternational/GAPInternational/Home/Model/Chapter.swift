//
//  Chapter.swift
//  GAPInternational
//
//  Created by rakeshlohan on 04/10/23.
//

import Foundation

struct Chapter: Identifiable, Hashable {
    
    var id: String
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.id = name
        self.name = name
        self.url = url
    }
}
