//
//  HomeViewModel.swift
//  GAPInternational
//
//  Created by rakeshlohan on 05/09/23.
//

import Foundation
import AVKit

class HomeViewModel: ObservableObject {
    
    @Published var chapters = [Chapter]()
    @Published var openedChapter: Chapter?
    @Published var player: AVPlayer = AVPlayer()
    
    func onAppear() {
        if let chapterList = getChapterList(withName: "Chapters"){
            chapters = chapterList
            openedChapter = chapterList[0]
            setPlayer()
        }
    }
    
    func setOpenedChapter(chapter: Chapter){
        debugPrint(chapter.url)
        self.openedChapter = chapter
        setPlayer()
    }
    
    func setPlayer() {
        if let chapter = self.openedChapter, let url = URL(string: chapter.url) {
            player.pause()
            player = AVPlayer(url: url)
            player.play()
        }
    }
    
    func getChapterList(withName name: String) -> [Chapter]? {
        
        if let infoPlistPath = Bundle.main.path(forResource: name, ofType: "plist") {
            
            if let dict = NSDictionary(contentsOfFile: infoPlistPath) as? [String: Any], let list = dict["Chapters"] as? [[String:String]] {
                var ch = [Chapter]()
                for item in list {
                    if let name = item["name"] ,let url = item["url"] {
                        ch.append(Chapter(name: name, url: url))
                    }
                }
                return ch
            }
        }
        return nil
    }
}
