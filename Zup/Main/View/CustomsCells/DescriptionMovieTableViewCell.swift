//
//  CellNameTableViewCell.swift
//  Zup
//
//  Created by Victor de Paula on 04/11/17.
//  Copyright © 2017 Victor de Paula. All rights reserved.
//

import UIKit

// TODO alterar o nome 
class CellNameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieNameLbl: UILabel!
    @IBOutlet weak var view: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        self.view.layer.cardView()
        // Initialization code
    }

  // TODO excluir funcao que vc nao estiver usando
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
