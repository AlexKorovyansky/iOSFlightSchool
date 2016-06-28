extension Array {
    func shuffle() -> Array {
        var array = Array.init(self)
        if array.count < 2 { return array}
        for i in 0..<(array.count - 1) {
            let j = Int(arc4random_uniform(UInt32(array.count - i))) + i
            if i != j {
                swap(&array[i], &array[j])
            }
        }
        return array
    }
}

extension Array where Element: Comparable {
    
    func bubbleSort(comparator: (Element, Element) -> Bool) -> Array {
        var array = Array.init(self)
        for i in 0..<array.count {
            for j in i..<array.count {
                if comparator(array[j], array[i]) {
                    swap(&array[i], &array[j])
                }
            }
        }
        return array
    }
    
    func qSort(comparator: (Element, Element) -> Bool) -> Array {
        func rQSort(inout array: [Element], comparator: (Element, Element) -> Bool) -> Array {
            var comparatorTrue = [Element]()
            var equals = [Element]()
            var comparatorFalse = [Element]()
            if array.count > 1 {
                let pivot = array[0]
                for x in array {
                    if x == pivot {
                        equals.append(x)
                    } else if comparator (x, pivot) {
                        comparatorTrue.append(x)
                    } else {
                        comparatorFalse.append(x)
                    }
                }
                return rQSort(&comparatorTrue, comparator: comparator) + equals + rQSort(&comparatorFalse, comparator: comparator) // неоптимально по памяти, но красиво
            } else {
                return array
            }
        }
        var array = Array.init(self)
        return rQSort(&array, comparator: comparator)
    }
    
    func quickSort(comparator: (Element, Element) -> Bool) -> Array {
        
        func rQuickSort(inout array: Array, comparator: (Element, Element) -> Bool, lowerIndex: Int, higherIndex: Int) {
            var i = lowerIndex;
            var j = higherIndex;
            
            let pivot = array[lowerIndex+(higherIndex-lowerIndex)/2];
            
            // Divide into two arrays
            while (i <= j) {
                /**
                 * In each iteration, we will identify a number from left side which
                 * is greater then the pivot value, and also we will identify a number
                 * from right side which is less then the pivot value. Once the search
                 * is done, then we exchange both numbers.
                 */
                while (comparator(array[i], pivot)) {
                    i += 1;
                }
                while (comparator(pivot, array[j])) {
                    j -= 1;
                }
                
                if (i <= j) {
                    if (i != j) {
                        swap(&array[i], &array[j]);
                    }
                    //move index to next position on both sides
                    i += 1;
                    j -= 1;
                }
            }
            
            // call rQuickSort() method recursively
            if lowerIndex < j {
                rQuickSort(&array, comparator: comparator, lowerIndex: lowerIndex, higherIndex: j)
            }
            if i < higherIndex {
                rQuickSort(&array, comparator: comparator, lowerIndex: i, higherIndex: higherIndex)
            }
        }
        
        if (count == 0) {
            return []
        } else {
            var array = Array.init(self)
            rQuickSort(&array, comparator:comparator, lowerIndex: 0, higherIndex: array.count - 1);
            return array
        }
    }
    
    
}

class S1_Tests: XCTestCase {

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBubbleSortAscendingEmpty() {
        XCTAssertEqual([Int]().bubbleSort(<), [Int]())
    }
    
    func testBubbleSortAscending123() {
        XCTAssertEqual([1, 2, 3].bubbleSort(<), [1, 2, 3])
    }
    
    func testBubbleSortAscending321() {
        XCTAssertEqual([3, 2, 1].bubbleSort(<), [1, 2, 3])
    }
    
    func testBubbleSortAscending201605071118() {
        XCTAssertEqual([2, 0, 1, 6, 0, 5, 0, 7, 1, 1, 1, 8].qSort(<), [0, 0, 0, 1, 1, 1, 1, 2, 5, 6, 7, 8])
    }
    
    func testBubbleSortDescendingEmpty() {
        XCTAssertEqual([Int]().bubbleSort(>), [Int]())
    }
    
    func testBubbleSortDescending123() {
        XCTAssertEqual([1, 2, 3].bubbleSort(>), [3, 2, 1])
    }
    
    func testBubbleSortDescending321() {
        XCTAssertEqual([3, 2, 1].bubbleSort(>), [3, 2, 1])
    }
    
    func testBubbleSortDescending201605071118() {
        XCTAssertEqual([2, 0, 1, 6, 0, 5, 0, 7, 1, 1, 1, 8].qSort(>), [8, 7, 6, 5, 2, 1, 1, 1, 1, 0, 0, 0])
    }
    
    // ---
    
    func testQSortAscendingEmpty() {
        XCTAssertEqual([Int]().qSort(<), [Int]())
    }
    
    func testQSortAscending1() {
        XCTAssertEqual([1].qSort(<), [1])
    }
    
    func testQSortAscending123() {
        XCTAssertEqual([1, 2, 3].qSort(<), [1, 2, 3])
    }
    
    func testQSortAscending113() {
        XCTAssertEqual([1, 1, 3].qSort(<), [1, 1, 3])
    }
    
    func testQSortAscending321() {
        XCTAssertEqual([3, 2, 1].qSort(<), [1, 2, 3])
    }
    
    func testQSortAscending311() {
        XCTAssertEqual([3, 1, 1].qSort(<), [1, 1, 3])
    }
    
    func testQSortAscending201605071118() {
        XCTAssertEqual([2, 0, 1, 6, 0, 5, 0, 7, 1, 1, 1, 8].qSort(<), [0, 0, 0, 1, 1, 1, 1, 2, 5, 6, 7, 8])
    }
    
