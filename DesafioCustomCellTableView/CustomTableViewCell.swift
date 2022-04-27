//
//  CustomTableViewCell.swift
//  DesafioCustomCellTableView
//
//  Created by André N. dos Santos on 26/04/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var programadorImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func mudarNome(nome: String) {
        nomeLabel.text = nome
    }
    
    func mudarImagem(imagem: String) {
        programadorImageView.image = UIImage.init(named: imagem)
    }

}
