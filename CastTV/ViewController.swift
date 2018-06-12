//
//  ViewController.swift
//  CastTV
//
//  Created by Onur on 12/06/2018.
//  Copyright © 2018 wehkamp. All rights reserved.
//

import UIKit
import WebKit
import MediaPlayer
import AVKit

class ViewController: UIViewController,UIWebViewDelegate,AVPlayerViewControllerDelegate {

    @IBOutlet weak var webview : UIWebView!
    private var timer : Timer?
    
    var avPlayerItem : AVPlayerItem?
    {
        didSet{
            if let _ = self.avPlayerItem
            {
                self.timer?.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerTick(_:)), userInfo: nil, repeats: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.webview.allowsInlineMediaPlayback = true
        self.webview.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
        
        NotificationCenter.default.addObserver(self, selector: #selector(enterScreen(_ :)), name: NSNotification.Name.AVPlayerItemNewAccessLogEntry, object: nil)
    }
    
    @objc func timerTick(_ timer : Timer)
    {
        self.webview.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
        self.performSegue(withIdentifier: "playVideo", sender: nil)
    }
    
    @objc func enterScreen(_ notification : Notification)
    {
        guard let item = notification.object as? AVPlayerItem else {
            return
        }
        self.avPlayerItem = AVPlayerItem(asset: item.asset)
    }
    
    func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CastPlayerViewController
        {
            if let item = self.avPlayerItem
            {
                destination.avPlayerItemURL = (item.asset as? AVURLAsset)?.url
            }
        }
    }
}

