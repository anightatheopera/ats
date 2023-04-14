import pytest
from hypothesis import assume, given
from hypothesis.strategies import lists, integers

@given(integers())
def test_positive(x):
    assume(x > 0)
    assert (x * x * x) > 0

@given(integers(min_value=1, max_value=1000))
def test_positive2(x):
    assert (x * x * x) > 0

def isSorted(list_nums):
    return False not in [a <= b for (a,b) in zip(list_nums, list_nums[1:])]
def insert(elem, list_nums):
    i = 0
    r = []
    while (i < len(list_nums) and elem > list_nums[i]):
        r.append(list_nums[i])
        i += 1
    r.append(elem)
    while (i < len(list_nums)):
        r.append(list_nums[i])
        i += 1
    return r

@given(integers(), lists(integers()))
def test_ordenada(n,l):
    assume(isSorted(l))
    assert isSorted(insert(n,l))