method isPrefix(pre: string, str: string) returns (res:bool){
    var matches := true;
    var i := 0;
    if(|pre| > |str|){
        return false;    
    }
    while(i < |pre|){
        if(pre[i] != str[i]){
            matches := false;
        }
        i := i + 1;
    }
    return matches;
}

method isSubstring(sub: string, str: string) returns (res:bool){

	if(|sub| > |str|){
        return false;
    }

	var prefix := isPrefix(sub, str);
	if(prefix){
		return true;
	}
	
	var i := 0;
	var j := 0;
	while(i < (|str| - |sub| + 1)){
		while(j < |sub|){
			if(str[i + j] == sub[j]){
				if(j == (|sub| - 1)){	// if reached end of substring within string, return true
					return true;
				}
			}
			else{
				break;
			}
			j := j + 1;
		}
		j := 0;
		i := i + 1;
	}

	return false;
}

method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool){
    var strTest;
    var i := 0;
    var testSub: string;
    var otherStr: string;
    var result;

    //find longer string, make it string to take test sub str from
    if(|str1| >= |str2|){
        strTest := str1;
        otherStr := str2;
    }
    else{
        strTest := str2;
        otherStr := str1;
    }

    //ensure k is between 0 and length of both strings
    if(k > |str1| || k > |str2| || k <= 0 ){
        return false;
    }

    while(i+k < |strTest|)
    {
        //get sub string of length k starting from index 0
        testSub := strTest[i..i+k];
        
        //check if the test subStr is a subStr of other string
        result := isSubstring(testSub, otherStr);

        if(result){
            return true;
        }
        
        testSub := "";
        i := i + 1;
    }
    return false;
}