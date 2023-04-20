#!/usr/bin/env wolframscript
(* By Le CHEN, (chenle02@gmail.com) *)
(* Mon 10 Apr 2023 09:13:48 PM EDT *)

(* Define the function *)

f[z_] := z - z^(1/2);
complexPlot = ComplexPlot[f[z], {z, -2 - 2 I, 2 + 2 I},
   PlotLegends -> Automatic,
   ColorFunction -> "CyclicReImLogAbs"
   ];

z = x + y I;
realPart = Re[f[z]];
imagPart = Im[f[z]];

(* 1. Draw contour *)

contourPlot = ContourPlot[
   {realPart == 0, imagPart == 0}, {x, -2, 2}, {y, -2, 2},
   PlotLegends -> {"Real part = 0", "Imaginary part = 0"},
   ContourStyle -> {Directive[Red, Thick], Directive[Blue, Thick]},
   FrameLabel -> {"Re(z)", "Im(z)"},
   BaseStyle -> {FontFamily -> "Times", FontWeight -> Bold,
     FontSize -> 12},
   PlotLabel ->
    "Contours of f(z) = z - \!\(\*SuperscriptBox[\(z\), \(1/2\)]\)"
   ];
output = Show[complexPlot, contourPlot]
Export["Section_10-4_Example-1-Contour.pdf", output];
Export["Section_10-4_Example-1-Contour.png", output];

(* 2. Draw the saddle point *)

fr = ContourPlot[realPart, {x, -2, 2}, {y, -2, 2},
   Contours -> Range[-1, 1, 1/8],
   ContourStyle -> Directive[Opacity[0.5], Thick, Red],
   ContourShading -> None,
   ContourLabels -> (Text[#3, {#1, #2}, Background -> None] &),
   PlotLegends -> Automatic
   ];
fi = ContourPlot[imagPart, {x, -2, 2}, {y, -2, 2},
   Contours -> Range[-2, 2, 1/2],
   ContourStyle -> Directive[Opacity[0.5], Thick, Dashed, Blue],
   ContourShading -> None,
   ContourLabels -> (Text[#3, {#1, #2}] &),
   PlotLegends -> Automatic
   ];
complexPlot = ComplexPlot[f[z], {z, -2 - 2 I, 2 + 2 I},
   PlotLegends -> Automatic
   ];
output = Show[complexPlot, fr, fi]
Export["Section_10-4_Example-1_Saddle.pdf", output];
Export["Section_10-4_Example-1_Saddle.png", output];

