//
//  MovieManaged+Mapping.swift
//  MoDb
//
//  Created by CLAG on 22/11/16.
//  Copyright © 2016 Clag. All rights reserved.
//

import Foundation

extension MovieManaged {
    
    func mappedObject() -> Movie {
        
        return Movie(id: self.id,
                     title: self.title,
                     order: Int(self.order),
                     summary: self.summary,
                     image: self.image,
                     category: self.category,
                     director: self.director)
    }
    
    
}
