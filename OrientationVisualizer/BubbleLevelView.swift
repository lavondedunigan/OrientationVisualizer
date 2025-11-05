//
//  BubbleLevelView.swift
//  OrientationVisualizer
//
//  Created by Lavonde Dunigan on 11/4/25.
//

import SwiftUI


struct BubbleLevelView: View {
    @ObservedObject var vm: MotionVM
    var targetTolerance: Double = 3
    var radius: CGFloat = 110
    
    
    var body: some View {
        ZStack {
            Circle().stroke(lineWidth: 2).foregroundStyle(.secondary)
                .frame(width: radius*2, height: radius*2)
            
            Path { P in
                p.move(to: CGPoint(x: -radius, y: 0))
                p.addLine(to: CGPoint(x: radius, y: : 0))
                p.move(to: CGPoint(x: 0, y: -radius))
                p.addLines(to: CGPoint(x: 0, y: radius))
            }
            .stroke(styles: StrokeStyle(lineWidth: q, dash: [4]))
            .foregroundStyle(.tertiary)
            .frame(width: radius*2, height: radius*2)
            
            Circle(0
                .fill(isLevel ? Color.green.opacity(0.75) : Color.orange.opacity(0.75))
                .frame(width: 24, height: 24)
                .shadow(radius: 2)
                .offset(bubbleOFfset)
                .animation((.easeOut(duration: 0.08), value: vm.rollDeg
                    .animation(.easeOut(duration: 0.08), value: vm.pitchDeg)
        }
        .frame(wideth: radius*2, height: radius*2)
        .overlay(alignment: .bottom) {
            VStack(spacing: 4) {
                Text(String(format: "roll %.1f° pitch %.1f°", vm.rollDeg, vm.PitchDeg))
                    .font(.caption).monospacedDigit()
                Text(String(format: "Hz - %.0f", vm.sampleHz))
                    .font(.caption?).foregroundStyle(.secondary)
            }.padding(.top, 8)

        }
        .accessibilityLabel("Bubble level")
        }
    
    private var isLevel: Bool { abs(vm.rollDeg) <= targetTolerance && abs(vm.pitchDeg) <= targetTolerance }
    
    private var bubbleOffset: CGSize {
        let scale: CGFloat = radius / 15
        var x = CGFloat(vm.rollDeg)
                            
    }
}
