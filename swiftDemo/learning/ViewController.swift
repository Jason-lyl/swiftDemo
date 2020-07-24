//
//  ViewController.swift
//  swiftDemo
//
//  Created by bonday012 on 2018/7/23.
//  Copyright © 2018年 bonday012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        initBasicGrammar()
        
    }
    func initBasicGrammar(){
        let myString = "Hello,World!"
        print(myString)
        //分号
        //swift 不要求在每行语句的结尾使用分号（；）,但当你在同一行书写多条语句时，必须用分号隔开：
        let myString1 = "Hello,World!";print(myString1)
        //标识符（标识符就是给变量、常量、方法、函数、枚举、结构体、类、协议等制定的名字。构成标识符的字母均有一定的规范）
        /*
         区分大小写，Myname与myname是两个不同的标识符；
         标识符首字符可以以下划线或者字母开始，但不能是数字；
         标识符中其他字符可以使下划线、字母或数字；
         */
        //如果一定要使用关键字作为标识符，可以在关键字前后添加重音符号（`）
        let `class` = "Runoob"
        print(`class`)
        
        //swift空格
        /*
         swift语言并不是像C/C++，Java那样完全忽视空格，Swift对空格的使用有一定的要求，但是又不像Python 对缩进的要求那么严格。
         swift中，运算符不能直接跟在变量或常量的后面
         */
        let a = 1 + 2
        print(a)
        

        //如果我们想让其不换行输出,只需要将最后一个参数赋值为空字符串即可:
        for x in 0...10 {
            print("\(x)", terminator: "" )
        }
        //接受用户输入
        readLine()
        
        //类型别名  typealias newname = type
        typealias Feet = Int
        
        //类型推断
        /*
         当你要处理不同类型的值时，类型检查可以帮你避免错误。然而，这并不是说你每次声明常量和变量的时候都需要显式指定类型。
         如果你没有显式指定类型，Swift 会使用类型推断（type inference）来选择合适的类型。
         
         */
        
    }
    
    func initOptionals()  {
        //swift的可选（optional）类型，用于处理值缺失的情况。
        let optionalInteger: Int? //类型和？之间没有空格
        let optionalIteger: Optional<Int>
        optionalIteger = 43
        print(optionalIteger)
        //声明一个可选变量或者可选属性的时候没有提供初始值，它的值默认为nil。
        
        let myString:String? = nil
        if myString != nil {
            print(myString)
        }else{
            print("字符串为nil")
        }
        
        //强制解析
        /*
         当你确定可选类型确实包含值之后，你可以再可选的名字后面加一个感叹号（！）来获取值。这个感叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析。
         使用！来获取一个不存在的可选值会导致运行时错误。使用！来强制解析值之前，一定要确定可选包含一个非nil的值。
         
         */
        var myStrings:String?
        myStrings = "Hello,Swift!"
        if myStrings != nil {
            print(myStrings!)
        }else{
            print("myString 值为nil")
        }
        
        //自动机械
        /*
         尅一在声明可选变量时使用感叹号（！）替换问号（？）。这样可选变量在使用时就不需要再加上一个感叹号（！）来获取值，它会自动解析。
         */
        
        var myStringss:String!
        myStringss = "Hello,longge!"
        if myStringss != nil {
            print(myStringss)
        }else{
            print("mySting 值为nil")
        }
        
        //可选绑定
        /*
         使用可选绑定（optional bingding）来判断可选类型是否包含值，如果包含就把值付给一个临时常量或者变量。可选绑定可以在用if和while语句中来对可选类型的值进行判断并把值赋给一个常量或者变量。
         
         
         if let constantName = someOptional {
         statements
         }

         */
        
        var myStringOptionalBinding:String?
        
        myStringOptionalBinding = "hello,longge!"
        
        if let yourString = myStringOptionalBinding {
            print("你的字符串值为-\(yourString)")
        }else{
            print("你的字符串没有值")
        }
        
    }
    func initString(){
        //创建字符串
        
       //使用字符串字面量
        let stringA = "Hello,longge!"
        print(stringA)
        
        //String 实例化
        let stringB = String("Hello,World!")
        print(stringB)
        
        //空字符串
        //使用字符串字面量创建空字符串
        let stringEmptyA = ""
        if stringEmptyA.isEmpty {
            print("stringEmptyA 是空的")
        }else{
            print("stringEmptyA 不是空的")
        }
        //实例化String 类来创建空字符串
        
        let stringEmptyB = String()
        if stringEmptyB.isEmpty {
            print("stringEmptyB 是空的")
        }else{
            print("stringEmptyB 不是空的")
        }
        
        
        //字符
        let char1: Character = "A"
        print(char1)
        
        /*
         swift中不能创建空的字符类型变量或者常量
         字符类型常量中不能存储更多的字符
         */
        
    
    }
    
    func initArray() {
        //数组   var someArray = [SomeType]()
        let someInt:[Int] = [10, 20, 30]
        
        print(someInt)
        var someInts = [Int]()
        someInts.append(20)
        someInts.append(30)
        someInts += [40]
        
        print(someInts)
        
        //遍历数组
        var someStrs = [String]()
        someStrs.append("Apple")
        someStrs.append("Amazon")
        someStrs.append("Runoob")
        someStrs += ["Google"]
        
        for item in someStrs {
            print(item)
        }
        
        //如果同时需要数据项的值和索引值，可以使用String 的 enumerate()方法来进行数组遍历。示例如下：
        for (index, item) in someStrs.enumerated() {
            print("在 index = \(index) 位置上的值为\(item)")
        }
        
        //合并数组
        let intsA = [Int](repeating: 2, count: 2)
        let intsB = [Int](repeating: 1, count: 3)
        let intsC = intsA + intsB
        for item in intsC {
            print(item)
        }
        let intsM = [Int]()
        //isEmpty 判断数组是否为空，返回布尔值：
        print("intsA.isEmpty = \(intsA.isEmpty)")
        print("intsM.isEmpty = \(intsM.isEmpty)")
        
        
        
    
        
    }
    //字典
    func initDict() {
//        var someDict = [KeyType: ValueType]()
        //创建一个空字典
        let someDict = [Int: String]()
        var someDicts: [Int: String] = [1:"One", 2:"Two", 3:"Three"]
        
        //访问字典 var someVar = someDict[key]
        let someVar = someDicts[1]
        
        print("key = 1 的值为\(someVar!)")
        print("key = 2 的值为\(someDicts[2]!)")
        print("key = 3 的值为\(someDicts[3]!)")
        //修改字典 updateValue(forKye:)增加或更新字典的内容。如果key不存在，则添加值，如果存在则修改key对应的值。updateValue(_:forKey:)方法返回Optional值
        let oldVal = someDicts.updateValue("One 新的值", forKey: 1)
        let oneVar = someDicts[1]
        
        print("key = 1 旧的值\(oldVal!)")
        print("key = 1 的值为\(oneVar!)")
        print("key = 2 的值为\(someDicts[2]!)")
        print("key = 3 的值为\(someDicts[3]!)")
        
        // 移除 Key-Value对 removeValueForKey() 如果key存在该方法返回移除的值，如果不存在返回nil
        
        let removedValue = someDicts.removeValue(forKey: 2)
        
        print(removedValue!)
        print("key = 2 的值为\(someDicts[2])")
        
        //遍历字典 for-in
        for (key, value) in someDicts {
            print("字典key \(key) - 字典value \(value)")
        }
        for (key, value) in someDicts.enumerated() {
            print("字典key \(key) - 字典value \(value)")

        }
        
        //字典转化为数组
        var dicts:[Int:String] = [1:"one" ,2:"Two", 3:"Three"]
        
        let dictKeys = [Int](dicts.keys)
        let dictValues = [String](dicts.values)
        
        print("输出字典的键（key）")
        for (key) in dictKeys {
            print("\(key)")
        }
        print("输出字典的值(value)")
        for (value) in dictValues {
            print("\(value)")
        }
        // count (计算字典有多少个键值对) isEmpty(判断字典是否为空,返回布尔值)
        
        let someDict1:[Int:String] = [1:"one", 2:"Two", 3:"Three"]
        let someDict2:[Int:String] = [4:"Four", 5:"Five"]
        let someDict3:[Int:String] = [Int:String]()
        let someDict4 = [Int:String]()
        
        print("someDict1 含有 \(someDict1.count) 个键值对")
        print("someDict2 含有 \(someDict2.count) 个键值对")
        print("someDict2 = \(someDict2.isEmpty)")
        print("someDict3 = \(someDict3.isEmpty)")
        print("someDict4 = \(someDict4.isEmpty)")

        
    }
    func initFun()  {
        let bounds = minMax(array: [8, -6, 2, 109, 71])
        print("最小值为\(bounds.min), 最大值为\(bounds.max)")
        // 前面的minMax(_：)函数返回一个包含两个Int值的元组。但是函数不会对数组执行任何安全检查，如果array参数是一个空数组，如上定义的minMax(_:)在视图访问array[0]时会触发一个运行时错误。
        //为了安全地处理这个”空数组“问题,将minMax(_:)函数改写为使用可选元组返回类型，并且当数组为空时返回nil：
         let boundsOptional = minMaxOptional(array: [Int]())
        print("最小值为\(boundsOptional?.min), 最大值为\(boundsOptional?.max)")
        //外部参数名 （在局部参数名钱指定外部参数名， 中间以空格分隔，外部参数名用于在函数调用时传递给函数的参数）
        print(pow(firstArg: 5, secondArg: 3))
        
        //可变参数
        vari(members: 4,3,5)
        vari(members: "Google", "Baidu")
        
        //变量参数 func getName(_ name: inout String)......
        //当传入的参数作为输入输出参数时，需要在参数名前加&符，表示这个值可以被函数修改。
        var x = 1
        var y = 5
        let m = 3
        
        swapTwoInts(&x, &y)
        print("x 现在的值\(x), y 现在的值\(y)")                              
        
        //函数嵌套
        let decrem = calcDecrement(forDecrement: 30)
        print(decrem())
        
        
        
    }
    //swift 闭包
    func initClosures() {
        
     /*
         {(parameters) -> return type in
         
          statements
         }
         
         1. 根据上下文推断参数和返回值类型
         2. 从单行表达式闭包中隐式返回（也就是闭包体只有一行代码，可以省略return）
         3. 可以使用简化参数名，如$0,$1(从0开始，表示第i个参数。。。)
         4. 提供了尾随闭包语法（Trailing closure syntax）
         
         */
        let studname = {print("Swift 闭包")}
        studname()
        
        let divide = {(val1: Int, val2: Int) -> Int in
            
            return val1 / val2
            
        }
        let result = divide(200, 20)
        print(result)
        
        //sorted
        let names = ["AT", "AE", "d", "S", "BE"]
        let reversed = names.sorted(by:backWards)
        print(reversed)
        //参数哦名称缩写
        let reverseds = names.sorted(by: { $0 > $1 })
        print(reverseds)
        
        let reversedss = names.sorted(by: >)
        print(reversedss)
        
        
        
    }
    //swift 属性
    /*
     存储属性：就是存储在特定类或结构体的实例里的一个常量或者变量。
     存储属性可以使变量存储属性，也可以是常量存储属性。
     计算属性： 计算书型不直接存储值，而是提供一个getter来获取值，一个可选的setter来间接设置其他属性或者变量的值。
     */
    func initAttritute() {
        
        struct Number{
            
            var digits: Int
            let pi = 3.1415
        }
        var n = Number(digits: 12345)
        n.digits = 67
        print("\(n.digits)")
        print("\(n.pi)")
        
        //延迟存储属性：当第一次被调用的时候才会计算其初始值的属性。使用var关键字，因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
        
        class sample{
            lazy var no = number()//var 关键字是必须的
        }
        class number{
            var name = "Runoob Swift 教程"
            
        }
        let firstample = sample()
        print(firstample.no.name)
        
        //计算属性（除存储属性外，类，结构体和枚举可以定义计算属性，计算属性不直接存储值，二十提供一个getter 来获取值，一个可选的setter来间接设置其他属性或变量的值）
        class sample2{
            var no1 = 0.0, no2 = 0.0
            var length = 300.0, breadth = 150.0
            
            var middle:(Double, Double){
                get{
                    return (length / 2, breadth / 2)
                }
                set(axis){
                    no1 = axis.0 - (length / 2)
                    no2 = axis.1 - (breadth / 2)
                }
            }
        }
        
        let result = sample2()
        print(result.middle)
        
        result.middle = (0.0, 10.0)
        print(result.no1)
        print(result.no2)
        
        //只读计算属性（只有getter没有setter的计算属性就是只读计算属性。）
        class film{
            var head = ""
            var duration = 0.0
            var metaInfo: [String: String]{
                return [
                  "head": self.head,
                  "duration": "\(self.duration)"
                ]
            }
        }
        let movie = film()
        movie.head = "Swift 属性"
        movie.duration = 3.09
        print(movie.metaInfo["head"]!)
        print(movie.metaInfo["duration"]!)
        
        //属性观察器
        /*
         属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，甚至新的值和现在的值相同的时候也不例外。
         不需要为无法重载的计算属性添加属性观察器，因为可以通过setter直接监控和响应值的变化。
         willSet : 在设置新的值之前调用
         didSet:在新的值被设置之后立即调用
         willSet和didSet观察器在属性初始化过程中不会别调用
         */
        class Samplepgm{
            var counter: Int = 0{
                willSet(newTotal){
                    print("计数器: \(newTotal)")
                }
                didSet{
                    if counter > oldValue {
                        print("新增数\(counter - oldValue)")
                    }
                }
            }
        }
        
        let NewCounter = Samplepgm()
        NewCounter.counter = 100
        NewCounter.counter = 800
        
        //类型属性
        /*
         类型属性是作为类型定义的一部分写在类型最外层的花括号内
         */
        struct Structname{
            static var storedTypeProperty = " "
            static var computedTypeProperty: Int{
                //
                return 0
            }
        }
        
        enum Enumname {
            static var storedTypeProperty = " "
            static var computedTypeProperty: Int{
                //
                return 0
            }
        }
        class Classname{
            class var computedTypePropterty: Int {
                //这里返回一个Int 值
                return 0
            }
        }
        
        
        struct StudMarks {
            static let markCount = 97
            static var totalCount = 0
            var InternalMarks: Int = 0{
                didSet {
                    if InternalMarks > StudMarks.markCount {
                        InternalMarks = StudMarks.markCount
                    }
                    if InternalMarks > StudMarks.markCount{
                        StudMarks.totalCount = InternalMarks
                        
                    }
                }
            }
            
        }
        
        var stud1Mark1 = StudMarks()
        var stud1Mark2 = StudMarks()
        
        stud1Mark1.InternalMarks = 98
        print(stud1Mark1.InternalMarks)
        
        stud1Mark2.InternalMarks = 87
        print(stud1Mark2.InternalMarks)
        
        

    }
    //实例方法
    func initFuncName() {
        
        class Counter{
            
            var count = 0
            func increment() {
                count += 1
            }
            
            func incrementBy(amount: Int) {
                count += amount
            }
            
            func reset() {
                count = 0
            }
            
        }
        
      // 初始计数值是0
        let counter = Counter()
      // 计数器现在是1
        counter.increment()
        //计数值现在是6
        counter.incrementBy(amount: 5)
        //计数器现在是0
        counter.reset()
        
        class devision {
            var count: Int = 0
            func incrementBy(no1: Int, no2: Int) {
                count = no1 / no2
                print(count)
            }
            
        }
        
        let counters = devision()
        counters.incrementBy(no1: 1800, no2: 3)
        counters.incrementBy(no1: 1600, no2: 5)
        counters.incrementBy(no1: 11000, no2: 3)
        
        class calculations {
            let a: Int
            let b: Int
            let res: Int
            
            init(a: Int, b: Int) {
                self.a = a
                self.b = b
                res = a + b
                print("Self 内：\(res)")
            }
            func tot(c: Int) -> Int {
                return res - c
            }
            
            func result(){
                print("结果为： \(tot(c: 20))")
                print("结果为: \(tot(c: 50))")
            }
            
        }
        let pri = calculations(a: 600, b: 300)
        let sum = calculations(a: 1200, b: 300)
        pri.result()
        sum.result()
        
        //在实例方法中修改值类型
        /*
         Swift 语言中结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中修改。
         但是，如果你确定需要在某个具体的方法中修改结构体或者枚举的属性，你可以选择变异（mutating）这个方法，然后方法就可以从方法内部改变它的属性；并且它做的任何改变在方法结束时还会保留在原始结构中。
         方法还可以给它隐含的self属性赋值一个全新的实例，这个新实例在方法结束后将替换原来的实例
         */
        
        struct area {
            
            var length = 1
            var breadth = 1
            
            func area() -> Int {
                return length * breadth
            }
            
            mutating func scaleBy(res: Int) {
                
                length *= res
                breadth *= res
                
                print(length)
                print(breadth)
                
            }
            
        }
        var val = area(length: 3, breadth: 5)
        val.scaleBy(res: 3)
        val.scaleBy(res: 30)
        val.scaleBy(res: 300)
        //在可变方法中给self赋值
        struct areas{
            var length = 1
            var breadth = 1
            
            func area() -> Int {
                return length * breadth
            }
            mutating func scaleBy(res: Int){
                self.length *= res
                self.breadth *= res
                
                print(length)
                print(breadth)
            }
            
        }
        var vals = areas(length: 3, breadth: 5)
        vals.scaleBy(res: 13)
        
        //类型方法
       /*
         实例方法是被类型的某个实力调用的方法，你也可以定义类型本身调用的方法，这种方法就叫做类型方法。
         声明结构体和枚举的类型方法，在方法的func 关键字之前加上关键字static。类可能会用关键字class来允许子类重写父类的实现方法。
         类型方法和实例方法一样用点号（.）语法调用。
         */
        
        class Math{
            
            class func abs(number: Int) -> Int{
                
                if number < 0 {
                    return (-number)
                }else{
                    return number
                }
            }
            
        }
        struct absno{
            static func abs(number: Int) -> Int{
                
                if number < 0 {
                    return (-number)
                }
                else{
                    return number
                }
                
            }
            
        }
        let no = Math.abs(number: -35)
        let num = absno.abs(number: -5)
        print(no)
        print(num)
        
    }
    //下标语法
    /*
     下标脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值
     与定义实例方法类似，定义下标脚本使用subscribe 关键字，显式声明入参（一个或多个）和返回类型。
     与实例方法不同的是下标脚本可以设定为读写或只读。这种方式又有点像计算属性的getter和setter：
     
     subscript(index: Int) -> Int{
     get{
     //用于下标脚本值的声明
      }
     set(newValue){
     //执行赋值操作
      }
     }
     
     */
    func initSubscript() {
        struct subExample {
            
            let decrementer: Int
            subscript(index :Int) -> Int{
                return decrementer / index
            }
            
        }
        let division = subExample(decrementer: 100)
        print("100 除与 9 等于 \(division[9])")
        print("100 除与 8 等于 \(division[8])")
        
        
        class daysofaweek {
            
            private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
            subscript(index: Int) ->String {
                get{
                    return days[index] //声明下标脚本的值
                }
                set(newValue) {
                    self.days[index] = newValue //执行赋值操作
                }
            }
            
        }
        let p = daysofaweek()
        
        print(p[0])
        print(p[1])
        
        
        struct Matrix {
            
            let rows: Int, columns: Int
            var array: [Double]
            
            init(rows: Int, columns: Int) {
                self.rows = rows
                self.columns = columns
                array = Array(repeating: 0.0, count: rows * columns)
            }
            subscript(row: Int, column: Int) -> Double{
                get{
                    return array[(row * columns) + column]
                }
                set{
                    array[(row * columns) + column] = newValue
                }
            }
            
        }
        //创建一个新的3行3列的实例
        var mat = Matrix(rows: 3, columns: 3)
        
        //通过下标脚本设置值
        mat[0,0] = 1.0
        mat[0,1] = 2.0
        mat[1,0] = 3.0
        mat[1,1] = 5.0
        
        
    }
    //继承
    func initSuperclass() {
        
//        class SomeClass: SomeSuperClass {
//            //类的定义
//        }
        
        class StudDetails {
            var stname: String
            var mark1: Int
            var mark2: Int
            var mark3: Int
            init(stname: String, mark1: Int, mark2: Int, mark3: Int) {
                self.stname = stname
                self.mark1 = mark1
                self.mark2 = mark2
                self.mark3 = mark3
            }
        }
        let stname = "swift"
        let mark1 = 98
        let mark2 = 89
        let mark3 = 76
        
        let sds = StudDetails(stname: stname, mark1: mark1, mark2: mark2, mark3: mark3)
       
        print(sds.stname)
        
        
        class StudentClass {
            
            var mark1: Int
            var mark2: Int
            
            init(stm1: Int, results stm2:Int) {
                mark1 = stm1
                mark2 = stm2
            }
            func show() {
                print("Mark1:\(self.mark1), mark2:\(self.mark2)")
            }
            
            
            
        }
        class Tom : StudentClass{
            
            init() {
                super.init(stm1: 93, results: 89)
            }
            
        }
        let tom = Tom()
        tom.show()
        
        //重写（overriding）
        
        class SuperClass{
            func show() {
                print("这是超类 SuperClass")
            }
            
        }
        class SubClass: SuperClass{
            override func show() {
                print("这是子类 SubClass")
            }
        
        }
        let superClass = SuperClass()
        superClass.show()
        let subClass = SubClass()
        subClass.show()
        
        /*
         getter(或setter)来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属性
         子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。所以重写一个属性时，必须将它的的名字和类型都写出来。
         
         如果重写属性中提供了setter,那么你也一定要提供getter
         如果你不想再重写版本中的getter里修改继承来的的属性值，你可以直接通过super.someProperty来返回继承来的值，其中somePropery是你要重写的属性的名字
         */
        
        class Circle{
            
            var radius = 12.5
            var area:String{
                return "矩形半径\(radius)"
            }
        }
        
        //继承超类Circle
        class Rectangle: Circle {
            
            var print = 7
            override var area: String{
                return super.area + ", 但现在被重写为\(print)"
            }
        }
        
        let rect = Rectangle()
        rect.radius = 25.0
        rect.print = 3
        print("Radius\(rect.area)")
        
        class Square: Rectangle {
            override var radius: Double{
                didSet{
                    print = Int(radius/5.0) + 1
                }
            }
        }
        let sq = Square()
        sq.radius = 100.0
        print("半径：\(sq.area)")
        
        
        //防止重写
        /*
         我们可以使用final关键字防止它们被重写。
         通过在关键字class前添加final特性(final class) 来将整个类标记为final的，这样的类是不可被继承的，否则会报编译错误。
         */
        
//         class OtherCircles{
//
//             var radius = 12.5
//           final var area:String{
//                return "矩形半径为\(radius)"
//            }
//
//        }
//        class Rectangless: OtherCircles{
//            var print = 7
//            override var area: String{
//                return super.area + "sdfsdf"
//            }
//        }
        
    
        
    }
    //Swift 构造过程
    /*
     构造过程是为了使用某个类，结构体或枚举类型的实例而进行的准备过程。这个过程包含了为实例中的每个属性设置初始值和为其执行必要的准备和初始化任务。
     Swift 构造函数使用init（）方法。
     
     */
    
    func initDeinitializer() {
        //存储型属性的初始赋值

        /*
         类和结构体在实例创建时，必须为所有存储型属性设置合适的初始值。
         存储属性在构造器中赋值时，它们的的值是被直接设置的，不会触发任何属性观测器
         存储型在构造器中赋值流程：
         1：创建初始值
         2：在属性定义中指定默认属性值。
         3：初始化实例，并调用init()方法。
         
         */
        struct rectangle{
            var length: Double
            var breadth: Double
            init() {
                length = 6
                breadth = 12
            }
        }
        let area = rectangle()
        
        print("矩形面积为\(area.length * area.breadth)")
        
        //使用默认值能让你的构造器更简洁、更清晰，且能通过默认值自动推导出属性的类型。
        struct cirecle{
            //设置默认值
            var lenght = 6
            var breadth = 12
            
        }
    
        //构造参数
        struct squre{
            var length: Double
            var breadth: Double
            var area: Double
            
            init(fromLength length: Double, fromBreadth breadth: Double) {
                self.length = length
                self.breadth = breadth
                area = length * breadth
            }
            init(fromLeng leng: Double, fromBread bread: Double) {
                self.length = leng
                self.breadth = bread
                area = leng * bread
            }
            //不提供外部名子
            init(_ area: Double) {
                length = area
                breadth = area
                self.area = area
            }
        }
        let ar = squre(fromLength: 6, fromBreadth: 12)
        print("面积为：\(ar.area)")
        let are = squre(fromLeng: 36, fromBread: 12)
        print("面积为：\(are.area)")
        //调用不提供外部名字
        let recarea  = squre(110)
        print("面积为: \(recarea.length)")
        
        //可选属性类型
        /*
         如果你定制的类型包含一个逻辑上允许取值为空的存储属性，你都需要将它定义为可选类型optional type
         当存储属性声明为可选时，将自动初始化为空nil
         */
        
        struct optionalRectangle{
            var length: Double?
            init(_ lenght: Double) {
                self.length = lenght
            }
        }
        let optionalRec = optionalRectangle(180)
        print(optionalRec.length!)
        
        //构造过程中修改常量属性
        /*
         只要在构造过程结束前常量的值能确定，你可以再构造过程中的任意时间点修改常量属性的值。
         对于某个类实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能再子类中修改。
         */
        struct changeValue {
            let lenght: Double?
            init(_ area: Double) {
                lenght = area
            }
        }
        //默认构造器
        /*
         默认构造器将简单的创建一个所有属性值都设置为默认值的实例
         */
        class ShoppingListItem{
            
            var name: String?
            var quantity = 1
            var purchased = false
        }
        let item = ShoppingListItem()
        print("名字: \(item.name!)")
        print("数理:\(item.quantity)")
        
        //值类型的构造器代理
        /*
         构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器之间的代码重复
         
         */
        struct Size{
            var width = 0.0, height = 0.0
            
        }
        struct Point{
            var x = 0.0, y = 0.0
        }
        struct Rect {
            var origin = Point()
            var size  = Size()
            init() {
                
            }
            init(origin: Point, size: Size) {
                
                self.origin = origin
                self.size = size
                
            }
            init(center: Point, size: Size) {
                let originX = center.x - (size.width / 2)
                let originY = center.y - (size.height / 2)
                self.init(origin: Point(x: originX, y: originY), size: size)
            }
        }
        //origin 和size 属性都使用定义时的默认值Point(x: 0.0, y: 0.0) 和Size(width: 0.0, height: 0.0)
        let basicRect = Rect()
        print("Size 结构体初始值：\(basicRect.size.width, basicRect.size.height)")
        print("Rect 结构体初始值：\(basicRect.origin.x, basicRect.origin.y)")
        
        // 将origin和size 的参数值赋给对应的存储类型
        let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
        print("Size 结构体初始值：\(originRect.size.width, originRect.size.height)")
        print("Rect 结构体初始值：\(originRect.origin.x, originRect.origin.y)")
        
        //先通过center 和size 的值计算出origin的坐标。
        //然后再调用（或代理给）init(origin: size: )构造器来将新的origin和size值赋值到对应的属性中
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
        print("Size 结构体初始值：\(centerRect.size.width, centerRect.size.height)")
        print("Rect 结构体初始值：\(centerRect.origin.x, centerRect.origin.y)")
        
        //类的继承和构造过程
        /*
         Swift 提供了两种类型的类构造器来确保所有类实例中存储属性都能获得初始值，它们分别是指定构造器和便利构造器。
         指定构造器：类中最主要的构造器 初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。每一个类都必须拥有至少一个指定构造器
         init(parameters){
          statements
         }
         
         便利构造器： 类中比较次要的、辅助性的构造器。可以定义遍历构造器来调用同一个类中的指定构造器，并为其参数提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入的实例。只在必要的时候为类提供遍历构造器。
         convenience init(parameters){
           statements
         }
         

         */
        //指定构造器
        class mainClass{
            var no1: Int //局部存储变量
            init(no1: Int) {
                self.no1 = no1 // 初始化
            }
        }
        class subClass : mainClass{
            
            var no2: Int
            init(no1 : Int, no2 : Int) {
                self.no2 = no2 //初始化
                super.init(no1: no1) // 初始化超类
            }
        }
        
        let res = mainClass(no1: 10)
        let res2 = subClass(no1: 10, no2: 20)
        
        print("res 为：\(res.no1)")
        print("res2 为：\(res2.no1)")
        print("res2 为: \(res2.no2)")
        
        //便利构造器实例
        class convenienceMainClass{
            
            var no1: Int //局部存储变量
            init(no1 : Int) {
                self.no1 = no1 //初始化
            }
        }
        class convenienceSubClass: convenienceMainClass{
            var no2 : Int
            init(no1 : Int, no2 : Int) {
                self.no2 = no2
                super.init(no1: no1)
            }
            //便利方法只需要一个参数
            override convenience init(no1: Int) {
                self.init(no1: no1, no2: 0)
            }
        }
        let convenienceres = convenienceMainClass(no1: 20)
        let convenienceres2 = convenienceSubClass(no1: 30, no2: 50)
        print("convenience为：\(convenienceres.no1)")
        print("convenienceres2为：\(convenienceres2.no2)")
        
        //构造器的继承和重载
        /*
         Swift 中的子类不会默认继承父类的构造器
         父类的构造器仅在确定和安全的情况下被继承。
         当你重写一个父类指定构造器时，你需要写override修饰符。
         */
        class overrideSuberClass{
            var corners = 4
            var descrption: String{
                return "\(corners)边"
            }
            
        }
        let overrideRectangle = overrideSuberClass()
        print("矩形：\(overrideRectangle.descrption)")
        
        class overrideSubClass : overrideSuberClass{
            
            override init() { //重载构造器
                super.init()
                corners = 5
                
            }
        }
        let overrideSubRectangle = overrideSubClass()
        print("五角行: \(overrideSubRectangle.descrption)")
        
        
        
    }
    //指定构造器和便利构造器实例

    func initOtherDeinitializer() {
        class MainClass {
            var name: String
            init(name: String) {
                self.name = name
            }
            
            convenience init(){
                self.init(name: "匿名")
            }
            
        }
        
        let main = MainClass(name: "Runoob")
        print("MainClass 名字为：\(main.name)")
        
        let main2 = MainClass()
        print("没有对应名字：\(main2.name)")
        
        class SubClass: MainClass{
            var count :Int
            init(name: String, count: Int) {
                self.count = count
                super.init(name: name)
            }
            
            override convenience init(name: String) {
                self.init(name: name, count: 1)
            }
            
        }
        let sub = SubClass(name: "Runoob")
        print("MainClass 名字为：\(sub.name)")
        
        let sub2 = SubClass(name: "Runoob", count: 3)
        print("count 变量：\(sub2.count)")
        
     //类的可失败构造器
        /*
         如果一个类，结构体或者枚举类型的对象，在构造自身的过程中有可能失败，则为其定义一个可失败的构造器。
         变量初始化失败可能的原因有：
         传入无效的参数值。
         缺少某种所需的外部资源。
         没有满足特定条件。
         为了妥善处理这种构造过程中可能失败的情况。你可以再一个类，结构体或是枚举类型的定义中，添加一个或多个可失败构造器。其语法为在init关键字后面加添问号（init?）。
         
         
         */
        struct Animal {
            
            let species: String
            init?(species: String) {
                if species.isEmpty {
                    return nil
                }
                self.species = species
            }
        }
        //通过该可失败构造器来构建一个Animal的对象，并检查其构建过程中是否成功
        //someCreature 的类型是Animal？而不是Animal
        let someCreature = Animal(species: "长颈鹿")
        
        //打印“动物初始化为长颈鹿”
        if let giraffe = someCreature {
            print("动物初始化\(giraffe.species)")
        }
        
        //枚举类型的可失败构造器
        enum TemperatureUnit{
            
            case Kelvin,Celsius, Fahrenheit
            init?(symbol: Character){
                
                switch symbol {
                case "K":
                    self = .Kelvin
                    case "C":
                    self = .Celsius
                    case "F":
                    self = .Fahrenheit
                default:
                    return nil
                }
            }
        }
        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("这是一个已定义的温度单位，所以初始化成功。")
        }
        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("这不是一个已定义的温度单位，所以初始化失败。")
        }
        //类的可失败构造器
        /*
         值类型的可失败构造器，对何时何地触发构造失败这个行为没有任何的限制。
         但是，类的可失败构造器只能在所有的类属性被初始化后和所有类之间的构造器之间的代理调用发生完后触发失败行为。
         */
        class StudRecord{
            
            let studname: String!
            init?(studname: String) {
                self.studname = studname
                if studname.isEmpty {
                    return nil
                }
            }
        }
        if let stname = StudRecord(studname: "失败构造器"){
        print("模块为\(stname.studname)")
        }
            //覆盖一个可失败构造器
            /*
             就如同其他构造器一样，你也可以用子类的可失败构造器覆盖基类的可失败构造器。或者你也可以用子类的非可失败构造器覆盖一个基类的可失败构造器。
             你也可以用一个非可失败构造器覆盖一个可失败构造器，但反过来却行不通。一个非可失败的构造器永远也不可能代理调用一个可失败构造器。
             
             */
            
            class Planet {
                var name: String
                init(name: String) {
                    self.name = name
                }
                convenience init(){
                    self.init(name: "No Planets")
                }
            }
            let plName = Planet(name: "Mercury")
            print("行星的名字是：\(plName.name)")
            let noplName = Planet()
            print("没有这个名字的行星：\(noplName.name)")
            
            class planets: Planet {
                var count: Int
                init(name: String, count: Int) {
                    self.count = count
                    super.init(name: name)
                }
                override convenience init(name: String) {
                    self.init(name: name, count: 1)
                }
            }
            
            
            //可失败构造器 init！
            /*
             通常来说我们通过在init关键字后添加问号的方式(init?)来定义一个可失败构造器，但你也可以使用通过在init后面添加！的方式来定义一个可失败构造器
             */
            struct studRecordInit {
                let stname: String
                init!(stname: String) {
                    if stname.isEmpty {
                        return nil
                    }
                    self.stname = stname
                }
            }
            
            let stmark = studRecordInit(stname: "Runoob")
            if let name = stmark{
                print("指定了学生名")
            }
            let blankname = StudRecord(studname: "")
            if blankname == nil{
                print("学生名为空")
            }
            
    }
    //析构过程
    /*
     一个类的实例被释放之前，析构函数被立即调用。
     
     deinit {
     //执行析构过程
     }

     */
    func initDeinit() {
//        var counter = 0
//
//        class BaseClass{
//            init() {
//                counter += 1
//            }
//            deinit {
//                counter -= 1
//            }
//        }
//
//        var show: BaseClass? = BaseClass()
//        print(counter)
//        show = nil
//        print(counter)
        
        
    }
    //可选链
    /*
     可选链是一种可以请求和调用属性、方法和子脚本的过程，用于请求或调用的目标可能为nil。
   可选链返回两个值：
    1：如果目标有值，调用就会成功，返回该值
    2：如果布标为nil，滴啊用将返回nil
     多次请求或调用可以被链接成一个链，如果任意一个节点为nil将导致整条链失效。
     
   */
    func initOptionalChaining()  {
        //可选链可替代强制解析
        //通过在属性、方法、或下标脚本的可选值后面放一个问号（？）即可定义一个可选链。
        class Person{
            var residence: Residence?
        }
        class Residence {
            var numberOfRooms = 1
        }
        let john = Person()
        //将导致运行时错误
        //使用感叹号强制解析获得这个人residence属性numberOfRooms属性值，将会引发运行时错误，因为这时没有可以供解析的residence值。
        let roomCount = john.residence?.numberOfRooms
        
        if let roomCount = john.residence?.numberOfRooms {
            print("John 的房间号为\(roomCount)")
        }else{
            print("不能查看房间号")
        }
        
        //为可选链定义模型类
        
        class Peple{
            var residence: RoomsResidence?
        }
        
        class RoomsResidence{
            var rooms = [Room]()
            var numberOfRooms: Int{
                return rooms.count
            }
            subscript(i: Int) ->Room{
                return rooms[i]
            }
            func printNumberOfRooms() {
                print("房间号为\(numberOfRooms)")
            }
            
            var address: Address?
            
       
            
        }
        class Room{
            let name: String
            init(name:String) {
                self.name = name
            }
        }
        class Address{
            var buildingName: String?
            var buildingNumber: String?
            var street: String?
            func buildingIdentifier() -> String? {
                if (buildingName != nil) {
                    return buildingName
                }else if(buildingNumber != nil){
                    return buildingNumber
                }else{
                    return nil
                }
            }
        }
        //使用if语句来检查是否成功调用printNumberOfRooms方法：如果方法通过可选链调用成功，printNumberOfRooms的隐士返回值将会是Void，如果没有成功，将返回nil
        let tomn = Peple()
        if ((tomn.residence?.printNumberOfRooms()) != nil) {
            print("输出房间号")
        }else{
            print("无法输出房间号")
        }
        //使用可选链滴啊用下标脚本
        //你可以使用可选链来尝试从下标脚本获取值并检查下标的调用是否成功，然而，你不能通过可选链来设置下标脚本。
        let lee = Peple()
        let johnsHouse = RoomsResidence()
        johnsHouse.rooms.append(Room(name: "客厅"))
        johnsHouse.rooms.append(Room(name: "厨房"))
        lee.residence = johnsHouse
        if let firstRoomName = lee.residence?[0].name {
            print("第一个房间名为\(firstRoomName)")
        }else{
            print("无法检索到房间")
        }
        
        //访问可选类型的下标
        
        
    }
    

    func backWards(s1: String, s2: String) -> Bool {
        return s1 > s2
    }
    //元组作为函数返回值
    func minMax(array: [Int]) -> (min: Int, max:Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin{
                currentMin = value
            }else if value > currentMax{
                currentMax = value
            }
        }
        return(currentMin, currentMax)
    }
    //可选元组作为函数返回值
    func minMaxOptional(array: [Int]) -> (min: Int, max:Int)? {
        if array.isEmpty {
            return nil
        }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin{
                currentMin = value
            }else if value > currentMax{
                currentMax = value
            }
        }
        return(currentMin, currentMax)
    }
    func pow(firstArg a: Int, secondArg b: Int) -> Int {
        var res = a
        for _ in 1..<b {
            res = res * a
        }
        return res
    }
    //可变参数
    func vari<N>(members: N...) {
        for i in members {
            print(i)
        }
    }
    
    //变量参数
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    //函数嵌套
    func calcDecrement(forDecrement total: Int) -> () -> Int {
        var overallDecrement = 0
        func decrement() -> Int{
            overallDecrement -= total
            return overallDecrement
        }
        return decrement
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
