//
//  ListaJuegosViewController.swift
//  pantallas
//
//  Created by Katherin Johana on 15/04/16.
//  Copyright © 2016 programacionAlex. All rights reserved.
//

import UIKit

class ListaJuegosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
     {
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - IBOutlets
    //@IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var listas = [Lista]()
    let cellIdentifier = "partidos"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        listas = Lista.listas()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let detailVC = segue.destinationViewController as? DetailListaViewController{
            if let lista = sender as? Lista{
                
                detailVC.lista = lista
                
            }
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        let lista = listas[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = lista.name
        cell?.detailTextLabel?.text = String(lista.grade!)
        
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let course = listas[indexPath.row]
        self.performSegueWithIdentifier("detail", sender: course)
        
    }
    
    // MARK: - DetailViewControllerDelegate
    
}
