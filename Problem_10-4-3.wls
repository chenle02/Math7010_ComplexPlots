#!/usr/bin/env wolframscript
(* By Le CHEN, (chenle02@gmail.com) *)
(* Mon 10 Apr 2023 09:13:48 PM EDT *)

(* Define the function *)

f[z_] := I ( z + 1/3 z^3 )

(* Plot the real and imaginary parts of the function *)
z = x + I y;
realPart = Re[f[z]];
imagPart = Im[f[z]];
fr = ContourPlot[realPart, {x, -2, 2}, {y, -2, 2},
   Contours -> Range[-1, 1, 1/4],
   ContourStyle -> Directive[Opacity[0.5], Thick, Red],
   ContourShading -> None,
   ContourLabels -> (Text[#3, {#1, #2}, Background -> None] &),
   PlotLegends -> Automatic
   ];
fi = ContourPlot[imagPart, {x, -2, 2}, {y, -2, 2},
   Contours -> Range[-1, 1, 1/4],
   ContourStyle -> Directive[Opacity[0.5], Thick, Dashed, Blue],
   ContourShading -> None,
   ContourLabels -> (Text[#3, {#1, #2}] &),
   PlotLegends -> Automatic
   ];
complexPlot = ComplexPlot[f[z], {z, -2 - 2 I, 2 + 2 I},
   PlotLegends -> Automatic
   ];
output = Show[complexPlot, fr, fi]
Export["Problem_10-4-3.pdf", output];
Export["Problem_10-4-3.png", output];

