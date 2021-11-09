module Geometry.Cuboid
( volume
, area
) where

volume :: Floating a => a -> a -> a -> a
volume a b c  = a * b * c

area :: Floating a => a -> a -> a -> a
area a b c = (rectangleArea a b + rectangleArea b c + rectangleArea a c) * 2

rectangleArea :: Floating a => a -> a -> a
rectangleArea a b = a * b