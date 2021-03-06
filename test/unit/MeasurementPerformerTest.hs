module MeasurementPerformerTest where

import Test.Tasty
import Test.Tasty.HUnit


import QC



circuit::Qubit
circuit=algorithm
  where
    oracle=Gate ((4><4) [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]::Matrix C)
    gateH2=(hGate <+> hGate)
    algorithm=entangle qZero (qZero |> xGate) |> gateH2 |> oracle |> gateH2


testMeasure::TestTree
testMeasure=testCase "Test measureFunction function"
    (assertEqual "|0>|0>," (Qubit (((4><1) [ 0.0 :+ 0.0 
                                  , 1.0 :+ 0.0 
                                  , 0.0 :+ 0.0 
                                  , 0.0 :+ 0.0 
                                  ]:: Matrix C))) (measure circuit))



