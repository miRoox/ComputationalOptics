(*
  MIT License

  Copyright (c) 2018-2019 miRoox

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

      THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*)

Package["ComputationalOptics`"]

(*export*)
PackageExport["LightFieldQ"]
PackageScope["holdLightFieldQ"]

(*import*)
PackageImport["GeneralUtilities`"]
PackageExport["LightField"]
PackageScope["lengthQuatityQ"]


SetAttributes[LightFieldQ,ReadProtected]
GeneralUtilities`SetUsage[LightFieldQ,
  "LightFieldQ[expr$] yields True if expr$ is a valid LightField object.",
  "LightFieldQ[expr$, type$] yields True if expr$ is a valid LightField object of type$."
]

HoldPattern@LightFieldQ[
  LightField["MonochromaticPlaneComplex",
    KeyValuePattern[{
      "Data"->_?MatrixQ,
      "Wavelength"->_?lengthQuatityQ,
      "PhysicalSize"->{_?lengthQuatityQ,_?lengthQuatityQ}
    }]
  ]
]=True
LightFieldQ[_]=False
LightFieldQ[expr_,type_]:=LightFieldQ[expr] && expr["Type"]===type

SetAttributes[holdLightFieldQ,HoldAllComplete]
holdLightFieldQ[expr_]:=LightFieldQ[Unevaluated[expr]]
