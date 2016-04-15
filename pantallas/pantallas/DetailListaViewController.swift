//
//  DetailListaViewController.swift
//  pantallas
//
//  Created by Katherin Johana on 15/04/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class DetailListaViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var nombreCanchaLabel: UILabel!
    
    @IBOutlet weak var calificaionJuegoLabel: UILabel!
    
    @IBOutlet weak var descripcionJuegoLabel: UILabel!

    
    //MARK: Properties
    var lista = Lista()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nombreCanchaLabel.text = lista.name
        calificaionJuegoLabel.text = String(lista.grade!)
        descripcionJuegoLabel.text = lista.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
