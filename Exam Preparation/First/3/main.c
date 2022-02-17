int func_len(char c[100]) {

    int eax = 0;
    if (c[0] == '\0') {
        return eax;
    }
    ++eax;
    int edi = func_len(c + 1);
    
    eax += edi;
    return eax;
}