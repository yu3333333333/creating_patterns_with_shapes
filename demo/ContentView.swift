//
//  ContentView.swift
//  demo
//
//  Created by YU33 on 2025/9/8.
//

import SwiftUI

// MARK: - Helpers

private extension Color {
    static let tigerYellow = Color(red: 248/255, green: 218/255, blue: 99/255)
    static let stripeBrown = Color(red: 110/255, green: 77/255, blue: 51/255)
    static let outlineBlack = Color.black
    static let tummyWhite  = Color.white
    static let softPink    = Color(red: 247/255, green: 202/255, blue: 201/255)
    static let softBlue    = Color(red: 146/255, green: 168/255, blue: 209/255)
}

// MARK: - Tiger

struct TigerView: View {
    // 基準尺寸，所有元素用相對比例
    var size: CGFloat = 320
    
    var body: some View {
        let w = size
        let stroke = w * 0.025
        let headW = w * 0.62
        let headH = w * 0.52
        let earR  = w * 0.10
        let bodyW = w * 0.45
        let bodyH = w * 0.55
        let armW  = w * 0.23
        let armH  = w * 0.35
        let legW  = w * 0.22
        let legH  = w * 0.38
        
        ZStack {
            // 粉色 → 藍色線性漸層背景
            LinearGradient(
                colors: [Color.softPink, Color.softBlue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // 手臂
            Group {
                Ellipse()
                    .fill(Color.tigerYellow)
                    .frame(width: armW, height: armH)
                    .overlay(
                        Capsule().stroke(Color.outlineBlack, lineWidth: stroke)
                    )
                    .rotationEffect(.degrees(30))
                    .offset(x: -bodyW * 0.48, y: -bodyH * 0.09)
                Ellipse()
                    .fill(Color.tigerYellow)
                    .frame(width: armW, height: armH)
                    .overlay(
                        Capsule().stroke(Color.outlineBlack, lineWidth: stroke)
                    )
                    .rotationEffect(.degrees(-30))
                    .offset(x:  bodyW * 0.48, y: -bodyH * 0.09)
            }
            .offset(y:85)
            
            // 腿
            Group {
                RoundedRectangle(cornerRadius: legW * 0.45, style: .continuous)
                    .fill(Color.tigerYellow)
                    .frame(width: legW, height: legH)
                    .overlay(
                        RoundedRectangle(cornerRadius: legW * 0.45, style: .continuous)
                            .stroke(Color.outlineBlack, lineWidth: stroke)
                    )
                    .offset(x: -bodyW * 0.24, y: bodyH * 0.44)
                RoundedRectangle(cornerRadius: legW * 0.45, style: .continuous)
                    .fill(Color.tigerYellow)
                    .frame(width: legW, height: legH)
                    .overlay(
                        RoundedRectangle(cornerRadius: legW * 0.45, style: .continuous)
                            .stroke(Color.outlineBlack, lineWidth: stroke)
                    )
                    .offset(x:  bodyW * 0.24, y: bodyH * 0.44)
            }
            .offset(y:85)
            
            // 身體主體
            RoundedRectangle(cornerRadius: bodyW * 0.5, style: .continuous)
                .fill(Color.tigerYellow)
                .frame(width: bodyW, height: bodyH)
                .overlay(
                    RoundedRectangle(cornerRadius: bodyW * 0.5, style: .continuous)
                        .stroke(Color.outlineBlack, lineWidth: stroke)
                )
                .offset(y:85)
            
            Rectangle()
                .fill(Color.tigerYellow)
                .frame(width:bodyW * 0.42, height: bodyH * 0.4)
                .offset(x:-bodyW * 0.24, y: bodyH * 0.32)
                .offset(y:85)
            
            Rectangle()
                .fill(Color.tigerYellow)
                .frame(width:bodyW * 0.42, height: bodyH * 0.4)
                .offset(x:bodyW * 0.24, y: bodyH * 0.32)
                .offset(y:85)
            
            // 白肚
            Capsule()
                .fill(Color.tummyWhite)
                .frame(width: bodyW * 0.65, height: bodyH * 0.65)
                .offset(y: -bodyH * 0.1)
                .offset(y:85)
            
            // 身體上的棕色斑點
            Group {
                patch(width: bodyW * 0.16, height: bodyW * 0.10, rotation: -10)
                    .offset(x: -bodyW * 0.40, y: bodyH * 0.48)
                
                patch(width: bodyW * 0.16, height: bodyW * 0.10, rotation: 3)
                    .offset(x: bodyW * 0.40, y: bodyH * 0.56)
            }
            .offset(y:85)
            
            // 耳朵
            Group {
                Circle()
                    .fill(Color.tigerYellow)
                    .frame(width: earR * 2, height: earR * 2)
                    .overlay(
                        Circle()
                            .stroke(Color.outlineBlack, lineWidth: stroke)
                    )
                    .offset(x: -headW * 0.42, y: -headH * 0.35)
                Circle()
                    .fill(Color.tigerYellow)
                    .frame(width: earR * 2, height: earR * 2)
                    .overlay(
                        Circle()
                            .stroke(Color.outlineBlack, lineWidth: stroke)
                    )
                    .offset(x:  headW * 0.42, y: -headH * 0.35)
                patch(width: headW * 0.10, height: headH * 0.15, rotation: -45)
                    .offset(x:-headW * 0.45 ,y: -headH * 0.38)
                patch(width: headW * 0.10, height: headH * 0.15, rotation: 45)
                    .offset(x:headW * 0.45 ,y: -headH * 0.38)
            }
            .frame(height: headH + earR * 0.6)
            .padding(.top, w * 0.06)
            .offset(y:-85)
            
            // 頭型
            RoundedRectangle(cornerRadius: headH * 0.58, style: .continuous)
                .fill(Color.tigerYellow)
                .frame(width: headW, height: headH)
                .overlay(
                    RoundedRectangle(cornerRadius: headH * 0.48, style: .continuous)
                        .stroke(Color.outlineBlack, lineWidth: stroke)
                )
                .frame(height: headH + earR * 0.6)
                .padding(.top, w * 0.06)
                .offset(y:-85)
            
            // 額頭十字條紋
            Group {
                patch(width: headW * 0.10, height: headH * 0.22, rotation: 0)
                    .offset(y: -headH * 0.38)
                patch(width: headW * 0.20, height: headH * 0.08, rotation: 0)
                    .offset(y: -headH * 0.38)
            }
            .frame(height: headH + earR * 0.6)
            .padding(.top, w * 0.06)
            .offset(y:-85)
            
            // 臉頰條紋
            Group {
                patch(width: headW * 0.18, height: headH * 0.10, rotation: -8)
                    .offset(x: -headW * 0.4, y: headH * 0.1)
                patch(width: headW * 0.16, height: headH * 0.10, rotation: -18)
                    .offset(x: -headW * 0.38, y: headH * 0.25)
                patch(width: headW * 0.18, height: headH * 0.10, rotation: 8)
                    .offset(x: headW * 0.4, y: headH * 0.1)
                patch(width: headW * 0.16, height: headH * 0.10, rotation: 18)
                    .offset(x: headW * 0.38, y: headH * 0.25)
            }
            .frame(height: headH + earR * 0.6)
            .padding(.top, w * 0.06)
            .offset(y:-85)
            
            // 眼睛
            Group {
                eyeArc()
                    .stroke(Color.outlineBlack, style: StrokeStyle(lineWidth: stroke, lineCap: .round))
                    .frame(width: headW * 0.32, height: headH * 0.12)
                    .rotationEffect(.degrees(12))
                    .offset(x: -headW * 0.07, y: headH * 0.05)
                eyeArc()
                    .stroke(Color.outlineBlack, style: StrokeStyle(lineWidth: stroke, lineCap: .round))
                    .frame(width: headW * 0.32, height: headH * 0.12)
                    .rotationEffect(.degrees(-12))
                    .offset(x:  headW * 0.37, y: -headH * 0.02)
            }
            .frame(height: headH + earR * 0.6)
            .padding(.top, w * 0.06)
            .offset(y:-85)
            
            // 鼻子嘴巴
            Group {
                // 鼻子
                RoundedRectangle(cornerRadius: headH * 0.05, style: .continuous)
                    .fill(Color.outlineBlack)
                    .frame(width: headW * 0.10, height: headH * 0.06)
                    .offset(y: headH * 0.05)
                // 嘴：中豎 + 左右弧
                Path { p in
                    let cw = headW
                    let ch = headH
                    let center = CGPoint(x: 201, y: ch * 0.6)
                    p.move(to: center)
                    p.addLine(to: CGPoint(x: 201, y: ch * 0.68))
                    p.move(to: CGPoint(x: 201, y: ch * 0.68))
                    p.addQuadCurve(to: CGPoint(x: cw * 1.03, y: ch * 0.68),
                                   control: CGPoint(x: cw * 1, y: ch * 0.76))
                    p.move(to: CGPoint(x: 201, y: ch * 0.68))
                    p.addQuadCurve(to: CGPoint(x: cw * 0.77, y: ch * 0.68),
                                   control: CGPoint(x: cw * 0.79, y: ch * 0.76))
                }
                .stroke(Color.outlineBlack, style: StrokeStyle(lineWidth: stroke, lineCap: .round, lineJoin: .round))
            }
            .frame(height: headH + earR * 0.6)
            .padding(.top, w * 0.06)
            .offset(y:-85)
            
            // 文字
            Text("TAM \nTAM")
                .font(.system(size: 48, weight: .bold))
                .foregroundStyle(Color.outlineBlack)
                .offset(y: -250)
        }
        .drawingGroup() // 更平滑的抗鋸齒
    }
    
    // 橢圓形斑塊
    private func patch(width: CGFloat, height: CGFloat, rotation: CGFloat) -> some View {
        Capsule()
            .fill(Color.stripeBrown)
            .frame(width: width, height: height)
            .rotationEffect(.degrees(rotation))
    }
    
    // 眼睛弧形
    private func eyeArc() -> Path {
        Path { p in
            let start = CGPoint(x: -20.0, y: 0.0)
            let end   = CGPoint(x:  21.0, y: 0.0)
            let ctrl  = CGPoint(x:  0.0, y: -7) //負值越大，拱得越明顯
            p.move(to: start)
            p.addQuadCurve(to: end, control: ctrl)
        }
    }
}

// MARK: - ContentView
struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.softPink, Color.softBlue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            TigerView(size: 360)
        }
    }
}

#Preview {
    ContentView()
}