    func testQSortDescendingEmpty() {
        XCTAssertEqual([Int]().qSort(>), [Int]())
    }
    
    func testQSortDescending1() {
        XCTAssertEqual([1].qSort(>), [1])
    }
    
    func testQSortDescending123() {
        XCTAssertEqual([1, 2, 3].qSort(>), [3, 2, 1])
    }
    
    func testQSortDescending113() {
        XCTAssertEqual([1, 1, 3].qSort(>), [3, 1, 1])
    }
    
    func testQSortDescending321() {
        XCTAssertEqual([3, 2, 1].qSort(>), [3, 2, 1])
    }
    
    func testQSortDescending311() {
        XCTAssertEqual([3, 1, 1].qSort(>), [3, 1, 1])
    }
    
    func testQSortDescending201605071118() {
        XCTAssertEqual([2, 0, 1, 6, 0, 5, 0, 7, 1, 1, 1, 8].qSort(>), [8, 7, 6, 5, 2, 1, 1, 1, 1, 0, 0, 0])
    }
    
    // ---------
    
    func testQuickSortAscendingEmpty() {
        XCTAssertEqual([Int]().quickSort(<), [Int]())
    }
    
    func testQuickSortAscending123() {
        XCTAssertEqual([1, 2, 3].quickSort(<), [1, 2, 3])
    }
    
    func testQuickSortAscending113() {
        XCTAssertEqual([1, 1, 3].quickSort(<), [1, 1, 3])
    }
    
    func testQuickSortAscending321() {
        XCTAssertEqual([3, 2, 1].quickSort(<), [1, 2, 3])
    }
    
    func testQuickSortAscending311() {
        XCTAssertEqual([3, 1, 1].quickSort(<), [1, 1, 3])
    }
    
    func testQuickSortAscending201605071118() {
        XCTAssertEqual([2, 0, 1, 6, 0, 5, 0, 7, 1, 1, 1, 8].quickSort(<), [0, 0, 0, 1, 1, 1, 1, 2, 5, 6, 7, 8])
    }
    
    func testQuickSortDescendingEmpty() {
        XCTAssertEqual([Int]().quickSort(>), [Int]())
    }
    
    func testQuickSortDescending123() {
        XCTAssertEqual([1, 2, 3].quickSort(>), [3, 2, 1])
    }
    
    func testQuickSortDescending113() {
        XCTAssertEqual([1, 1, 3].quickSort(>), [3, 1, 1])
    }
    
    func testQuickSortDescending321() {
        XCTAssertEqual([3, 2, 1].quickSort(>), [3, 2, 1])
    }
    
    func testQuickSortDescending311() {
        XCTAssertEqual([3, 1, 1].quickSort(>), [3, 1, 1])
    }
    
    func testQuickSortDescending201605071118() {
        XCTAssertEqual([2, 0, 1, 6, 0, 5, 0, 7, 1, 1, 1, 8].quickSort(>), [8, 7, 6, 5, 2, 1, 1, 1, 1, 0, 0, 0])
    }
    
    // ---------
    
    func testPerformanceBubbleSort() {
        self.measureBlock {
            // print([1,2,3,4].shuffle())
            [Int](1...10000).shuffle().bubbleSort(>)
        }
    }
    
    func testPerformanceQSort() {
        self.measureBlock {
            // print([1,2,3,4].shuffle())
            [Int](1...10000).shuffle().qSort(<)
        }
    }
    
    func testPerformanceQuickSort() {
        self.measureBlock {
            [Int](1...10000).shuffle().quickSort(>)
        }
    }
    
    func testPerformanceSort() {
        self.measureBlock {
            [Int](1...10000).shuffle().sort(>)
        }
    }
    
    func testPerformanceQuickSortInt10000to1() {
        func quickSortInt(inout array: [Int]) {
            
            func rQuickSortInt(inout array: [Int], lowerIndex: Int, higherIndex: Int) {
                var i = lowerIndex;
                var j = higherIndex;
                
                let pivot = array[lowerIndex+(higherIndex-lowerIndex)/2];
                
                // Divide into two arrays
                while (i <= j) {
                    /**
                     * In each iteration, we will identify a number from left side which
                     * is greater then the pivot value, and also we will identify a number
                     * from right side which is less then the pivot value. Once the search
                     * is done, then we exchange both numbers.
                     */
                    while (array[i] < pivot) {
                        i += 1;
                    }
                    while (pivot < array[j]) {
                        j -= 1;
                    }
                    
                    if (i <= j) {
                        if (i != j) {
                            swap(&array[i], &array[j]);
                        }
                        //move index to next position on both sides
                        i += 1;
                        j -= 1;
                    }
                }
                
                // call rQuickSort() method recursively
                if lowerIndex < j {
                    rQuickSortInt(&array, lowerIndex: lowerIndex, higherIndex: j)
                }
                if i < higherIndex {
                    rQuickSortInt(&array, lowerIndex: i, higherIndex: higherIndex)
                }
            }
            
            if (array.count == 0) {
                return
            } else {
                rQuickSortInt(&array, lowerIndex: 0, higherIndex: array.count - 1);
            }
        }
        
        var array = [Int]()
        array += (1...10000).reverse()
        self.measureBlock {
            quickSortInt(&array)
        }

    }
    
    func testPerformanceQuickSort10000to1() {
        self.measureBlock {
            [Int](1...10000).reverse().quickSort(<)
        }

    }
    
    
}
