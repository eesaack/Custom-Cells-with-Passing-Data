//
//  ContentView.swift
//  List with Custom Cell
//
//  Created by eesaack on 2022-06-19.
//

import SwiftUI

struct ContentView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(videos, id: \.id) { video in
                NavigationLink(destination: VideoDetailView(video: video), label: {
                    VideoCell(video: video)
                    //to make swipe action put code below HERE and change a bit
                })
            }
            .listStyle(.plain)
            .navigationTitle("Sean's Top 10")
        }
    }
}

struct VideoCell: View {
    
    var video: Video
    
    var body: some View {
        HStack {
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 3)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








/*                ForEach(videos) { video in
                    VideoCell(video: video)
                            .swipeActions {
                                Button(role: .destructive) {
                                    print("Delete")
                                } label: {
                                    Label("Delete", systemImage: "trash.circle.fill")
                                }
                                Button {
                                    print("Favorite")
                                } label: {
                                    Label("Favorite", systemImage: "star.circle.fill")
                                }
                                .tint(.green)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    print("Pin")
                                } label: {
                                    Label("Pin", systemImage: "trash.circle.fill")
                                }
                                .tint(.orange)
                            }
*/
