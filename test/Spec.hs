import           Lib

import           Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Lib.distribution" $ do
    it "has the expected result for 1 pirate" $ do
      distribution 1 `shouldBe` [100]

    it "has the expected result for 2 pirates" $ do
      distribution 2 `shouldBe` [100, 0]

    it "has the expected result for 3 pirates" $ do
      distribution 3 `shouldBe` [99, 0, 1]

    it "has the expected result for 4 pirates" $ do
      distribution 4 `shouldBe` [99, 0, 1, 0]

    it "has the expected result for 5 pirates" $ do
      distribution 5 `shouldBe` [98, 0, 1, 0, 1]

    it "has the expected result for 6 pirates" $ do
      distribution 6 `shouldBe` [98, 0, 1, 0, 1, 0]
