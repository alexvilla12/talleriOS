//
//  LoginViewController.swift
//  pantallas
//
//  Created by Katherin Johana on 15/04/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var ingresarButton: UIButton!
    @IBOutlet weak var contraseñaTextfield: UITextField!
    @IBOutlet weak var cedulaTextfiled: UITextField!
    @IBOutlet weak var estadoLabel: UILabel!
    
    @IBOutlet weak var registrarButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ingresaButtonPressed(sender: AnyObject) {
        
        let cedula = self.cedulaTextfiled.text!
        let password = self.contraseñaTextfield.text!
        
        if(cedula.characters.count > 0 && password.characters.count > 0){
        
            self.ingresarButton.enabled = false
            self.registrarButton.enabled = false
            
            Request.loginOnFireBase(password, relativePathString: "usuarios/\(cedula)", completionBlock: { (result, error) in
                
                if(result != nil){
                    User.sharedInstance.setUser(result!)
                    User.sharedInstance.cedula = cedula
                    self.performSegueWithIdentifier("opciones", sender: nil)
                }
                else
                {
                    self.estadoLabel.text = "Usuario incorrecto"
                    self.ingresarButton.enabled = true
                    self.registrarButton.enabled = true
                }
                
            })
            
        }
        else
        {
            self.estadoLabel.text = "Campos invalidos, validalos por favor"
            self.ingresarButton.enabled = true
            self.registrarButton.enabled = true
        }
        
    }
}
