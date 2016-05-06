//
//  Request.swift
//  pantallas
//
//  Created by Katherin Johana on 5/05/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit
import Firebase
let firebaseURL="https://contactsmruiz.firebaseio.com/"

class Request: NSObject {
    
    enum DATA_RETRIVING_STATUS : Int {
        
        case FAILED
        case UNKNOKW
        
    }
    
    enum LOGIN_STATUS : Int{
        
        case SUCCESS
        case NOT_MATCH
        
    }
    
    static let root = Firebase(url: firebaseURL)
    typealias readDataBlock = (result : AnyObject?, error : NSError?) -> ()
    typealias loginBlock = (user : User?, error : NSError?) -> ()
    typealias registerBlock = (result: Bool?, error : NSError?) -> ()
    
    class func loginOnFireBase(password : String, relativePathString : String, completionBlock : loginBlock){
        
        getDataFromFireBase(relativePathString) { (result, error) in
            
            if(result != nil){
                
                if let userDict = result as? NSDictionary
                {
                    
                    if let fireBasePassword = userDict.objectForKey("contraseña"){
                        
                        if(fireBasePassword as! String ==  password){
                            
                            let currentUser = User(dict: userDict)
                            completionBlock(user: currentUser, error: nil)
                            return
                            
                        }
                        
                    }
                    
                }
                
                completionBlock(user: nil, error: getErrorWithStatus(DATA_RETRIVING_STATUS.FAILED))
                return
                
            }
            
            completionBlock(user: nil, error: error)
            return
            
        }
        
    }
    
    class func saveUserOnFireBase(user : User, completionBock : registerBlock){
        
        let userRef = root.childByAppendingPath("usuarios/\(user.cedula)")
        let dataDict = user.getDict()
        
        userRef.setValue(dataDict, withCompletionBlock: {
                (error:NSError?, ref:Firebase!) in
                
                if (error == nil)
                {
                    completionBock(result: true, error: nil)
                }
                else
                {
                    completionBock(result: false, error: NSError(domain: "com.p.register", code: -102843, userInfo: nil))
                }
                
        })
        
    }
    
    class func savePartidoOnFireBase(partido : Partido, completionBock : registerBlock){
        
        let userRef = root.childByAppendingPath("partidos/\(partido.nombre+partido.hora)")
        let dataDict = partido.getDict()
        
        userRef.setValue(dataDict, withCompletionBlock: {
            (error:NSError?, ref:Firebase!) in
            
            if (error == nil)
            {
                completionBock(result: true, error: nil)
            }
            else
            {
                completionBock(result: false, error: NSError(domain: "com.p.register", code: -102843, userInfo: nil))
            }
            
        })
        
    }

    
    class func getDataFromFireBase( relativePathString : String, completionBlock : readDataBlock){
        
        let relativePath = root.childByAppendingPath(relativePathString)
        
        relativePath.observeEventType(.Value, withBlock: { snapshot in
            
            completionBlock(result: snapshot.value, error: nil)
            
            }, withCancelBlock: { error in
                
                completionBlock(result: nil, error: getErrorWithStatus(DATA_RETRIVING_STATUS.UNKNOKW))
                
        })
        
    }
    
    class func getErrorWithStatus(statusCode : DATA_RETRIVING_STATUS) -> NSError{
        
        var userInfoMessage = ""
        
        switch statusCode {
        case .FAILED:
            userInfoMessage = "Usuario no encontrado."
            break
        default:
            userInfoMessage = "Ha ocurrido un error, vuelve a intentarlo"
            break
        }
        
        return NSError(domain: "com.foodapp.firebase", code: statusCode.rawValue, userInfo: [NSLocalizedDescriptionKey : userInfoMessage])
        
    }

}