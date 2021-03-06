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
	
	var prefix : bool;
	var i := 0;

	while(i < (|str| - |sub| + 1)){
		prefix := isPrefix(sub, str[i..]);
		if(prefix){
			return true;
		}
		i := i + 1;
	}

	return false;
}

method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool){
    var i := 0;
    var testSub: string;
    var otherStr: string;
    var result;

    //ensure k is between 0 and length of both strings
    if(k > |str1| || k > |str2| || k <= 0 ){
        return false;
    }

    while(i+k <= |str1|)
    {
        //get sub string of length k starting from index 0
        testSub := str1[i..i+k];
        
        //check if the test subStr is a subStr of other string
        result := isSubstring(testSub, str2);

        if(result){
            return true;
        }
        
        testSub := "";
        i := i + 1;
    }
    return false;
}


method maxCommonSubstringLength(str1: string, str2: string) returns (len:nat){
	var maxSubstring := 0;
	var hasSubstring: bool;
	var length := 0;
	var shortStr: string;
	var longStr: string;

	if(|str1| == 0 || |str2| == 0){
		return 0;
	}
	
	if(|str1| < |str2|){
		shortStr := str1;
		longStr := str2;
	}
	else{
		shortStr := str2;
		longStr := str1;
	}

	var i := 0;
	var j := 0;
	while(i < |shortStr|){
		j := 0;
		while(j < |shortStr| - 1){
			if(j == 0){
				hasSubstring := haveCommonKSubstring(i, shortStr[i..i], longStr);
			}
			else{
				if(i + j < |shortStr|){
					hasSubstring := haveCommonKSubstring(i, shortStr[i..i+j], longStr);
				}
				hasSubstring := false;
			}	
			if(hasSubstring && j > maxSubstring){
				maxSubstring := j;
			}
			j := j + 1;
		}
		i := i + 1;
	}

	return maxSubstring;
}