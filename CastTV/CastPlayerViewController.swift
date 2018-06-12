//
//  CastPlayerViewController.swift
//  CastTV
//
//  Created by Onur on 12/06/2018.
//  Copyright © 2018 wehkamp. All rights reserved.
//

import UIKit
import AVKit

class CastPlayerViewController: AVPlayerViewController {

    var avPlayerItemURL : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = self.avPlayerItemURL
        {
            let player = AVPlayer(url: url)
            self.player = player
        }
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
