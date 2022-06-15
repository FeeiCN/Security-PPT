Scala
ADC  2013  


·    · Blogh1p://hongjiang.info   ·   
­ Java  :  10y+     ­ Scala  :  2y+   ­ 2009
laiwang.com&    ­ Scala   ­   


·                  1)  Scala  
  2)  Scala            · h1ps://github.com/CSUG/csug/  
·         Scala:  94329267/sugsug       





  

Haskell Miranda Clean





ML OCaml   Scala F# Lisp Scheme Erlang

Scala
Scala




   --   """""" 




· /  
­    ­    ­ ()  
· Lambda(  calculus)  
­ ()

·     
  --ML  for  the  Working  Programmer  

         vs      

(side  effect)

Scala
· valvarscala"" ""  
· valvar val



Scala
·   1)    
· 2)   if,while,for,try,match  
· 3)  {...}   

Scala
·      1)  a=1;     2)  while(a<100){print(a)}     3)  if(a<2)  1;  
· whileUnit, :  ()  
· ifelseUnit ()if(a<2)  1  else  ()  


java   1while(  (line  =  readLine()  )  !=  null  )       line  =  readLine()  Unit
  
2x=y=1;  //  y=1;  x=()     y=1()xUnit

    

Funcfon  vs  Method  

ScalaFuncfon/Method/Functor  
1)  ()   (method):  trait/class/objectdef
      (funcfon):  ParamsType=>ResultType
FuncfonN      2)  
Scala   




1) /   2)    3)    4) (parfal  applicafon)   5)   
  h1p://en.wikipedia.org/wiki/First--class_funcfon  


scala>  def  hf(f:  ()=>String)  =  println(f)   hf:  (f:  ()  =>  String)Unit      scala>  hf(()=>"hi")    //     hi      scala>  def  foo()  =  "ok"   foo:  ()String      scala>  hf(foo)    //  eta--conversion:  ()=>foo()   ok


scala>  val  fun  =  (x:Int)  =>  print(x)   fun:  Int  =>  Unit  =  <funcfon1>      scala>  fun(2)   2


scala>  def  foo  ()  {             |      def  bar()  {             |              println("hi")             |      }             |      bar             |  }


 


lambda:  (Funcfon  literal)  

                        (x  :Int,  y:  Int)                  =>              x  +  y  







  (Int,Int)=>Int   Scala022



Scala
  eg:     
  scala>  def  f2(f:  ()=>Unit)  {  f()  }     f2:  (f:  ()  =>  Unit)Unit  
  scala>  def  f1()  {println(1)}     f1:  ()Unit  
  scala>  f2(f1)     1  
  scala>  f2(()=>println("hi"))    //     hi  

Scala
  eg:     
  scala>  def  hf():Int=>Int  =  x=>x+1     hf:  ()Int  =>  Int        scala>  val  fun  =  hf     fun:  Int  =>  Int  =  <funcfon1>        scala>  fun(2)     res0:  Int  =  3  

  
lambda   

· 

(currying)  

(currying)  
scala>  def  sum(x:Int,  y:Int)  =  x+y   sum:  (x:  Int,  y:  Int)Int      //   scala>  def  sum2(x:Int)(y:Int)  =  x+y   sum2:  (x:  Int)(y:  Int)Int        
  

(currying)  
scala>  sum2(1)(2)   res1:  Int  =  3      //     scala>  def  first(x:Int)  =  (y:Int)=>x+y   first:  (x:  Int)Int  =>  Int      scala>  first(1)   res2:  Int  =>  Int  =  <funcfon1>      scala>  val  second  =  first(1)   second:  Int  =>  Int  =  <funcfon1>      scala>  second(2)  
res3:  Int  =  3  

(currying)  

·     
        f(1)(2)(3)    à      ((f(1))(2))(3)  







fa(1)  

r(2)  

fc(3)  

x  

1

2 3

