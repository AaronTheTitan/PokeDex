//
//  PokeCell.swift
//  PokeDex
//
//  Created by Aaron Bradley on 10/16/15.
//  Copyright © 2015 AaronTheTitan. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
  
  @IBOutlet weak var thumbImage: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!

  var pokemon: Pokemon!
  
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    layer.cornerRadius = 5.0

  }
  
  func configureCell(pokemon: Pokemon) {
    self.pokemon = pokemon
    nameLabel.text = self.pokemon.name.capitalizedString
    thumbImage.image = UIImage(named: "\(self.pokemon.pokedexID)")
  }
    
}
