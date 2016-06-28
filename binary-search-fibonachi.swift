import XCTest

func binarySearch(array: [Int], elem: Int) -> Int {
    func recursiveBinarySearch(array: [Int], elem: Int, right: Int, left: Int) -> Int {
        if (elem < array[right] || elem > array[left]) {
            return -1
        }
        if (array[right] == elem) {
            return right
        }
        if (array[left] == elem) {
            return left
        }
        if (left - right > 1) {
            let middle = (right + left) / 2
            if elem == array[middle] {
                return middle
            } else if elem < array[middle]{
                return recursiveBinarySearch(array, elem: elem, right: right, left: middle)
            } else {
                return recursiveBinarySearch(array, elem: elem, right: middle, left: left)
            }
        } else {
            return -1
        }
        
    }
    if (array.count == 0) {
         return -1
    }
    return recursiveBinarySearch(array, elem: elem, right: 0, left: array.count - 1)
}

class BinarySearch_Tests: XCTestCase {

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBinarySearch0inEmpty() {
        XCTAssertEqual(binarySearch([], elem: 0), -1)
    }
    
    func testBinarySearch0in0() {
        XCTAssertEqual(binarySearch([0], elem: 0), 0)
    }
    
    func testBinarySearch0in1() {
        XCTAssertEqual(binarySearch([1], elem: 0), -1)
    }

    func testBinarySearch0in12() {
        XCTAssertEqual(binarySearch([1, 2], elem: 0), -1)
    }
    
    func testBinarySearch1in12() {
        XCTAssertEqual(binarySearch([1, 2], elem: 1), 0)
    }
    
    func testBinarySearch2in12() {
        XCTAssertEqual(binarySearch([1, 2], elem: 2), 1)
    }
    
    func testBinarySearch3in12() {
        XCTAssertEqual(binarySearch([1, 2], elem: 3), -1)
    }
    
    func testBinarySearch0in123() {
        XCTAssertEqual(binarySearch([1, 2, 3], elem: 0), -1)
    }
    
    func testBinarySearch1in123() {
        XCTAssertEqual(binarySearch([1, 2, 3], elem: 1), 0)
    }
    
    func testBinarySearch2in123() {
        XCTAssertEqual(binarySearch([1, 2, 3], elem: 2), 1)
    }
    
    func testBinarySearch3in123() {
        XCTAssertEqual(binarySearch([1, 2, 3], elem: 3), 2)
    }
    
    func testBinarySearch4in123() {
        XCTAssertEqual(binarySearch([1, 2, 3], elem: 4), -1)
    }
    
    func testPerformanceBinarySearch0in1to10() {
        let array = [Int](1...10)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
    func testPerformanceBinarySearch0in1to100() {
        let array = [Int](1...100)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
    func testPerformanceBinarySearch0in1to1000() {
        let array = [Int](1...1000)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
    func testPerformanceBinarySearch0in1to10000() {
        let array = [Int](1...10000)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
    func testPerformanceBinarySearch0in1to100000() {
        let array = [Int](1...100000)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
    func testPerformanceBinarySearch0in1to1000000() {
        let array = [Int](1...1000000)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
    func testPerformanceBinarySearch0in1to10000000() {
        let array = [Int](1...10000000)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
    func testPerformanceBinarySearch0in1to100000000() {
        let array = [Int](1...100000000)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
    func testPerformanceBinarySearch0in1to1000000000() {
        let array = [Int](1...1000000000)
        self.measureBlock {
            binarySearch(array, elem: 2)
        }
    }
    
}

func fibonaciNumber(order: Int) -> Int {
    if (order < 0) {
        fatalError("order should be >= 0")
    }
    if (order == 0) {
        return 0
    }
    if (order == 1) {
        return 1
    }
    return fibonaciNumber(order - 1) + fibonaciNumber(order - 2)
}

class FibonachiNumbers_Tests: XCTestCase {
    
    // 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFibonaciNumber0is0() {
        XCTAssertEqual(fibonaciNumber(0), 0)
    }
    
    func testFibonaciNumber1is1() {
        XCTAssertEqual(fibonaciNumber(1), 1)
    }
    
    func testFibonaciNumber2is1() {
        XCTAssertEqual(fibonaciNumber(2), 1)
    }
    
    func testFibonaciNumber3is1() {
        XCTAssertEqual(fibonaciNumber(3), 2)
    }
    
    func testFibonaciNumber4is3() {
        XCTAssertEqual(fibonaciNumber(4), 3)
    }
    
    func testFibonaciNumber5is5() {
        XCTAssertEqual(fibonaciNumber(5), 5)
    }
    
    func testFibonaciNumber6is8() {
        XCTAssertEqual(fibonaciNumber(6), 8)
    }

    func testFibonaciNumber7is13() {
        XCTAssertEqual(fibonaciNumber(7), 13)
    }
    
    func testFibonaciNumber8is21() {
        XCTAssertEqual(fibonaciNumber(8), 21)
    }
    
    func testFibonaciNumber9is34() {
        XCTAssertEqual(fibonaciNumber(9), 34)
    }
    
    func testFibonaciNumber10is55() {
        XCTAssertEqual(fibonaciNumber(10), 55)
    }
    
    func testFibonaciNumber11is89() {
        XCTAssertEqual(fibonaciNumber(11), 89)
    }
    
    func testFibonaciNumber12is144() {
        XCTAssertEqual(fibonaciNumber(12), 144)
    }
    
    func testFibonaciNumber21is10946() {
        XCTAssertEqual(fibonaciNumber(21), 10946)
    }
    
    
}
