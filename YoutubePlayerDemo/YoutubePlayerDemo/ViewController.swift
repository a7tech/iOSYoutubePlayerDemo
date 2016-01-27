    //
    //  ViewController.swift
    //  YoutubePlayerDemo
    //
    //  Created by mac on 27/01/16.
    //  Copyright © 2016 Inwizards. All rights reserved.
    //

    import UIKit

    class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
        
        @IBOutlet var tableView: UITableView!
        var tableData : NSMutableArray = NSMutableArray()
        var videoIDArray : NSMutableArray = NSMutableArray()
        var VideoID:String!
        override func viewDidLoad() {
            super.viewDidLoad()
            tableData = ["Video 1","Video 2","Video 3","Video 4","Video 5"]
            
            // add some youtube video's ID into a array.
            videoIDArray = ["YvR8LGOUpNA","egHLPSZZbWk","kAWKwn8d5Wo","pP-mvcC-R8g","2TCXpgL9VY8"]
        }
        
        //MARK: Tableview datasource and delegate.
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return videoIDArray.count
        }
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            
            cell.textLabel?.text = tableData.objectAtIndex(indexPath.row) as? String
            
            return cell
        }
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            VideoID = videoIDArray.objectAtIndex(indexPath.row) as! String
            self.performSegueWithIdentifier("PlayerView", sender: indexPath)
        }
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if (segue.identifier == "PlayerView")
            {
                let ObjVC = segue.destinationViewController as! PlayerViewController
                ObjVC.VideoID = VideoID
            }
        }
    }

