//
//  PhotoPersistenceHelper.swift
//  photoJournal
//
//  Created by hildy abreu on 10/7/19.
//  Copyright © 2019 hildy abreu. All rights reserved.
//

import Foundation


struct PhotosPersistenceHelper {
   private init() {}
   static let manager = PhotosPersistenceHelper()

   private let persistenceHelper = PersistenceHelper<Photo>(fileName: "allphotos.plist")

   func savePhoto(photo: Photo) throws {
       try persistenceHelper.save(newElement: photo)
   }
   func getPhotos() throws -> [Photo] {
       return try persistenceHelper.getObjects()
   }

   func deletePhoto(specificID: Int) throws {
          do {
              let photos = try getPhotos()
              let newPhotos = photos.filter { $0.id != specificID}
              try persistenceHelper.replace(elements: newPhotos)
          }
      }
}
