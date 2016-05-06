//
//  Partido.swift
//  Futmap
//
//  Created by Katherin Johana on 6/05/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class Partido: NSObject {

    var nombre = ""
    var hora = ""
    var descripcion = ""
    
    init(nombre : String, hora : String, descripcion : String) {
        
        self.nombre = nombre
        self.hora = hora
        self.descripcion = descripcion
        
    }
    
    
    func isValid() -> Bool{
        
        return (self.nombre.characters.count > 0 && self.hora.characters.count > 0 && self.descripcion.characters.count > 0)
        
    }
    
    
    func getDict() -> NSDictionary{
        
        return [
            "cancha" : self.nombre,
            "descripcion" : self.descripcion,
            "hora":self.hora,
        ]
        
    }
    
}
