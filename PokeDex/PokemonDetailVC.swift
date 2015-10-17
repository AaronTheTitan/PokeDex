//
//  PokemonDetailVC.swift
//  PokeDex
//
//  Created by Aaron Bradley on 10/16/15.
//  Copyright © 2015 AaronTheTitan. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
  
  var pokemon: Pokemon!
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var mainImage: UIImageView!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var defenseLabel: UILabel!
  @IBOutlet weak var heightLabel: UILabel!
  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var pokeDexIDLabel: UILabel!
  @IBOutlet weak var currentEvoImage: UIImageView!
  @IBOutlet weak var nextEvoImage: UIImageView!
  @IBOutlet weak var evoLabel: UILabel!
  @IBOutlet weak var baseAttack: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nameLabel.text = pokemon.name.capitalizedString
    let image = UIImage(named: "\(pokemon.pokedexID)")
    mainImage.image = image
    currentEvoImage.image = image
    
    pokemon.downloadPokemonDetails { () -> () in
      // this will be called after the downloading is done
      self.updateUI()
    }
  }
  
  func updateUI() {
    descriptionLabel.text = pokemon.description
    typeLabel.text = pokemon.type
    defenseLabel.text = pokemon.defense
    heightLabel.text = pokemon.height
    pokeDexIDLabel.text = "\(pokemon.pokedexID)"
    weightLabel.text = pokemon.weight
    baseAttack.text = pokemon.attack
    

    if pokemon.nextEvolutionID == "" {
      evoLabel.text = "No Evolutions"
      nextEvoImage.hidden = true
      
    } else {
      nextEvoImage.hidden = false
      nextEvoImage.image = UIImage(named: pokemon.nextEvolutionID)
      var str = "Next Evolution: \(pokemon.nextEvolutionText)"
      
      if pokemon.nextEvolutionLevel != "" {
        str += " - LVL \(pokemon.nextEvolutionLevel)"
      }
    }
    
    
  }
  
  @IBAction func backButtonTapped(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
}
