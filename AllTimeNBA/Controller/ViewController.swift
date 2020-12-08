

import UIKit

class Player {
    
    var name: String
    var image: UIImage
    var url: URL
    init (name: String, image: UIImage, url: URL) {
        self.name = name
        self.image = image
        self.url = url
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    private let players = [
        [Player(name: "Michael Jordan", image: #imageLiteral(resourceName: "jordan"),
                url: URL(string:"https://www.youtube.com/watch?v=LAr6oAKieHk&t=32s")!),
         Player(name: "Dennis Rodman", image: #imageLiteral(resourceName: "rodman"),
                url: URL(string: "https://www.youtube.com/watch?v=SezmOAEnBPI")! ),
         Player(name: "Scottie Pippen", image: #imageLiteral(resourceName: "pippen"),
                url: URL(string: "https://www.youtube.com/watch?v=T8_GiznzWbk")!),
         Player(name: "Anfernee Hardaway", image: #imageLiteral(resourceName: "penny"),
                url: URL(string: "https://www.youtube.com/watch?v=PNUto6iLaMM")!),
         Player(name: "Karl Malone", image: #imageLiteral(resourceName: "malone"),
                url: URL(string: "https://www.youtube.com/watch?v=Jv6vD1iKOU4")!)
        ],
        [Player(name: "Kobe Bryant", image: #imageLiteral(resourceName: "kobe"),
                url: URL(string: "https://www.youtube.com/watch?v=OTTWedyp37o")!),
         Player(name: "Allen Iverson", image: #imageLiteral(resourceName: "iverson"),
                url: URL(string: "https://www.youtube.com/watch?v=2REkZG-dhHc")!),
         Player(name: "Tracy McGrady", image: #imageLiteral(resourceName: "tmc"),
                url: URL(string: "https://m.youtube.com/watch?v=Y0kcm4LTE8E")!),
         Player(name: "Kevin Garnett", image: #imageLiteral(resourceName: "garnet"),
                url: URL(string: "https://m.youtube.com/watch?v=0mhUlZl3tyU")!),
         Player(name: "Sgaquille O'Neal", image: #imageLiteral(resourceName: "shaq"),
                url: URL(string: "https://m.youtube.com/watch?v=M9PAMJiuOao")!)
        ],
        [Player(name: "LeBron James", image: #imageLiteral(resourceName: "king"),
                url: URL(string: "https://m.youtube.com/watch?v=b117a8_jALE")!),
         Player(name: "Giannis Antetokounmpo", image: #imageLiteral(resourceName: " Giannis"),
                url: URL(string: "https://m.youtube.com/watch?v=0rMxWWsG4CQ")!),
         Player(name: "Stephen Curry", image: #imageLiteral(resourceName: "curry"),
                url: URL(string: "https://m.youtube.com/watch?v=2hIrbnVx4k4")!),
         Player(name: "James Harden", image: #imageLiteral(resourceName: "harden"),
                url: URL(string: "https://m.youtube.com/watch?v=_RqteZDjDmQ")!),
         Player(name: "Kawhi Leonard",image: #imageLiteral(resourceName: "Kawhi"),
                url: URL(string: "https://m.youtube.com/watch?v=5JWAx19dmbk")!)
        ]
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }
}
    //MARK: - tableviewの設定
    extension ViewController {
        
        //セルのセクションの数を決める
        func numberOfSections(in tableView: UITableView) -> Int {
            return players.count
        }
        //1セクションに入るセルの数を決める
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return players[section].count
        }
        //セルの外枠を生成
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
            cell.textLabel?.text = players[indexPath.section][indexPath.row].name
            return cell
        }
        //セルの高さを設定
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
        //セクションのヘッダーを生成
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let label = UILabel()
            label.backgroundColor = .systemIndigo
            label.textAlignment = .center
            label.textColor = .white
            switch section {
            case 0:
                label.text = "1990s"
            case 1:
                label.text = "2000s"
            case 2:
                label.text = "2010s"
            default:
                break
            }
            return label
        }
        //セクションのヘッダーの高さを設定
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
        
        //セルがタップされた時の動作を設定
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
            nextVC.player = players[indexPath.section][indexPath.row]
            navigationController?.pushViewController(nextVC, animated: true)
        }
        
    }


