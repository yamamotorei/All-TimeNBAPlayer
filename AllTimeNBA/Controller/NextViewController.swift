
import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var playersPic: UIImageView!
    
    @IBOutlet weak var playersname: UILabel!
    
    var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()

      
        playersPic.layer.cornerRadius = playersPic.frame.size.width * 0.1
        playersPic.image = player?.image
        playersname.text = player?.name
        
    }
    
    @IBAction func playVideo(_ sender: Any) {
        let url = player?.url
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
    }
    

}
    


