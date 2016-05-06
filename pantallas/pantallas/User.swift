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
    typealias usersBlock = (users : [User]?) -> ()
    
    var nombre : String!
    var contraseña : String!
    var fortaleza : String!
    var posicion : String!
    var cedula : String!
    var puntaje : String!
    
    override init() {
        self.nombre = ""
        self.contraseña = ""
        self.fortaleza = ""
        self.posicion = ""
        self.cedula = ""
        self.puntaje = ""
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
        
        if let puntaje = dict.objectForKey("puntaje") as? String {
            
            self.puntaje = puntaje
            
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
            "fortaleza":self.fortaleza,
            "puntaje":"5.0"
        ]
        
    }
    
    class func getAllUsers(comlpetionBlock : usersBlock){
    
        Request.getDataFromFireBase("usuarios") { (results, error) in
            
            if (error == nil)
            {
            
                if let resultsDict = results as? NSArray{
                
                    var usersArray = [User]()
                    
                    for resultDict in resultsDict{

                        if let resultDict = resultDict as? NSDictionary{
                        
                            let user = User(dict: resultDict)
                            usersArray.append(user)
                            
                        }
                        
                    }
                    
                    comlpetionBlock(users: usersArray)
                    return
                    
                }
                
            }

            comlpetionBlock(users: nil)
            
        }
        
    }
    
}
