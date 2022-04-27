//
//  ViewController.swift
//  DesafioCustomCellTableView
//
//  Created by André N. dos Santos on 26/04/22.
//

import UIKit

class ViewController: UIViewController {

    var programadores = ["Jessica":"programadora", "Adriano":"programador", "Steve":"programador", "Bill":"programador", "Mark":"programador"]
    
    @IBOutlet weak var tableViewProgramadores: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewProgramadores.dataSource = self
        tableViewProgramadores.delegate = self

    }
    
    func exibirAlertSimples(titulo: String, mensagem: String) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in }))
        self.present(alert, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programadores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellPersonalizada", for: indexPath) as? CustomTableViewCell {
            cell.mudarNome(nome: Array(programadores.keys)[indexPath.row])
            cell.mudarImagem(imagem: Array(programadores.values)[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let programador = Array(programadores.keys)[indexPath.row]
        exibirAlertSimples(titulo: "Programadores", mensagem: "Nome selecionado: \(programador)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.init(integerLiteral: 136)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            programadores.removeValue(forKey: Array(programadores.keys)[indexPath.row])
            tableView.reloadData()
            }
    }
}
