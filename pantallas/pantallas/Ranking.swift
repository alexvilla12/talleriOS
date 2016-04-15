//
//  File.swift
//  pantallas
//
//  Created by Katherin Johana on 15/04/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import Foundation

class Ranking {
    
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
    class func rankings() ->[Ranking]{
        var data = [Ranking]()
        let rawData = [
            ["name":"Sergio Vergara Telechea", "grade": 3.5, "description":"Mucha pata"],
            ["name":"Julio Profe", "grade": 4.5,"description":"Mero crack"],
            ["name":"Ana Lisa Melchoto", "grade": 2.5,"description":"AutoGoleador"]
            
        ]
        
        for item in rawData{
            let ranking = Ranking(name: item["name"] as! String, grade: item["grade"] as! Float,description: item["description"] as! String)
            data.append(ranking)
        }
        
        return data
    }
    
}
