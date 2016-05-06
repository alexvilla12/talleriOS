//
//  JugadorViewController.swift
//  pantallas
//
//  Created by Katherin Johana on 15/04/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class JugadorViewController: UIViewController {

    @IBOutlet weak var crearButton: UIButton!
    @IBOutlet weak var nombreTextfield: UITextField!
    @IBOutlet weak var posicionTexField: UITextField!
    @IBOutlet weak var cedulaTexField: UITextField!
    @IBOutlet weak var fortalezaTexField: UITextField!
    @IBOutlet weak var contraseñaTexField: UITextField!
    @IBOutlet weak var estadoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
        self.estadoLabel.text = "Sin registrarse"
        
    }
    
    
    @IBAction func crearButtonPressed(sender: AnyObject) {
        
        self.crearButton.enabled = false
        self.navigationItem.hidesBackButton = true
        
        var user = User(nombre: self.nombreTextfield.text!, contraseña: self.contraseñaTexField.text!, fortaleza: self.fortalezaTexField.text!, posicion: self.posicionTexField.text!, cedula: self.cedulaTexField.text!)
        
        if(user.isValid()){
        
            Request.saveUserOnFireBase(user, completionBock: { (result, error) in
                
                if(result == true){
                    self.navigationController?.popViewControllerAnimated(true)
                }
                else
                {
                    self.estadoLabel.text = "Error, valida los campos por favor."
                    self.crearButton.enabled = true
                    self.navigationItem.hidesBackButton = false
                }
                
            })
            
        }
        else
        {
            self.estadoLabel.text = "Error, valida los campos por favor."
            self.crearButton.enabled = true
            self.navigationItem.hidesBackButton = false
        }
        
    }

}
