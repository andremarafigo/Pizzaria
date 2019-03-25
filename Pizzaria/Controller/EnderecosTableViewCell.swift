//
//  EnderecosTableViewCell.swift
//  Pizzaria
//
//  Created by André Marafigo on 24/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit

//protocol EnderecoTableView {
//    func onClickCell(index: Int)
//}

class EnderecosTableViewCell: UITableViewCell {

    var cellDelegate: EnderecosTableViewController?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
//    @IBAction func btnMapaClick(_ sender: Any) {
//        cellDelegate?.onClickCell(index: (index?.row)!)
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
