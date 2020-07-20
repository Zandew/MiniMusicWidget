import Foundation
import SwiftUI

class UserData {
    
    static var userID: String = ""
    static var auth: Bool = false
    static var playlist: [Song] = []
    static var displace: Bool = false
    static var songIndex: Int = 0 {
        didSet {
            if displace {
                displace = false
            } else if playlist.count > 0 {
                NextSongTimer.instance.initTimer(playlist[songIndex].length)
            }else {
                NextSongTimer.instance.invalidateTimer()
            }
        }
    }
    static var genres: [String] = ["anime", "classical", "hard-rock", "hip-hop", "pop"]
    static func getGenres() -> String {
        var ret = ""
        for genre in genres {
            ret += "\(genre)%2C"
        }
        return ret
    }
}
