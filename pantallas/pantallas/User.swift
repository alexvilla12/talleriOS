//
//  User.swift
//  pantallas
//
//  Created by Katherin Johana on 6/05/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class User: NSObject {

    static let sharedInstance = User()
    
    var nombre : String!
    var contraseña : String!
    var fortaleza : String!
    var posicion : String!
    var cedula : String!
    
    override init() {
        self.nombre = ""
        self.contraseña = ""
        self.fortaleza = ""
        self.posicion = ""
        self.cedula = ""
    }
    
    init(dict : NSDictionary) {
        
        self.cedula = ""
        
        if let nombre = dict.objectForKey("nombre") as? String {
        
            self.nombre = nombre
            
        }
        
        if let fortaleza = dict.objectForKey("fortaleza") as? String {
            
            self.fortaleza = fortaleza
            
        }
        
        if let posicion = dict.objectForKey("posicion") as? String {
            
            self.posicion = posicion
            
        }
        
        if let contraseña = dict.objectForKey("contraseña") as? String {
            
            self.contraseña = contraseña
            
        }
        
    }
    
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
    
    
    func setUser(user : User){
    
        self.nombre = user.nombre
        self.contraseña = user.contraseña
        self.fortaleza = user.fortaleza
        self.posicion = user.posicion
        
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
