//
//  ContentView.swift
//  Learn Guitar Notes
//
//  Created by James Dunn on 7/16/23.
//

import SwiftUI

struct ContentView: View {
    let notes = ["A", "B", "C", "D", "E", "F", "G"]
    let openNotes = ["E", "B", "G", "D", "A" , "E"]
    
    var body: some View {
        // MARK: Container
        VStack(spacing: 0) {
            
            // GeoReader to fill up the notes and fretboard fractionally within the same container
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    // MARK: Fretboard Notes
                    VStack(alignment: .leading) {
                        ForEach(0..<6) { note in
                            Text(openNotes[note])
                                .font(.title3)
                                .padding(0.4)
                        }
                    }
                    .frame(width: geometry.size.width * 0.08, height: geometry.size.height)
                    .background(.red)
                    
                    let totalScaleLength = geometry.size.width * 0.92 // Adjust the scale length as needed
                    let numberOfFrets = 12 // You can adjust this number based on how many frets you want to display
                    let dotSize: CGFloat = 23
                    
                    ZStack(alignment: .leading) {
                        // Draw frets
                        HStack {
                            ForEach(0..<numberOfFrets, id: \.self) { fret in
                                // Calculate the position of the fret from the nut
                                let distanceFromNut = totalScaleLength * (1.415 / pow(2.38, CGFloat(fret) / 12))
                                let xPosition = totalScaleLength - distanceFromNut
                                
                                Rectangle()
                                    .foregroundColor(.secondary) // Color of the fret
                                    .frame(width: 2, height: geometry.size.height) // Width and height of the fret line
                                    .offset(x: xPosition, y: 0) // Position the fret line
                            }
                        }
                        .frame(width: totalScaleLength)
                        
                        // MARK: Inlays
                        HStack {
                            Circle()
                                .frame(width: dotSize, height: dotSize)
                                .foregroundColor(.white)
                                .offset(x: totalScaleLength / 3.94, y: -4.25)
                            
                            Circle()
                                .frame(width: dotSize, height: dotSize)
                                .foregroundColor(.white)
                                .offset(x: totalScaleLength / 2.532, y: -4.25)
                            
                            Circle()
                                .frame(width: dotSize, height: dotSize)
                                .foregroundColor(.white)
                                .offset(x: totalScaleLength / 1.935, y: -4.25)
                            
                            Circle()
                                .frame(width: dotSize, height: dotSize)
                                .foregroundColor(.white)
                                .offset(x: totalScaleLength / 1.616, y: -4.25)
                            
                            VStack {
                                Circle()
                                    .frame(width: dotSize, height: dotSize)
                                    .foregroundColor(.white)
                                    .offset(x: totalScaleLength - 152.3, y: -23)
                                
                                Circle()
                                    .frame(width: dotSize, height: dotSize)
                                    .foregroundColor(.white)
                                    .offset(x: totalScaleLength - 152.3, y: 14.5)
                            }
                        }
                        
                        // MARK: Strings
                        VStack {
                            Spacer()
                            ForEach(1..<7) { num in
                                Rectangle()
                                    .foregroundColor(Color(red: (192 + 140) / (2 * 255), green: (192 + 140) / (2 * 255), blue: (192 + 140) / (2 * 255)))
                                    .frame(height: CGFloat(num - 1))
                                    .padding(2)
                                    .border(.black)
                                    .padding(.vertical, 10)
                            }
                            Spacer()
                        }
                        .frame(width: geometry.size.width * 0.92, height: geometry.size.height)
                    }
                }
                .clipped()
                .background(Color.brown)
                .border(.black)
            }
            .frame(height: 210)
            
            HStack {
                
                // MARK: Settings
                Image(systemName: "gearshape")
                    .padding(8)
                    .border(.black, width: 3)
                    .padding(.horizontal)
                Spacer()
                // MARK: Readout
            }
            .frame(maxWidth: .infinity, maxHeight: 45)
            .background(.blue)
            
            // MARK: Piano notes
            ZStack {
                // In here is where you'll place the keyboard
                // It's a ZStack so you can show the sharps and flats over the whole notes (Check Android app for reference)
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        ForEach(notes.indices, id: \.self) { noteIndex in
                            Text(notes[noteIndex])
                                .font(.title)
                                .frame(width: geometry.size.width / CGFloat(notes.count), height: 100)
                                .background(Color.white)
                                .border(Color.black)
                        }
                    }
                }
            }
        }
        .padding()
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
