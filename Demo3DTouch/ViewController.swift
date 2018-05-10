//
//  ViewController.swift
//  Demo3DTouch
//
//  Created by Isaías on 5/10/18.
//  Copyright © 2018 Isaías. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 9.0, *) {
            if self.traitCollection.forceTouchCapability == .available {
                registerForPreviewing(with: self, sourceView: self.view)
            }
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "imgSegue" {
            let previewVC = segue.destination as? PreviewViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let cell = self.tableView.cellForRow(at: indexPath!) as? CustomCell
            
            previewVC?.imageFromVC = (cell?.logoImageView.image)!
        }
    }
}


// MARK: CustomCell
// Deberia estar en archivo seperado
class CustomCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
}


// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell else{
            fatalError("Error en el IndexPath")
        }
        
        cell.selectionStyle = .none
        
        if indexPath.row % 2 == 0 {
            cell.logoImageView.image = UIImage(named: "age_de_logo")
        }
        else{
            cell.logoImageView.image = UIImage(named: "lol_logo")
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155.0
    }
}

// MARK: UIViewControllerPreviewingDelegate
extension ViewController: UIViewControllerPreviewingDelegate{
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        // peek!
        // CGPoint cellPostion = [self.tableView convertPoint:location fromView:self.view];

        let cellPos = self.tableView .convert(location, from: self.view)
        guard let indexPath = self.tableView.indexPathForRow(at: cellPos), let cell = self.tableView.cellForRow(at: indexPath) as? CustomCell else{
            return nil
        }
        
        guard let previewVC = self.storyboard?.instantiateViewController(withIdentifier: "previewVC") as? PreviewViewController else{
            return nil
        }
        
        previewVC.imageFromVC = cell.logoImageView.image!
        
        if #available(iOS 9.0, *) {
            // https://stackoverflow.com/questions/45675165/ios-invalid-rect-for-view-in-navigationcontroller
            // se se utiliza cell.frame, el preview lo toma en mal posicion
            previewingContext.sourceRect = previewingContext.sourceView.convert(cell.bounds, from: cell)
        }
        
        return previewVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        // pop!
        self.show(viewControllerToCommit, sender: self)
    }
}
