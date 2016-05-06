//
//  CrearPartidoViewController.swift
//  Futmap
//
//  Created by Katherin Johana on 6/05/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class CrearPartidoViewController: UIViewController {

    @IBOutlet weak var nombreCanchaTextField: UITextField!
    @IBOutlet weak var horaTextField: UITextField!
    @IBOutlet weak var descripcionTextField: UITextField!
    @IBOutlet weak var estadoLabel: UILabel!
    @IBOutlet weak var crearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.estadoLabel.text = "Sin registrar"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func crearButtonPressed(sender: AnyObject) {
        
        self.crearButton.enabled = false
        self.navigationItem.hidesBackButton = true
        
        let partido = Partido(nombre: self.nombreCanchaTextField.text!, hora: self.horaTextField.text!, descripcion: self.descripcionTextField.text!)
        
        if(partido.isValid()){
            
            Request.savePartidoOnFireBase(partido, completionBock: { (result, error) in
                
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
