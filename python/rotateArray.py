#!/usr/bin/env python3

def rotateArray(d, arr):
    tmp_arr = arr.copy()
    count = 1
    rotate = True
    while rotate:
        if count == d:
            rotate = False
        tmp = tmp_arr.pop()
        tmp_arr.insert(0, tmp)
        count += 1

    return tmp_arr


arr1 = [1, 2, 3, 4, 5]
print(rotateArray(3, arr1))