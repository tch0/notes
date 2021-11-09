import Geometry as G
import qualified Geometry.Sphere as Sphere
import qualified Geometry.Cube as Cube
import qualified Geometry.Cuboid as Cuboid


c :: Double
c = cubeVolume 10

x :: Double
x = Sphere.area 10

y :: Double
y = Cube.volume 20

z :: Double
z = Cuboid.area 1 2 3

main :: IO ()
main = print (c, x, y, z)