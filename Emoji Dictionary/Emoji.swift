//
//  Emoji.swift
//  Emoji Dictionary
//
//  Created by Jane Madsen on 3/7/23.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
        
    static func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        let encodedEmojisData = try? encoder.encode(emojis)
        
        do {
            try encodedEmojisData?.write(to: Emoji.archiveURL)
        } catch {
            print(error)
        }
    }
    
    static func loadFromFile() -> [Emoji]? {
        guard let encodedEmojisData = try? Data(contentsOf: Emoji.archiveURL) else { return nil }
        
        let decoder = PropertyListDecoder()
        guard let decodedEmojisData = try? decoder.decode([Emoji].self, from: encodedEmojisData) else { return nil }
        
        return decodedEmojisData
    }
    
    static var archiveURL: URL {
        let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = directoryPath.appending(component: "emojis").appendingPathExtension(".plist")
        return filePath
    }
    
    static func sampleEmojis() -> [Emoji] {
        let sampleEmojis: [Emoji] = [
               Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
               Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
               Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
               Emoji(symbol: "🧑‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift).", usage: "apps, software, programming"),
               Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "something slow"),
               Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
               Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
               Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
               Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
               Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
               Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
               Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
               Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion"),
               Emoji(symbol: "🏳️‍🌈", name: "Pride Flag", description: "A rainbow colored flag.", usage: "LGBTQ+ rights")
            ]

        return sampleEmojis
    }
}

