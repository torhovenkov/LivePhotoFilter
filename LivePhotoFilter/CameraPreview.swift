//
//  CameraPreview.swift
//  LivePhotoFilter
//
//  Created by Vladyslav Torhovenkov on 11.07.2023.
//

import SwiftUI

struct CameraPreview: View {
   
    var image: CGImage?
    
    private var label = Text("frame")
    
    var body: some View {
        if let image = image {
            Image(image, scale: 1.0,orientation: .up, label: label).resizable()
                
        } else {
            Color.black
                .ignoresSafeArea()
        }
    }
    
    init(image: CGImage? = nil) {
        self.image = image
    }
}

struct CameraPreview_Previews: PreviewProvider {
    static var previews: some View {
        CameraPreview()
    }
}
