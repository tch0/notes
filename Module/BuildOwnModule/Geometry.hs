module Geometry
( sphereVolume
, sphereArea
, cubeVolume
, cubeArea
, cuboidVolume
, cuboidArea
) where


sphereVolume :: Floating a => a -> a
sphereVolume radius = (4.0 / 3.0) * pi * (radius ^ 3)

sphereArea :: Floating a => a -> a
sphereArea radius = 4 * pi * (radius ^ 2)

cubeVolume :: Floating a => a -> a
cubeVolume side = cuboidVolume side side side

cubeArea :: Floating a => a -> a
cubeArea side = cuboidArea side side side

cuboidVolume :: Floating a => a -> a -> a -> a
cuboidVolume a b c  = a * b * c

cuboidArea :: Floating a => a -> a -> a -> a
cuboidArea a b c = (rectangleArea a b + rectangleArea b c + rectangleArea a c) * 2

rectangleArea :: Floating a => a -> a -> a
rectangleArea a b = a * b

{-
>>> cuboidArea 1 2 3
22.0
>>> cubeArea 10
600.0
>>> cubeVolume 10
1000.0
-}
