//
//  ShaderTests.swift
//  ShaderTests
//
//  Deterministic tests for the dimming/cutout shader view factory. These run
//  headlessly on the simulator.
//

import XCTest
import UIKit
import QuartzCore
@testable import Shader

@MainActor
final class ShaderTests: XCTestCase {

    private let hole = CGRect(x: 10, y: 10, width: 100, height: 100)

    func testAtFrameProducesMaskedColoredView() {
        let view = Shader.at(frame: hole, color: .black)
        XCTAssertEqual(view.backgroundColor, .black)
        XCTAssertTrue(view.layer.mask is CAShapeLayer)
    }

    func testAtFrameWithCornerRadius() {
        let view = Shader.at(frame: hole, cornerRadius: 8, color: .red)
        XCTAssertEqual(view.backgroundColor, .red)
        XCTAssertNotNil(view.layer.mask)
    }

    func testAtMultipleFrames() {
        let view = Shader.at(frames: [hole, CGRect(x: 0, y: 0, width: 20, height: 20)], color: .blue)
        XCTAssertEqual(view.backgroundColor, .blue)
        XCTAssertTrue(view.layer.mask is CAShapeLayer)
    }

    func testAtFramesAndRadius() {
        let view = Shader.at(
            framesAndRadius: [(frame: hole, cornerRadius: 4)],
            color: .green
        )
        XCTAssertEqual(view.backgroundColor, .green)
        XCTAssertNotNil(view.layer.mask)
    }
}
