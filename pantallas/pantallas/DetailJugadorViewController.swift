//
//  DetailJugadorViewController.swift
//  pantallas
//
//  Created by Katherin Johana on 15/04/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class DetailJugadorViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var nameJugadorLabel: UILabel!

    @IBOutlet weak var gradeJugadorLabel: UILabel!
    
    @IBOutlet weak var descriptionJugadorLabel: UILabel!
    
    //MARK: Properties
    var lista = Ranking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nameJugadorLabel.text = lista.name
        gradeJugadorLabel.text = String(lista.grade!)
        descriptionJugadorLabel.text = lista.description
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

    

