from math import prod
import pytest
from hypothesis import given
from hypothesis.strategies import lists, integers

def mulLR(list_nums):
    if len(list_nums) == 0:
        return 1
    else:
        return list_nums[0] * mulLR(list_nums[1:])
    
def mulLI(list_nums):
    res = 1
    for n in list_nums:
        res *= n
    return res

# a multiplicaçao do inverso da lista (reverse()) devolve o mesmo resultado
@given(lists(integers()))
def test_mulLR(l):
    x = list(l)
    l.reverse()
    mulLR(l) == mulLR(x)

######################################################################
 
# o resultado para uma lista com um elemento é igual a esse elemento
@given(lists(integers(), min_size=1, max_size=1))
def test_singleton(l):
    assert mulLR(l) == l[0]

@given(integers())
def test_singleton2(n):
    assert mulLR([n]) == n

######################################################################
    
# o resultado é igual ao resultado da função prod do módulo math
@given(lists(integers()))
def test_mul_math(l):
    assert mulLR(l) == prod(l)
    
 

######################################################################

