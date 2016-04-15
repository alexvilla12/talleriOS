//
//  Lista.swift
//  pantallas
//
//  Created by Katherin Johana on 15/04/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import Foundation

class Lista {
    
    // MARK: - Properties
    var name:String?
    var grade:Float?
    var description:String?
    
    // MARK: Init
    init(name:String, grade:Float,description:String){
        self.name = name
        self.grade = grade
        self.description = description
    }
    
    convenience init(){
        self.init(name:"", grade:0.0, description: "" )
    }
    
    // MARK: Utils
    class func listas() ->[Lista]{
        var data = [Lista]()
        let rawData = [
            ["name":"Cancha Jalea Real", "grade": 3.5, "description":"fue un gran partido de neas"],
            ["name":"Cancha venga pa'ca", "grade": 4.5,"description":"Buena rivalidad con respeto"],
            ["name":"Cancha Pasto alegre", "grade": 2.5,"description":"La lluvia arruino el juego"]
            
        ]
        
        for item in rawData{
            let lista = Lista(name: item["name"] as! String, grade: item["grade"] as! Float,description: item["description"] as! String)
            data.append(lista)
        }
        
        return data
    }
    
}
