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