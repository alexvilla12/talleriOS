//
//  Partido.swift
//  Futmap
//
//  Created by Katherin Johana on 6/05/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class Partido: NSObject {

    typealias matchesBlock = (users : [Partido]?) -> ()
    
    var nombre = ""
    var hora = ""
    var descripcion = ""
    
    init(nombre : String, hora : String, descripcion : String) {
        
        self.nombre = nombre
        self.hora = hora
        self.descripcion = descripcion
        
    }
    
    init(dict : NSDictionary) {
        
        if let cancha = dict.objectForKey("cancha") as? String{
        
            self.nombre = cancha
            
        }
        
        if let descripcion = dict.objectForKey("descripcion") as? String{
            
            self.descripcion = descripcion
            
        }
        
        if let hora = dict.objectForKey("hora") as? String{
            
            self.hora = hora
            
        }
        
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
    
    class func getAllMatches(comlpetionBlock : matchesBlock){
        
        Request.getDataFromFireBase("partidos") { (results, error) in
            
            if (error == nil)
            {
                
                if let resultsDict = results as? NSDictionary{
                    
                    var matchesArray = [Partido]()
                    
                    for resultDictKey in resultsDict.allKeys{
                        
                        if let dataDict = resultsDict.objectForKey(resultDictKey) as? NSDictionary{
                    
                            let match = Partido(dict: dataDict)
                            matchesArray.append(match)
                            
                        }
                    
                    }
                    
                    comlpetionBlock(users: matchesArray)
                    return
                    
                }
                
            }
            
            comlpetionBlock(users: nil)
            
        }
        
    }
    
}
