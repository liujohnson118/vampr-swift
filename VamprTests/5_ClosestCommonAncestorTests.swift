// Copyright (c) 2017 Lighthouse Labs. All rights reserved.
// 
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import XCTest
@testable import Vampr

class ClosestCommonAncestorTests: XCTestCase {
    
  var rootVampire: Vampire!
  var offspring: (Vampire, Vampire, Vampire, Vampire, Vampire, Vampire, Vampire, Vampire)!
  override func setUp() {
    super.setUp()
    
    rootVampire = Vampire(name: "original", yearConverted: 0)
    let v0 = Vampire(name: "", yearConverted: 0)
    let v1 = Vampire(name: "", yearConverted: 0)
    let v2 = Vampire(name: "", yearConverted: 0)
    let v3 = Vampire(name: "", yearConverted: 0)
    let v4 = Vampire(name: "", yearConverted: 0)
    let v5 = Vampire(name: "", yearConverted: 0)
    let v6 = Vampire(name: "", yearConverted: 0)
    let v7 = Vampire(name: "", yearConverted: 0)
    
    offspring = (v0, v1, v2, v3, v4, v5, v6, v7)
    
    rootVampire.add(offspring: offspring.0)
    rootVampire.add(offspring: offspring.1)
    rootVampire.add(offspring: offspring.2)
    offspring.2.add(offspring: offspring.3)
    offspring.2.add(offspring: offspring.4)
    offspring.4.add(offspring: offspring.5)
    offspring.5.add(offspring: offspring.6)
    offspring.1.add(offspring: offspring.7)
  }
    
  func test_closestCommonAncestor_ShouldBeRoot_WithAnyVampireAndRootVampire() {
    XCTAssert(rootVampire.closestCommonAncestor(vampire: offspring.0) === rootVampire)
    XCTAssert(rootVampire.closestCommonAncestor(vampire: offspring.1) === rootVampire)
    XCTAssert(rootVampire.closestCommonAncestor(vampire: offspring.2) === rootVampire)
    XCTAssert(rootVampire.closestCommonAncestor(vampire: offspring.3) === rootVampire)
    XCTAssert(rootVampire.closestCommonAncestor(vampire: offspring.4) === rootVampire)
    XCTAssert(rootVampire.closestCommonAncestor(vampire: offspring.5) === rootVampire)
    XCTAssert(rootVampire.closestCommonAncestor(vampire: offspring.6) === rootVampire)
    XCTAssert(rootVampire.closestCommonAncestor(vampire: offspring.7) === rootVampire)
  }
  
  func test_closestCommonAncestor_ShouldBeRoot_WithTwoDirectChildrenOfRoot() {
    XCTAssert(offspring.1.closestCommonAncestor(vampire: offspring.0) === rootVampire)
    XCTAssert(offspring.0.closestCommonAncestor(vampire: offspring.1) === rootVampire)
  }
  
  func test_closestCommonAncestor_ShouldBeClosesCommonParentNode() {
    XCTAssert(offspring.3.closestCommonAncestor(vampire: offspring.6) === offspring.2)
    XCTAssert(offspring.6.closestCommonAncestor(vampire: offspring.3) === offspring.2)
    
    XCTAssert(offspring.7.closestCommonAncestor(vampire: offspring.6) === rootVampire)
    XCTAssert(offspring.6.closestCommonAncestor(vampire: offspring.7) === rootVampire)
  }
  
  func test_closestCommonAncestor_ShouldBeThatVampire_WhenSameVampireIsUsed() {
    XCTAssert(offspring.4.closestCommonAncestor(vampire: offspring.4) === offspring.4)
  }
  
  func test_closestCommonAncestor_ShouldBeMoreSeniorVampire_WhenDirectAnscestorIsUsed() {
    XCTAssert(offspring.5.closestCommonAncestor(vampire: offspring.6) === offspring.5)
    XCTAssert(offspring.6.closestCommonAncestor(vampire: offspring.5) === offspring.5)
  }
    
}
