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


//최혁 Ones 코딩도장 풀이 
//2나5로나눌수없는 0이상 10000이하의 정수 입력
//10진수로 표시했을때, 모든 자리 숫자가 1인 숫자가 있다.
//입력한 정수의 배수 중에서 가장 작은 것(111,1111,11111)은 몇자리 수 일까?

//return value = String
func fnOnes(input:Int)-> String{
    if( input < 0 || input > 10000){
        return "0이상 10000이하의정수만 가능합니다.";
    }
    if( input%2 == 0 || input%5 == 0){
        return ("2나 5로 나눌수 있는 수 입니다.");
    }
    //아래 식으로 계산하여 나온결과가 입력한 값의 배수일때까지 loop
    // 1 * 10 +1 = 11  
    // 11 * 10 +1 = 111 
    // 111 * 10 +1 = 1111 
    var val = 1;
    while (val % input != 0 ) {
        val = val * 10+1;   
        if(val >= 1000000000000000000 ){ //너무 큰 수가 나올땐 Return
            return toString(val)
        }
    }
    return "\(countElements(toString(val)))" //val 결과를 String으로 변환해서 문자 갯수를 반환
}

//아래 function을 실행해서 결과를 확인해보세요 :)
//fnOnes(3);
//fnOnes(7);
fnOnes(9901);
//fnOnes(2);
//fnOnes(9);
