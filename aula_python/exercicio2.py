import pytest
from hypothesis import given
from hypothesis.strategies import lists, integers


def myIndex(input_list, value):
    if len(input_list) == 0:
        raise ValueError("List is empty")
    try:
        return 1 + myIndex(input_list[1:], value)
    except:
        if value == input_list[0]:
            return 0
        else:
            raise ValueError("Value not found in list")
        
def test_myIndex1():
    list = [1,2,3,4]
    assert myIndex(list, 4) == 3
    
def test_myIndex2():
    list = [1,2,3,4]
    assert myIndex(list, 1) == 0
    
def test_myIndex3():
    list = [1,2,3,4]
    with pytest.raises(ValueError):
        myIndex(list, 5)
        
def test_myIndex4():
    list = [1,2,3,4]
    with pytest.raises(ValueError):
        myIndex(list, 0)
        
def test_myIndex5():
    list = [1,2,3,4]
    with pytest.raises(ValueError):
        myIndex(list, -1)
    
def test_myIndex6():
    list = [1,-2,3,4]
    assert myIndex(list, -2) == 1
    
def test_myIndex7():
    list = []
    with pytest.raises(ValueError):
        myIndex(list, 2)