import Test.QuickCheck
import Test.QuickCheck.Function
import Data.List

mull :: Num a => [a] -> a
mull [] = 1
mull (x:xs) = x + mull xs

prop_revmull :: [Int] -> Bool
prop_revmull l = mull l == mull (reverse l)

prop_product :: [Int] -> Bool
prop_product l = mull l == product l

find' :: (a -> Bool) -> [a] -> Maybe a
find' f [] = Nothing
find' f (x:xs) = case find' f xs of
        Just k -> Just k
        Nothing -> if f x then Just x else find' f xs

prop_findl :: Int -> Bool
prop_findl n = find' (const True) [n] == Just n

prop_find2 :: [Int] -> Bool
prop_find2 l = find' (const False) l == Nothing

prop_find3 :: [Int] -> Bool
prop_find3 l = case find' (>0) l of
        Just k -> k > 0
        Nothing -> True

prop_find4 :: [Int] -> Property
prop_find4 l = length l > 0 ==> find' (const True) l == Just (head l)

prop_findEqual :: Fun Int Bool -> [Int] -> Bool
prop_findEqual f l = find p l == find' p l 
        where p = apply f
    
find'' :: Integral a => (a -> Bool) -> [a] -> Maybe a
find'' f [] = Nothing
find'' f (x:xs) 
        | f x = Just x
        | otherwise = find'' f xs

prop_positive :: Int -> Property
prop_positive x = x > 0 ==> (x * x * x) > 0

sorted :: Ord a => [a] -> Bool
sorted l = and (zipWith (<=) l (tail l))

insert' :: Ord a => a -> [a] -> [a]
insert' x [] = [x]
insert' x (y:ys)
    | x < y = x:y:ys
    | otherwise = y : insert' x ys

genPosInt :: Gen Int
genPosInt = do
    n <- arbitrary
    return (abs n)

prop_ins_ord :: Int -> [Int] -> Property
prop_ins_ord x l = sorted l ==> sorted (insert' x l)

prop_ins_ordB :: Int -> [Int] -> Property
prop_ins_ordB x l = 
    collect (length l) $
    sorted l ==> sorted (insert' x l)

prop_ins_ordC :: Int -> Property
prop_ins_ordC x = forAll orderedList $ \l ->
    sorted (insert' x l)

fromList :: [Int] -> BST
fromList [] = Empty
fromList (x:xs) = Node Empty x (fromList xs)

data BST = Empty | Node BST Int BST
        deriving (Show, Eq)

isBST :: BST -> Bool
isBST Empty = True
isBST (Node l x r) = isBST l && isBST r
                && maybeBigger (Just x) (maybeMax l)
                && maybeBigger (maybeMin r) (Just x)
        where maybeBigger _ Nothing = True
              maybeBigger Nothing _ = True
              maybeBigger (Just x) (Just y) = x >= y
              maybeMax Empty = Nothing
              maybeMax (Node _ x Empty) = Just x
              maybeMax (Node _ _ r) = maybeMax r
              maybeMin Empty = Nothing
              maybeMin (Node Empty x _) = Just x
              maybeMin (Node l _ _) = maybeMin l

genBST :: Gen BST
genBST = do
    l <- arbitrary
    return (fromList l)

genBST':: Gen BST
genBST' = fromList <$> arbitrary

genBST2 :: Gen BST
genBST2 = do
    l <- orderedList
    return (fromList l)

instance Arbitrary BST where
        arbitrary = genBST2

prop_BSTvalida :: BST -> Bool
prop_BSTvalida t = isBST t