//
//  User.swift
//  pantallas
//
//  Created by Katherin Johana on 6/05/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class User: NSObject {

    var nombre = ""
    var contraseña = ""
    var fortaleza = ""
    var posicion = ""
    var cedula = ""
    
    init(nombre : String, contraseña : String, fortaleza : String, posicion : String, cedula : String) {
        
        self.nombre = nombre
        self.contraseña = contraseña
        self.fortaleza = fortaleza
        self.posicion = posicion
        self.cedula = cedula
        
    }
    
    func isValid() -> Bool{
    
        return (self.nombre.characters.count > 0 && self.contraseña.characters.count > 0 && self.fortaleza.characters.count > 0 && self.posicion.characters.count > 0
            && self.cedula.characters.count > 0)
        
    }
    
    
    func getDict() -> NSDictionary{
    
        return [
            "nombre" : self.nombre,
            "contraseña" : self.contraseña,
            "posicion":self.posicion,
            "fortaleza":self.fortaleza
        ]
        
    }
    
}
