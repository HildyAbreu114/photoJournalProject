//
//  PhotoInfo.swift
//  photoJournal
//
//  Created by hildy abreu on 10/7/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//

import Foundation

struct Photo: Codable {
   let description: String
   let image: Data
   let date: String
   let id: Int

   static func getIDForNewPhoto() -> Int {
       do {
           let photos = try PhotosPersistenceHelper.manager.getPhotos()
           let max = photos.map{$0.id}.max() ?? 0
           return max + 1
       } catch {
           print(error)
       }
      return 0
   }

   static func getDate() -> String {
       let currentDate = Date()

       let dateFormatter = DateFormatter()

       dateFormatter.dateFormat = "dd-MM-yyyy, h:mm a"

       return dateFormatter.string(from: currentDate)
   }
}
