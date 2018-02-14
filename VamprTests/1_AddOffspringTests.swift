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

class AddOffspringTests: XCTestCase {
  
  var rootVampire: Vampire!
  var offspring1: Vampire!
  var offspring2: Vampire!
  
  override func setUp() {
    super.setUp()
    
    rootVampire = Vampire(name: "original", yearConverted: 0)
    offspring1 = Vampire(name: "andrew", yearConverted: 0)
    offspring2 = Vampire(name: "sarah", yearConverted: 0)
    
    rootVampire.add(offspring: offspring1)
    rootVampire.add(offspring: offspring2)
  }
  
  func test_addOffspring_ShouldAddVapiresAsOffspringOfTheParent() {
    XCTAssert(rootVampire.offspring[0] === offspring1)
    XCTAssert(rootVampire.offspring[1] === offspring2)
  }
  
  func test_addOffspring_ShouldAddParentAsCreatorOfOffspring() {
    XCTAssert(offspring1.creator === rootVampire)
    XCTAssert(offspring1.creator === rootVampire)
  }
  
}