(currying)  
·      1)    
        foo(res,  ()=>print("test))  
        foo(res)(()=>print("test"))               foo(res){            ()=>print("test")         }  

(currying)  
·      2)    
          

(parfal  applicafon  funcfon)  


(parfal  applicafon  funcfon)  
_      scala>  def  pow(x:Int,  y:Int)  =  Math.pow(x,y)   pow:  (x:  Int,  y:  Int)Double  
scala>  pow(2,3)   res4:  Double  =  8.0  
scala>  val  square  =  pow(_:Int,  2)   square:  Int  =>  Double  =  <funcfon1>  
scala>  square(3)   res5:  Double  =  9.0  

(parfal  applicafon  funcfon)  
   scala>  def  log(fme:Date,  msg:String)  {  println(fme  +  ":  "  +  msg)  }   log:  (fme:  java.ufl.Date,  msg:  String)Unit  
scala>  val  log2  =  log(new  Date,  _:String)   log2:  String  =>  Unit  =  <funcfon1>  
scala>  log2("test1")   scala>  log2("test2")   scala>  log2("test3")         

(parfal  applicafon  funcfon)
      scala>  val  pow2  =  pow  _   pow2:  (Int,  Int)  =>  Double  =  <funcfon2>  

(closure)  

Java
  public  Thread  createThread(){        //    
     final  int  innerVar  =  100;  
             return  new  Thread(){           public  void  run(){          System.out.println(innerVar);           }        };     }      innerVar        Java   

  +  

scala>  def  foo  =  {             |      val  localVal  =  "hello"             |      val  fun  =          ()=>        localVal      +    ",world"             |      fun             |  }

Scala

generic  types  as  first--class  types    

generic  types  as  first--class  types  
                   

Java  :    class  List<T>  {}      Scala:    class  List[T]  

List[T]

type  parameter type  constructor

Java  :    class  List2<C<T>>  {}    //      Scala:    class  List2[C[T]]      
          class  List2[C[_]]
List2[C[_]]


generic  types  as  first--class  types  
scala>  new  List2[List]
  



type

Proper  type()         Int,    String,       List[String]   List2[List]  

first--order/higher--order    type   (/:  )  
      List  (),           List2  ()

Higher--kinded  type

Kind  ?



String

"hi"

"alibaba"

Int

2

100

Kind:      
Kinds   Types  
Values ""

  
proper  type    kind  *  

Kind:

*

Proper  type:

String

List[Int]

Pair[Int,Int]

:  

Kind:

    *    *

 Currying
    *    *    *

/  :

Set List

Pair

:  

Higher--Kind:

  (  *    *)            *

/  :

List2

higher--kind  ,    h1p://adriaanm.github.io/files/higher.pdf  


class  List[T]            
Listproper  typeproper   type.  
        List  :        (T)  =>  List[T]                           *      *      class  List2[C[_]]  
List2proper  type  
        List2:      (T=>C[T])  =>  List2[C]                         (*      *)      *

type  lambda
Scala  supports  a  limited  version  of  type  lambda

type  lambda
scala>  def  foo[M[_]]  (f  :  M[Int])  =  f         scala>  foo[List]  (  List(1,2,3)  )   res9:  List[Int]  =  List(1,  2,  3)      scala>  foo  (  List(1,2,3)  )      //     res9:  List[Int]  =  List(1,  2,  3)      scala>  foo(  (x:Int)  =>  println(x)  )    //  

type  lambda
(x:Int)  =>  println(x)      Funcfon1[Int,  Unit]         scala>  foo[  ({type  X[Y]  =  Funcfon1[Y,  Unit]})#X  ]  (  (x:Int)=>print(x)  )   res5:  Int  =>  Unit  =  <funcfon1>

Scala   
scala h1ps://gist.github.com/jrudolph/66925


·    ·  hongjiang.wanghj@alibaba--inc.com

Q&A

