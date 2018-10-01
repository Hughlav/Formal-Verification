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