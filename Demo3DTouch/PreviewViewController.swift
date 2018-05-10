//
//  PreviewViewController.swift
//  Demo3DTouch
//
//  Created by Isaías on 5/10/18.
//  Copyright © 2018 Isaías. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    var imageFromVC: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImageView.image = imageFromVC
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
