//
//  ViewController.swift
//  SuperHeroBook
//
//  Created by Bedirhan Köse on 23.12.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var superHeroNames = [String]()
    var superHeroImageNames = [String]()
    var chosenName = ""
    var chosenImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
        superHeroNames.append("Batman")
        superHeroNames.append("Captain America")
        superHeroNames.append("Ironman")
        superHeroNames.append("Spiderman")
        superHeroNames.append("Superman")
        
        superHeroImageNames.append("Batman")
        superHeroImageNames.append("Captain-America")
        superHeroImageNames.append("Ironman")
        superHeroImageNames.append("Spiderman")
        superHeroImageNames.append("superman")


        
        
    }
    //numberOfRowsInSection -> kac tane row olacak
    // cellForRow atIndexPath -> hucrenin icerisinde neler gosterilecek
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeroImageNames.remove(at: indexPath.row)
            superHeroNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenName = superHeroNames[indexPath.row]
        chosenImage = superHeroImageNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.chosenHeroName = chosenName
            destinationVC.chosenHeroImageName = chosenImage
        }
    }

}

