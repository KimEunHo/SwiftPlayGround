// Playground - noun: a place where people can play

import Cocoa


/*
최초 실행시에는 currNum 값을 입력안하며 재귀 호출시에만 입력하도록 유도.
currNum 1부터 시작하여 10배 + 1 씩 증가함 (1,11,111,1111,11111 ....)
*/
func allOnes(input:Int, var currNum:Int = 1) -> Int{
    //0보다 작거나 1000보다 큰 입력값은 거부
    if input < 0 || input > 10000 {
        return 0
    }
    
    //입력값이 2,5의 배수는 거부
    if input % 2 == 0 || input % 5 == 0 {
        return 0
    }
    
    //return 결과를 받는 변수
    var result = 0;
    
    if currNum % input == 0 {
        /*
        currNum Mod 입력값(이하 n) 이 0이면 n의 배수이고, 최소값을 구하는 문제이기때문에
        현재 currnNum을 리턴해줌.
        */
        result = countElements(toString(currNum))
    }else{
        /*
        currNum Mod n 이 0이 아니라면 n의 배수가 아니므로
        currNum에 10배후 1을 더한후 다시 자기 자신을 호출
        
        allOnes(9901,1)
        allOnes(9901,11)
        allOnes(9901,111)
        .
        .
        .
        이런 순서
        
        최후에 n의 배수를 찾으면 return 해줌.
        */
        currNum = currNum * 10 + 1
        result = allOnes(input,currNum: currNum)
    }
    
    return result;
}

allOnes(9901)



func fnOnes(input:Int)-> String{
    if( input < 0 || input > 10000){
        return "0이상 10000이하의정수만 가능합니다.";
    }
    if( input%2 == 0 || input%5 == 0){
        return ("2나 5로 나눌수 있는 수 입니다.");
    }
    var val = 1;
    while (val % input != 0 ) {
        val = val * 10+1;
        if(val >= 1000000000000000000 ){
            return toString(val)
        }
    }
    return "\(countElements(toString(val)))"
}

//fnOnes(3);
//fnOnes(7);
fnOnes(9901);
//fnOnes(2);
//fnOnes(9);
