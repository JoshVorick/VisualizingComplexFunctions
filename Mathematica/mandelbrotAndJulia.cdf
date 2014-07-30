(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[    136216,       2762]
NotebookOptionsPosition[    136786,       2759]
NotebookOutlinePosition[    137138,       2774]
CellTagsIndexPosition[    137095,       2771]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"pixels", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"xmin_", ",", "ymin_"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"xmax_", ",", "ymax_"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"width_", ",", "height_"}], "}"}]}], "]"}], ":=", 
    "\[IndentingNewLine]", 
    RowBox[{"N", "@", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"x", ",", "y"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"y", ",", "ymax", ",", "ymin", ",", 
         FractionBox[
          RowBox[{"ymin", "-", "ymax"}], 
          RowBox[{"height", "-", "1"}]]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"x", ",", "xmin", ",", "xmax", ",", 
         FractionBox[
          RowBox[{"xmax", "-", "xmin"}], 
          RowBox[{"width", "-", "1"}]]}], "}"}]}], "]"}]}]}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"mandelbrot", "=", 
   RowBox[{"Compile", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"p", ",", "_Real", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"p2", ",", "_Complex"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"bail", ",", "_Integer"}], "}"}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Module", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"i", "=", "0"}], ",", 
         RowBox[{"c0", "=", 
          RowBox[{
           RowBox[{
           "p", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], "+", 
           RowBox[{"I", " ", 
            RowBox[{
            "p", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}]}]}]}],
          ",", 
         RowBox[{"z", "=", "p2"}]}], "}"}], ",", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"While", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"i", "<", "bail"}], "&&", 
           RowBox[{
            RowBox[{"Abs", "[", "z", "]"}], "<", "4"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"i", "++"}], ";", "\[IndentingNewLine]", 
           RowBox[{"z", "=", 
            RowBox[{
             SuperscriptBox["z", "2"], "+", "c0"}]}], ";"}]}], 
         "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"i", "\[Equal]", "bail"}], ",", 
          RowBox[{"{", 
           RowBox[{"0.0", ",", "0.0", ",", "0.0"}], "}"}], ",", " ", 
          RowBox[{"(*", 
           RowBox[{
           "Using", " ", "Switch", " ", "statement", " ", "resulted", " ", 
            "in", " ", "an", " ", "error"}], " ", "*)"}], 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{
               RowBox[{"Mod", "[", 
                RowBox[{"i", ",", "4"}], "]"}], "==", "0"}], ",", 
              RowBox[{"{", 
               RowBox[{"0", ",", "0", ",", "0"}], "}"}], ",", 
              RowBox[{"(*", 
               RowBox[{"{", 
                RowBox[{"r", ",", "g", ",", "b"}], "}"}], "*)"}], 
              "\[IndentingNewLine]", 
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"Mod", "[", 
                  RowBox[{"i", ",", "16"}], "]"}], "==", "1"}], ",", 
                RowBox[{"{", 
                 RowBox[{"25", ",", "7", ",", "26"}], "}"}], ",", 
                "\[IndentingNewLine]", 
                RowBox[{"If", "[", 
                 RowBox[{
                  RowBox[{
                   RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "==", "2"}], ",", 
                  RowBox[{"{", 
                   RowBox[{"9", ",", "1", ",", "47"}], "}"}], ",", 
                  "\[IndentingNewLine]", 
                  RowBox[{"If", "[", 
                   RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "3"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"4", ",", "4", ",", "73"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "4"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "7", ",", "100"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "5"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"12", ",", "44", ",", "128"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "6"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"24", ",", "82", ",", "177"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "7"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"57", ",", "125", ",", "209"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "8"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"134", ",", "181", ",", "229"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "9"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"211", ",", "236", ",", "248"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "10"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"241", ",", "233", ",", "191"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "11"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"248", ",", "201", ",", "95"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "12"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"255", ",", "170", ",", "0"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "13"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"204", ",", "128", ",", "0"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "14"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"153", ",", "87", ",", "0"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "15"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"106", ",", "52", ",", "3"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0", ",", "0"}], "}"}]}], 
                    "\[IndentingNewLine]", "]"}]}], "]"}]}], "]"}]}], "]"}]}],
                     "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}]}], 
                    "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}], " ", 
            ")"}], "/", " ", "255.0"}]}], "]"}]}]}], "\[IndentingNewLine]", 
      "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"juliaset", "=", 
   RowBox[{"Compile", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"p", ",", "_Real", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"p2", ",", "_Complex"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"bail", ",", "_Integer"}], "}"}]}], "}"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"Module", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"i", "=", "0"}], ",", 
         RowBox[{"c0", "=", "p2"}], ",", 
         RowBox[{"z", "=", 
          RowBox[{
           RowBox[{
           "p", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], "+", 
           RowBox[{"I", " ", 
            RowBox[{
            "p", "\[LeftDoubleBracket]", "2", 
             "\[RightDoubleBracket]"}]}]}]}]}], "}"}], ",", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"While", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"i", "<", "bail"}], "&&", 
           RowBox[{
            RowBox[{"Abs", "[", "z", "]"}], "<", "4"}]}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"i", "++"}], ";", "\[IndentingNewLine]", 
           RowBox[{"z", "=", 
            RowBox[{
             SuperscriptBox["z", "2"], "+", "c0"}]}], ";"}]}], 
         "\[IndentingNewLine]", "]"}], ";", "\[IndentingNewLine]", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"i", "\[Equal]", "bail"}], ",", 
          RowBox[{"{", 
           RowBox[{"0.0", ",", "0.0", ",", "0.0"}], "}"}], ",", " ", 
          RowBox[{"(*", 
           RowBox[{
           "Could", " ", "not", " ", "make", " ", "this", " ", "its", " ", 
            "own", " ", "function"}], "*)"}], "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{
               RowBox[{"Mod", "[", 
                RowBox[{"i", ",", "4"}], "]"}], "==", "0"}], ",", 
              RowBox[{"{", 
               RowBox[{"0", ",", "0", ",", "0"}], "}"}], ",", 
              "\[IndentingNewLine]", 
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"Mod", "[", 
                  RowBox[{"i", ",", "16"}], "]"}], "==", "1"}], ",", 
                RowBox[{"{", 
                 RowBox[{"25", ",", "7", ",", "26"}], "}"}], ",", 
                "\[IndentingNewLine]", 
                RowBox[{"If", "[", 
                 RowBox[{
                  RowBox[{
                   RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "==", "2"}], ",", 
                  RowBox[{"{", 
                   RowBox[{"9", ",", "1", ",", "47"}], "}"}], ",", 
                  "\[IndentingNewLine]", 
                  RowBox[{"If", "[", 
                   RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "3"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"4", ",", "4", ",", "73"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "4"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "7", ",", "100"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "5"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"12", ",", "44", ",", "128"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "6"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"24", ",", "82", ",", "177"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "7"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"57", ",", "125", ",", "209"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "8"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"134", ",", "181", ",", "229"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "9"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"211", ",", "236", ",", "248"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "10"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"241", ",", "233", ",", "191"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "11"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"248", ",", "201", ",", "95"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "12"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"255", ",", "170", ",", "0"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "13"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"204", ",", "128", ",", "0"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "14"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"153", ",", "87", ",", "0"}], "}"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{
                    RowBox[{"Mod", "[", 
                    RowBox[{"i", ",", "16"}], "]"}], "\[Equal]", "15"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"106", ",", "52", ",", "3"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0", ",", "0"}], "}"}]}], 
                    "\[IndentingNewLine]", "]"}]}], "]"}]}], "]"}]}], "]"}]}],
                     "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}]}], 
                    "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}]}], "]"}], " ", 
            ")"}], "/", " ", "255.0"}]}], "]"}]}]}], "\[IndentingNewLine]", 
      "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"imagine", "[", 
     RowBox[{
     "image_", ",", "p1_", ",", "p2_", ",", "r_", ",", "res_", ",", "bail_", 
      ",", "type_"}], "]"}], ":=", 
    RowBox[{"time", "=", 
     RowBox[{"First", "@", 
      RowBox[{"AbsoluteTiming", "[", "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"progress", "=", "0"}], ";", "\[IndentingNewLine]", 
        RowBox[{"Module", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"s", "=", "333"}], ",", "f"}], "}"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"f", ":=", 
            RowBox[{"Switch", "[", 
             RowBox[{
             "type", ",", "1", ",", "mandelbrot", ",", "2", ",", "juliaset"}],
              "]"}]}], ";", "\[IndentingNewLine]", 
           RowBox[{"image", "=", 
            RowBox[{"Image", "[", 
             RowBox[{
              RowBox[{"MapIndexed", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"progress", "=", 
                    RowBox[{"res", " ", 
                    RowBox[{
                    RowBox[{
                    "#2", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "/", "s"}]}]}], ";", 
                   RowBox[{
                    RowBox[{
                    RowBox[{"f", "[", 
                    RowBox[{"#", ",", 
                    RowBox[{
                    RowBox[{
                    "p2", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "+", 
                    RowBox[{"I", " ", 
                    RowBox[{
                    "p2", "\[LeftDoubleBracket]", "2", 
                    "\[RightDoubleBracket]"}]}]}], ",", "bail"}], "]"}], 
                    "&"}], "/@", "#1"}]}], ")"}], "&"}], ",", 
                RowBox[{"pixels", "[", 
                 RowBox[{
                  RowBox[{"p1", "-", "r"}], ",", 
                  RowBox[{"p1", "+", "r"}], ",", 
                  RowBox[{"{", 
                   RowBox[{
                    RowBox[{"s", "/", "res"}], ",", 
                    RowBox[{"s", "/", "res"}]}], "}"}]}], "]"}]}], "]"}], ",", 
              RowBox[{"Magnification", "\[Rule]", "res"}]}], "]"}]}]}]}], 
         "\[IndentingNewLine]", "]"}]}], "]"}]}]}]}], ";"}], 
  "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"genVectorListMan", "[", 
    RowBox[{"iter_Integer", ",", "c_Complex", ",", " ", "z1_"}], "]"}], ":=", 
   RowBox[{"NestWhileList", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        SuperscriptBox["#", "2"], "+", "c"}], ")"}], "&"}], ",", "z1", ",", 
     RowBox[{
      RowBox[{
       RowBox[{"Abs", "[", "#", "]"}], "<", "4"}], "&"}], ",", "1", ",", 
     "iter"}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{
    RowBox[{"graphVectorsMan", "[", 
     RowBox[{"iter_Integer", ",", "c_", ",", "z1_"}], "]"}], ":=", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"tmp1", "=", 
        RowBox[{
         RowBox[{
          RowBox[{"genVectorListMan", "[", 
           RowBox[{"iter", ",", "#", ",", "z1"}], "]"}], "&"}], "/@", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
           "c", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], "+", 
           RowBox[{"I", " ", 
            RowBox[{
            "c", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}]}]}], 
          "}"}]}]}], "}"}], ",", 
      RowBox[{"MapIndexed", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{"White", ",", 
           RowBox[{"Arrow", "[", "#1", "]"}]}], "}"}], "&"}], ",", 
        RowBox[{
         RowBox[{
          RowBox[{"Partition", "[", 
           RowBox[{
            RowBox[{
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"Re", "[", "#", "]"}], ",", 
                RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", "#"}], 
            ",", "2", ",", "1"}], "]"}], "&"}], "/@", "tmp1"}]}], "]"}]}], 
     "]"}]}], ";"}], "\[IndentingNewLine]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"genVectorListJulia", "[", 
    RowBox[{"iter_Integer", ",", "z1_Complex", ",", " ", "c_"}], "]"}], ":=", 
   RowBox[{"NestWhileList", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        SuperscriptBox["#", "2"], "+", "c"}], ")"}], "&"}], ",", "z1", ",", 
     RowBox[{
      RowBox[{
       RowBox[{"Abs", "[", "#", "]"}], "<", "4"}], "&"}], ",", "1", ",", 
     "iter"}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   RowBox[{"graphVectorsJulia", "[", 
    RowBox[{"iter_Integer", ",", "c_Complex", ",", "z1_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"tmp1", "=", 
       RowBox[{
        RowBox[{
         RowBox[{"genVectorListJulia", "[", 
          RowBox[{"iter", ",", "c", ",", "#"}], "]"}], "&"}], "/@", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{
          "z1", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], "+", 
          RowBox[{"I", " ", 
           RowBox[{
           "z1", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}]}]}], 
         "}"}]}]}], "}"}], ",", 
     RowBox[{"MapIndexed", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{"White", ",", 
          RowBox[{"Arrow", "[", "#1", "]"}]}], "}"}], "&"}], ",", 
       RowBox[{
        RowBox[{
         RowBox[{"Partition", "[", 
          RowBox[{
           RowBox[{
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"Re", "[", "#", "]"}], ",", 
               RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", "#"}], 
           ",", "2", ",", "1"}], "]"}], "&"}], "/@", "tmp1"}]}], "]"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Row", "[", 
    RowBox[{"{", "\[IndentingNewLine]", 
     RowBox[{
      RowBox[{"Column", "[", 
       RowBox[{"{", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"Row", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Subscript", "[", 
             RowBox[{"\"\<{z\>\"", ",", "\"\<n+1\>\""}], "]"}], " ", ",", 
            "\"\< = \>\"", ",", 
            RowBox[{"Subscript", "[", 
             RowBox[{"\"\<z\>\"", ",", "\"\<n\>\""}], "]"}], ",", " ", 
            "\"\< + A+Bi} where \>\"", ",", 
            RowBox[{"Subscript", "[", 
             RowBox[{"\"\<z\>\"", ",", "\"\<1\>\""}], "]"}], ",", 
            "\"\< is \>\"", ",", 
            RowBox[{"Dynamic", "[", 
             RowBox[{"NumberForm", "[", 
              RowBox[{
               RowBox[{
               "p2", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
               ",", "4"}], "]"}], "]"}], ",", "\"\< + \>\"", ",", 
            RowBox[{"Dynamic", "[", 
             RowBox[{"NumberForm", "[", 
              RowBox[{
               RowBox[{
               "p2", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], 
               ",", "4"}], "]"}], "]"}], ",", " ", "\"\<i\>\""}], " ", "}"}], 
          "]"}], ",", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"oldres1", "\[NotEqual]", "res"}], "||", 
             RowBox[{"oldbail1", "\[NotEqual]", "bail"}]}], ",", " ", 
            RowBox[{
             RowBox[{"oldres1", "=", "res"}], ";", 
             RowBox[{"oldbail1", "=", "bail"}], ";", "\[IndentingNewLine]", 
             RowBox[{"imagine", "[", 
              RowBox[{
               RowBox[{"Unevaluated", "@", "image1"}], ",", "p1", ",", "p2", 
               ",", "r1", ",", "res", ",", "bail", ",", "1"}], "]"}]}]}], 
           "]"}], ";", "\[IndentingNewLine]", 
          RowBox[{"With", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"s", "=", 
              RowBox[{"res", " ", 
               RowBox[{"First", "@", 
                RowBox[{"ImageDimensions", "@", "image1"}]}]}]}], "}"}], ",", 
            "\[IndentingNewLine]", 
            RowBox[{"LocatorPane", "[", 
             RowBox[{
              RowBox[{"Dynamic", "[", "p1", "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"Graphics", "[", 
               RowBox[{
                RowBox[{"{", "\[IndentingNewLine]", 
                 RowBox[{
                  RowBox[{"If", "[", 
                   RowBox[{"show1", ",", "\[IndentingNewLine]", 
                    RowBox[{"{", "\[IndentingNewLine]", 
                    RowBox[{
                    RowBox[{"graphVectorsJulia", "[", 
                    RowBox[{"15", ",", 
                    RowBox[{
                    RowBox[{
                    "p2", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "+", 
                    RowBox[{"I", " ", 
                    RowBox[{
                    "p2", "\[LeftDoubleBracket]", "2", 
                    "\[RightDoubleBracket]"}]}]}], ",", "p1"}], "]"}], ",", 
                    "\[IndentingNewLine]", "White", ",", "Thick", ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Circle", "[", 
                    RowBox[{"p1", ",", 
                    RowBox[{"0.02", "r1"}]}], "]"}], ",", 
                    "\[IndentingNewLine]", "Thin", ",", "\[IndentingNewLine]", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"1.7", ",", "0"}], "}"}]}], "}"}], "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", "1.7"}], ",", "0"}], "}"}]}], "}"}], "]"}], 
                    ",", "\[IndentingNewLine]", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", 
                    RowBox[{"-", "1.7"}]}], "}"}]}], "}"}], "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "1.7"}], "}"}]}], "}"}], "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Text", "[", 
                    RowBox[{
                    RowBox[{"Style", "[", 
                    RowBox[{"\"\<A\>\"", ",", " ", "Medium"}], "]"}], ",", 
                    " ", 
                    RowBox[{"{", 
                    RowBox[{"1.5", ",", 
                    RowBox[{"-", "0.1"}]}], "}"}]}], "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Text", "[", 
                    RowBox[{
                    RowBox[{"Style", "[", 
                    RowBox[{"\"\<B\>\"", ",", " ", "Medium"}], "]"}], ",", 
                    " ", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", "0.1"}], ",", "1.5"}], "}"}]}], "]"}]}], 
                    "\[IndentingNewLine]", "}"}]}], "]"}], ","}], 
                 "\[IndentingNewLine]", "}"}], ",", 
                RowBox[{"PlotRange", "\[Rule]", 
                 RowBox[{"{", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    "c", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "+", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", "r1"}], ",", "r1"}], "}"}]}], ",", 
                   RowBox[{
                    RowBox[{
                    "c", "\[LeftDoubleBracket]", "2", 
                    "\[RightDoubleBracket]"}], "+", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", "r1"}], ",", "r1"}], "}"}]}]}], "}"}]}], ",", 
                RowBox[{"ImageSize", "\[Rule]", "s"}], ",", 
                RowBox[{"Prolog", "\[Rule]", 
                 RowBox[{"Inset", "[", 
                  RowBox[{"image1", ",", "c", ",", 
                   RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], 
                    FractionBox[
                    RowBox[{"s", "+", "1"}], 
                    RowBox[{"2", "res"}]]}], ",", 
                   RowBox[{"Scaled", "[", 
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], "]"}]}], "]"}]}]}], 
               "]"}]}], "]"}]}], "]"}]}]}], "\[IndentingNewLine]", "}"}], 
       "]"}], ",", "\[IndentingNewLine]", 
      RowBox[{"Column", "[", 
       RowBox[{"{", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{"Row", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Subscript", "[", 
             RowBox[{"\"\<{z\>\"", ",", "\"\<n+1\>\""}], "]"}], " ", ",", 
            "\"\< = X+Yi + c} where c is \>\"", ",", 
            RowBox[{"Dynamic", "[", 
             RowBox[{"NumberForm", "[", 
              RowBox[{
               RowBox[{
               "p1", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
               ",", "4"}], "]"}], "]"}], ",", "\"\< + \>\"", ",", " ", 
            RowBox[{"Dynamic", "[", 
             RowBox[{"NumberForm", "[", 
              RowBox[{
               RowBox[{
               "p1", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], 
               ",", "4"}], "]"}], "]"}], ",", " ", "\"\<i\>\""}], "}"}], 
          "]"}], ",", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"oldres2", "\[NotEqual]", "res"}], "||", 
             RowBox[{"oldbail2", "\[NotEqual]", "bail"}]}], ",", 
            RowBox[{
             RowBox[{"oldres2", "=", "res"}], ";", 
             RowBox[{"oldbail2", "=", "bail"}], ";", "\[IndentingNewLine]", 
             RowBox[{"imagine", "[", 
              RowBox[{
               RowBox[{"Unevaluated", "@", "image2"}], ",", "p2", ",", "p1", 
               ",", "r2", ",", "res", ",", "bail", ",", "2"}], "]"}]}]}], 
           "]"}], ";", "\[IndentingNewLine]", 
          RowBox[{"With", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"s", "=", 
              RowBox[{"res", " ", 
               RowBox[{"First", "@", 
                RowBox[{"ImageDimensions", "@", "image2"}]}]}]}], "}"}], ",", 
            "\[IndentingNewLine]", 
            RowBox[{"LocatorPane", "[", 
             RowBox[{
              RowBox[{"Dynamic", "[", "p2", "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"Graphics", "[", 
               RowBox[{
                RowBox[{"{", "\[IndentingNewLine]", 
                 RowBox[{
                  RowBox[{"If", "[", 
                   RowBox[{"show2", ",", "\[IndentingNewLine]", 
                    RowBox[{"{", "\[IndentingNewLine]", 
                    RowBox[{
                    RowBox[{"graphVectorsMan", "[", 
                    RowBox[{"15", ",", "p1", ",", 
                    RowBox[{
                    RowBox[{
                    "p2", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "+", 
                    RowBox[{"I", " ", 
                    RowBox[{
                    "p2", "\[LeftDoubleBracket]", "2", 
                    "\[RightDoubleBracket]"}]}]}]}], "]"}], ",", 
                    "\[IndentingNewLine]", "White", ",", "Thick", ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Circle", "[", 
                    RowBox[{"p2", ",", 
                    RowBox[{"0.02", "r2"}]}], "]"}], ",", 
                    "\[IndentingNewLine]", "Thin", ",", "\[IndentingNewLine]", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"1.7", ",", "0"}], "}"}]}], "}"}], "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", "1.7"}], ",", "0"}], "}"}]}], "}"}], "]"}], 
                    ",", "\[IndentingNewLine]", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", 
                    RowBox[{"-", "1.7"}]}], "}"}]}], "}"}], "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Arrow", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"0", ",", "0"}], "}"}], ",", 
                    RowBox[{"{", 
                    RowBox[{"0", ",", "1.7"}], "}"}]}], "}"}], "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Text", "[", 
                    RowBox[{
                    RowBox[{"Style", "[", 
                    RowBox[{"\"\<X\>\"", ",", " ", "Medium"}], "]"}], ",", 
                    " ", 
                    RowBox[{"{", 
                    RowBox[{"1.5", ",", 
                    RowBox[{"-", "0.1"}]}], "}"}]}], "]"}], ",", 
                    "\[IndentingNewLine]", 
                    RowBox[{"Text", "[", 
                    RowBox[{
                    RowBox[{"Style", "[", 
                    RowBox[{"\"\<Y\>\"", ",", " ", "Medium"}], "]"}], ",", 
                    " ", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", "0.1"}], ",", "1.5"}], "}"}]}], "]"}]}], 
                    "\[IndentingNewLine]", "}"}]}], "]"}], ","}], 
                 "\[IndentingNewLine]", "}"}], ",", 
                RowBox[{"PlotRange", "\[Rule]", 
                 RowBox[{"{", 
                  RowBox[{
                   RowBox[{
                    RowBox[{
                    "z", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "+", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", "r2"}], ",", "r2"}], "}"}]}], ",", 
                   RowBox[{
                    RowBox[{
                    "z", "\[LeftDoubleBracket]", "2", 
                    "\[RightDoubleBracket]"}], "+", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", "r2"}], ",", "r2"}], "}"}]}]}], "}"}]}], ",", 
                RowBox[{"ImageSize", "\[Rule]", "s"}], ",", 
                RowBox[{"Prolog", "\[Rule]", 
                 RowBox[{"Inset", "[", 
                  RowBox[{"image2", ",", "z", ",", 
                   RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], 
                    FractionBox[
                    RowBox[{"s", "+", "1"}], 
                    RowBox[{"2", "res"}]]}], ",", 
                   RowBox[{"Scaled", "[", 
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], "]"}]}], "]"}]}]}], 
               "]"}]}], "]"}]}], "]"}]}]}], "\[IndentingNewLine]", "}"}], 
       "]"}]}], "\[IndentingNewLine]", "}"}], "]"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"Row", "[", 
    RowBox[{
     RowBox[{"{", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"Column", "[", 
        RowBox[{"{", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"Column", "@", 
           RowBox[{"{", 
            RowBox[{"\"\<Maximum iterations\>\"", ",", 
             RowBox[{"Control", "@", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"bail", ",", "64", ",", "\"\<\>\""}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{
                 "64", ",", "128", ",", "256", ",", "512", ",", "1024"}], 
                 "}"}]}], "}"}]}]}], "}"}]}], ",", "\[IndentingNewLine]", 
          RowBox[{"Column", "@", 
           RowBox[{"{", 
            RowBox[{"\"\<Resolution\>\"", ",", 
             RowBox[{"Control", "@", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"res", ",", "2", ",", "\"\<\>\""}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"1", ",", "2", ",", "4", ",", "8"}], "}"}]}], 
               "}"}]}]}], "}"}]}], ",", "\[IndentingNewLine]", 
          RowBox[{"Button", "[", 
           RowBox[{"\"\<RESET\>\"", ",", 
            RowBox[{
             RowBox[{"p1", "=", 
              RowBox[{"{", 
               RowBox[{"0.0", ",", "0.0"}], "}"}]}], ";", " ", 
             RowBox[{"p2", " ", "=", " ", 
              RowBox[{"{", 
               RowBox[{"0.0", ",", "0.0"}], "}"}]}], ";", " ", 
             RowBox[{"r1", " ", "=", " ", "2.0"}], ";", " ", 
             RowBox[{"r2", " ", "=", " ", "2.0"}], ";", " ", 
             RowBox[{"c", " ", "=", " ", "p1"}], ";", " ", 
             RowBox[{"z", " ", "=", " ", "p2"}], ";", 
             RowBox[{"res", "=", "2"}], ";", 
             RowBox[{"bail", "=", "64"}], ";", 
             RowBox[{"oldbail1", "=", "65"}], ";", 
             RowBox[{"oldbail2", "=", "65"}], ";"}]}], "]"}]}], 
         "\[IndentingNewLine]", "}"}], "]"}], ",", "\[IndentingNewLine]", 
       RowBox[{"Row", "[", 
        RowBox[{
         RowBox[{"{", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Column", "[", 
            RowBox[{"{", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"Button", "[", 
               RowBox[{"\"\<Update left\>\"", ",", 
                RowBox[{
                 RowBox[{"c", "=", "p1"}], ";", "\[IndentingNewLine]", 
                 RowBox[{"imagine", "[", 
                  RowBox[{
                   RowBox[{"Unevaluated", "@", "image1"}], ",", "p1", ",", 
                   "p2", ",", "r1", ",", "res", ",", "bail", ",", "1"}], 
                  "]"}]}], ",", 
                RowBox[{"Method", "\[Rule]", "\"\<Queued\>\""}]}], "]"}], ",",
               "\[IndentingNewLine]", 
              RowBox[{"Button", "[", 
               RowBox[{
                RowBox[{"\"\<Zoom in left\>\"", "1"}], ",", 
                RowBox[{
                 RowBox[{"c", "=", "p1"}], ";", 
                 RowBox[{"r1", "=", 
                  RowBox[{"0.5", "r1"}]}], ";", "\[IndentingNewLine]", 
                 RowBox[{"imagine", "[", 
                  RowBox[{
                   RowBox[{"Unevaluated", "@", "image1"}], ",", "p1", ",", 
                   "p2", ",", "r1", ",", "res", ",", "bail", ",", "1"}], 
                  "]"}]}], ",", 
                RowBox[{"Method", "\[Rule]", "\"\<Queued\>\""}]}], "]"}], ",",
               "\[IndentingNewLine]", 
              RowBox[{"Button", "[", 
               RowBox[{"\"\<Zoom out left\>\"", ",", 
                RowBox[{
                 RowBox[{"c", "=", "p1"}], ";", 
                 RowBox[{"r1", "=", 
                  RowBox[{"2.0", "r1"}]}], ";", "\[IndentingNewLine]", 
                 RowBox[{"imagine", "[", 
                  RowBox[{
                   RowBox[{"Unevaluated", "@", "image1"}], ",", "p1", ",", 
                   "p2", ",", "r1", ",", "res", ",", "bail", ",", "1"}], 
                  "]"}]}], ",", 
                RowBox[{"Method", "\[Rule]", "\"\<Queued\>\""}]}], "]"}], ",",
               "\[IndentingNewLine]", 
              RowBox[{"Row", "[", 
               RowBox[{"{", 
                RowBox[{"\"\<Show axes and arrows\\t\>\"", ",", " ", 
                 RowBox[{"Checkbox", "[", 
                  RowBox[{"Dynamic", "[", "show1", "]"}], "]"}]}], "}"}], 
               "]"}]}], "\[IndentingNewLine]", "}"}], "]"}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"Column", "[", 
            RowBox[{"{", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"Row", "[", 
               RowBox[{"{", 
                RowBox[{"\"\<A = \>\"", ",", 
                 RowBox[{"Pane", "[", 
                  RowBox[{
                   RowBox[{"Dynamic", "[", 
                    RowBox[{
                    "p1", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], ",", "60"}], "]"}]}], 
                "}"}], "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"Row", "[", 
               RowBox[{"{", 
                RowBox[{"\"\<B = \>\"", ",", " ", 
                 RowBox[{"Pane", "[", 
                  RowBox[{
                   RowBox[{"Dynamic", "[", 
                    RowBox[{
                    "p1", "\[LeftDoubleBracket]", "2", 
                    "\[RightDoubleBracket]"}], "]"}], ",", "60"}], "]"}]}], 
                "}"}], "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"Row", "[", 
               RowBox[{"{", 
                RowBox[{"\"\<Zoom = \>\"", ",", 
                 RowBox[{"Pane", "[", 
                  RowBox[{
                   RowBox[{"Dynamic", "[", 
                    RowBox[{"ScientificForm", "[", 
                    RowBox[{
                    RowBox[{"2", "/", "r1"}], ",", "2"}], "]"}], "]"}], ",", 
                   "50"}], "]"}]}], "}"}], "]"}]}], "\[IndentingNewLine]", 
             "}"}], "]"}]}], "\[IndentingNewLine]", "}"}], ",", "\"\< \>\""}],
         "]"}], ",", "\[IndentingNewLine]", 
       RowBox[{"Row", "[", 
        RowBox[{
         RowBox[{"{", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{"Column", "[", 
            RowBox[{"{", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"Button", "[", 
               RowBox[{"\"\<Update right\>\"", ",", 
                RowBox[{
                 RowBox[{"z", "=", "p2"}], ";", "\[IndentingNewLine]", 
                 RowBox[{"imagine", "[", 
                  RowBox[{
                   RowBox[{"Unevaluated", "@", "image2"}], ",", "p2", ",", 
                   "p1", ",", "r2", ",", "res", ",", "bail", ",", "2"}], 
                  "]"}]}], ",", 
                RowBox[{"Method", "\[Rule]", "\"\<Queued\>\""}]}], "]"}], ",",
               "\[IndentingNewLine]", 
              RowBox[{"Button", "[", 
               RowBox[{"\"\<Zoom in right\>\"", ",", 
                RowBox[{
                 RowBox[{"z", "=", "p2"}], ";", 
                 RowBox[{"r2", "=", 
                  RowBox[{"0.5", "r2"}]}], ";", "\[IndentingNewLine]", 
                 RowBox[{"imagine", "[", 
                  RowBox[{
                   RowBox[{"Unevaluated", "@", "image2"}], ",", "p2", ",", 
                   "p1", ",", "r2", ",", "res", ",", "bail", ",", "2"}], 
                  "]"}]}], ",", 
                RowBox[{"Method", "\[Rule]", "\"\<Queued\>\""}]}], "]"}], ",",
               "\[IndentingNewLine]", 
              RowBox[{"Button", "[", 
               RowBox[{"\"\<Zoom out right\>\"", ",", 
                RowBox[{
                 RowBox[{"z", "=", "p2"}], ";", 
                 RowBox[{"r2", "=", 
                  RowBox[{"2.0", "r2"}]}], ";", "\[IndentingNewLine]", 
                 RowBox[{"imagine", "[", 
                  RowBox[{
                   RowBox[{"Unevaluated", "@", "image2"}], ",", "p2", ",", 
                   "p1", ",", "r2", ",", "res", ",", "bail", ",", "2"}], 
                  "]"}]}], ",", 
                RowBox[{"Method", "\[Rule]", "\"\<Queued\>\""}]}], "]"}], ",",
               "\[IndentingNewLine]", 
              RowBox[{"Row", "[", 
               RowBox[{"{", 
                RowBox[{"\"\<Show axes and arrows\\t\>\"", ",", " ", 
                 RowBox[{"Checkbox", "[", 
                  RowBox[{"Dynamic", "[", "show2", "]"}], "]"}]}], "}"}], 
               "]"}]}], "\[IndentingNewLine]", "}"}], "]"}], ",", 
           "\[IndentingNewLine]", 
           RowBox[{"Column", "[", 
            RowBox[{"{", "\[IndentingNewLine]", 
             RowBox[{
              RowBox[{"Row", "[", 
               RowBox[{"{", 
                RowBox[{"\"\<X = \>\"", ",", 
                 RowBox[{"Pane", "[", 
                  RowBox[{
                   RowBox[{"Dynamic", "[", 
                    RowBox[{
                    "p2", "\[LeftDoubleBracket]", "1", 
                    "\[RightDoubleBracket]"}], "]"}], ",", "60"}], "]"}]}], 
                "}"}], "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"Row", "[", 
               RowBox[{"{", 
                RowBox[{"\"\<Y = \>\"", ",", " ", 
                 RowBox[{"Pane", "[", 
                  RowBox[{
                   RowBox[{"Dynamic", "[", 
                    RowBox[{
                    "p2", "\[LeftDoubleBracket]", "2", 
                    "\[RightDoubleBracket]"}], "]"}], ",", "60"}], "]"}]}], 
                "}"}], "]"}], ",", "\[IndentingNewLine]", 
              RowBox[{"Row", "[", 
               RowBox[{"{", 
                RowBox[{"\"\<Zoom = \>\"", ",", 
                 RowBox[{"Pane", "[", 
                  RowBox[{
                   RowBox[{"NumberForm", "[", 
                    RowBox[{
                    RowBox[{"Dynamic", "[", 
                    RowBox[{"2", "/", "r2"}], "]"}], ",", "4"}], "]"}], ",", 
                   "50"}], "]"}]}], "}"}], "]"}]}], "\[IndentingNewLine]", 
             "}"}], "]"}]}], "\[IndentingNewLine]", "}"}], ",", "\"\< \>\""}],
         "]"}]}], "\[IndentingNewLine]", "}"}], ",", " ", "\"\<   \>\""}], 
    "]"}], ",", "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"res", ",", " ", "2"}], "}"}], ",", " ", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"bail", ",", " ", "64"}], "}"}], ",", " ", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"p1", ",", 
       RowBox[{"{", 
        RowBox[{"0.", ",", "0."}], "}"}]}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", " ", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"p2", ",", 
       RowBox[{"{", 
        RowBox[{"0.", ",", "0."}], "}"}]}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", " ", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"zoom1", ",", "0"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", " ", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"zoom2", ",", "0"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", " ", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"show1", ",", "True"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", " ", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"show2", ",", "True"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", " ", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"oldbail1", ",", "64"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", " ", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"oldbail2", ",", "64"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", " ", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"oldres1", ",", "0"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"oldres2", ",", "0"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{"image1", ",", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{"image2", ",", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"c", ",", 
       RowBox[{"{", 
        RowBox[{"0.", ",", "0."}], "}"}]}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"z", ",", 
       RowBox[{"{", 
        RowBox[{"0.", ",", "0."}], "}"}]}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"r1", ",", "2.0"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"r2", ",", "2.0"}], "}"}], ",", 
     RowBox[{"ControlType", "\[Rule]", "None"}]}], "}"}], ",", 
   "\[IndentingNewLine]", 
   RowBox[{"SaveDefinitions", "\[Rule]", "True"}]}], "\[IndentingNewLine]", 
  "]"}]}], "Input",
 CellChangeTimes->{{3.6154939829468665`*^9, 3.6154939833843985`*^9}}],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`bail$$ = 64, $CellContext`c$$ = {0., 
    0.}, $CellContext`image1$$ = Image[CompressedData["
1:eJzt3cGqNFu6LuQt3oDYEGtTIF7DBkHh+F+BnXMDgmBb215BNW0IarGODVte
glUXoFDYEvdWqqOwQTkHjja1KTXHql0//9xfrvxyjpHjHRHPC8WqeNZcOXNm
REaMGG9G5L/9H/0n//Q//lf/6q/+6j/4V8b//vT///WP/Lff/rWP/Kff/qv/
8k/5H79xzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeec
c84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeec
c84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzu/jY/k//4d/
/tOP/M+c38LT3o+cc84555xzzjnnnHPOOeecJ/tYzun7OOe88rT9J+ecc845
55xzzjnnnHPOOX/sYzmnb+Kcc/4eTzsecc4555xzzjnnnHPOOeecj+WcPoVz
zjlf4WnHX84555xzzjnnnHPOOeecP+9jOad34JxzzrlennPOOeecc84555xz
zjn/3sdyzrw955xzzq/naeMfzjnnnHPOOeecc84552f5WM6Z9+acc845T/O0
8RvnnHPOOeecc84555zfzcdyzrwx55xzzjmf62njT84555xzzjnnnHPOOZ/l
YzlnPpZzzjnnnF/b08bDnHPOOeecc84555zzc30s58x/cs4555xz/k5PG59z
zjnnnHPOOeecc86f97GcM9/IOeecc875nT3tfIFzzjnnnHPOOeec8xN9LOfM
+3HOOeecc8717JxzzjnnnHPOOeecP+NjOWf+jXPOOeecc34fTzs/4pxzzjnn
nHPOOefX8LGcMw/GOeecc84557M87fyLc84555xzzjnnnM/1sZwzH8U555xz
zjnnV/W080HOOeecc84555zzq/pYzpkX4pxzzjnnnHP+mqedb3LOOeecc845
55zv8rGcM2/DOeecc8455zzT085nOeecc84555xzzisfyznzKpxzzjnnnHPO
7+lp58ucc84555xzzjk/18dyzrwH55xzzjnnnHO+wtPOxznnnHPOOeecc77O
x3LOvATnnHPOOeecc36ip53vc84555xzzjnnd/axnDNvwDnnnHPOOeec88+e
Np/AOeecc84555wn+1jOOa/nnHPOOeecc875+z1tvoJzzjnnnHPOOf+Kj+Wc
827OOeecc84555xfz9PmQzjnnHPOOeecX9vHcs55Meecc84555xzznnX0+Zb
OOecc84555xn+ljOOZ/lnHPOOeecc845X+1p8zOcc84555xzzuf6WM45D+Wc
c84555xzzjk/3dPmfzjnnHPOOef8bj6Wc84TOeecc84555xzzvljT5tf4pxz
zjnnnPNTfCznnN9xzjnnnHPOOeec87meNh/FOeecc84556t9LOecl3HOOeec
c84555zzszxtvotzzjnnnHPOKx/LOedTnHPOOeecc8455/zanjY/xjnnnHPO
Ob+ej+Wc8yDOOeecc84555xzzr/iafNvnHPOOeec8xwfyznnL5xzzjnnnHPO
Oeecv9PT5us455xzzjnnenDOOeecc84555xzzpM9bT6Qc84555zzO/tYzjlf
4JxzzjnnnHPOOef8zp42f8g555xzzvmVfCznjP8555xzzjnnnHPOOefPe9p8
I+ecc8455wk+lnPG7ZxzzjnnnHPOOeec8xxPm8/knHPOOedcP84555xzzjnn
nHPOOU/wtPlPzjnnnHPO9eOcc84555xzzjnnnPMET5sv5Zxzzjnn1/CxnDPu
5ZxzzjnnnHPOOeec81meNh/LOeecc873+ljOGa9yzjnnnHPOOeecc875Lk+b
v+Wcc84553N9LOeMPznnnHPOOeecc8455/wUT5vv5Zxzzjnnj30s54wnOeec
c84555xzzjnn/KqeNj/MOeecc343H8s540POOeecc84555xzzjnnw9Pmkznn
nHPOT/GxnDOu45xzzjnnnHPOOeecc/4eT5uv5pxzzjlf7WM5ZzzGOeecc845
55xzzjnnPNPT5rc555xzzrs+lnPGV5xzzjnnnHPOOeecc86v4Wnz4Zxzzjnn
YzlnvMQ555xzzjk/1/9KZEHStnPOOeecr/O0+XPOOeecX8/Hcs74h3POOeec
c/51391nilw5ae93zjnn/M6eNt/OOeec83wfyznjGc4555xzzu/su3s/EclN
2v6Kc845P9HT5uc555xzrh/nnHPOOef8RN/dm4mIfDVp+1XOOec8wdPm8znn
nHOuH+ecc84553yF7+6pRESulrT9POecc77C0+b/Oeecc64355xzzjnn9/Td
vZCIiKxN2nGHc845f8bTegHOOeec680555xzznmm7+5hRETkmkk73nHOOeff
e1pfwDnnnN/Zx3LOOIFzzjnnnJ/lu/sQERGRmUk7znLOOb+np/UInHPO+R18
LOeMBzjnnHPO+V7f3VeIiIiclLTjOOec82t7Wr/AOeecX8nHcs5xn3POOeec
z/XdfYKIiIj8JWnjBM4559fwtN6Bc845P9HHcs7xnXPOOeecP/bd8/0iIiLy
vqSNQzjnnJ/laX0E55xznuxjOec4zjnnnHN+Vd897y4iIiLXT9r4h3POeaan
9RScc855go/lnOM155xzzvkpvnteXEREROTZpI2jOOec7/W0noJzzjlP8LGc
c7zmnHPOOd/lu+ezRURERFKSNk7jnHP+Hk/rLzjnnHO9Oeecc875Ot89Dy0i
8mz+zY/8d9/+jY/8Dz/vz/6Pb/w1370+Ra6QtHEd55zz93har8E555zrzTnn
nHPOP/vu+WMRkR+T1hfzub57+xI5KWnjRs4553M9re/gnHPO9eacc845v5Lv
nt8VkfsmrZ/l1/Dd27VIYmaNGznnnGd6Wg/COeec680555xznuC752VF5L5J
608517OLPE41nuScc34NT+tHOOecc70555xzzr/iu+dTRUR+TFrvmen//bf/
4iP/y7d/5yP/54ue9nfdx3e/z0R2pjte5Zxznulp/QjnnHOuN+ecc875M757
flRE7pu0vjLTZ/Xguzzt9bye734fi+xMd9zLOed8r6f1Jpxzzu/pYznn+Mg5
55zzdb57/lJE7pu0PjHTv95H//SR/+nbf/iR//3bv/eRf9H2Wc9nrqetr3N9
9/5AZGdmjas555y/x9P6FM4559f2sZxzHOScc87587573lFE5Mek9YOZ/vUe
uXr9/7OP/Itv/80/+1P+5bd/6yP/z7fffuSP3/76I3/4+XF/Uz7OrP49s5dP
2x7yfc3eQiQrs8bnnHPO3+NpPQvnnPNr+FjOOd5xzjnn/LPvnkcUEfkxab1e
pq+7frxaL//+R/7vb//kI//y2//3//4p/1e7Z+969fhn9el69q5/dT8ickJW
j/M555y/5mk9C+ec82v4WM453nHOOed38N3zfyIiPyatj7uGv/++69X6rfr0
v/nI33/7u7/9yD/893/uw//dj/zzb//b//qRaX39Nfp0PXvlr++JRM7JrPMC
zjnncz2tf+Gcc36Wj+Wc4xrnnHN+Jd89nyci8mPS+rVr+LoedlZvXl0nXvXd
v/2v/5R//g9/5y9tV6uvQ79Gn65nf3W/JXJSZp1HcM45n+tpvQznnPNMH8s5
xy/OOec82XfPw4mI/Ji0Xuza/v5edVZvXqXbd1ep+nd9uj5dzy4yMut8hHPO
+VxP62s455zv9bGcc5zinHPO3+m7589ERJ5NWp91T79eb969v3p1HXp1X/fu
41eZ1adfu5dPe7/o00WeSff8hXPO+VxP62s455zv9bGcc5zinHPOV/ju+TAR
kWeT1k/d03P60LTevEr1Pem/+sjvvv36Iz99++uP/L59HXqVtD49s39Pe3/p
00WeyazzIM455695Wo/DOef8PT6Wc45HnHPO+TO+ex5LROTZpPVK/Bm/T29e
9dezrh//7Uf++HNf/oef/87flI8zq0/vZtfnE/Tp7/EV24zIrnTPmzjnnM/1
tH6Hc875XB/LOccdzjnn/HvfPS8lIvJs0noi/oyf24+v7s2r68Sr43X1OleP
073f+64+vfu6Vf14d5yjT3+Pv3ObEVmdaj/DOed8rqf1O5xzzuf6WM457nDO
Ob+2755PEhH5atJ6H/6M5/Tjlaf15lV/XT1O1YNX15tX3r3OvXr+q33W/e2r
x997v/e092+Od9evSEL+fD7253/uPh/knPOrelrvwznn/DUfyznHF84559fw
3fNDIiLPJq2X4V/xnB688tXfl93d/ru9cOVV31316eV16JP69O7znLU/mbVe
fE/6WT5r+xFZkbGd5pwncs753TytD+Kcc/7Yx3LOcYRzznmm757vERH5atJ6
Fr7Cc/rxyk/pzbt9erc37/bp1fOvfm+3H6/+3mo9VuOl7ve5V88nszfXp3e9
+34UeWeq/RjnnPO5ntYHcc45f+xjOec4wjnnfK/vnr8REXk2af0If6fn9OCV
r+7HT+/Nuynv9148fve8uPq9f/ORv//2d3/7kV+8//ys72fXm1/bX30fiLwj
YzvNOT/lnPOrelpPxDnnfPhYzjlecM45n+u7511ERL6atL6Dv9NzevDKT+nH
q8zqzVffv716/tXPd1+3qh+f9X3r3fUyazvZ+35J25+c693tR2RFxvaYc57L
OedX9bT+iHPO7+ZjOee4wDnn/DXfPY8iIvJs0voInuA5PXjX9eZzv0+86q+r
frw6zy2vEy/6+lnfn64316fr0+VuGdtjznkx55yf7mn9Eeec383Hcs5xgXPO
+fDd8x8iIl9NWr/A3+lpPZ1+vNuPz7pPe/t7z4v7n1fjpeo8t+rNq8y6rjyt
N8/s09P2V9fz7vYm8pVU+2fOOedzPa1X4pzzq/pYztn/c8753Xz3PIeIyLNJ
6wV4guf02rNcP773uvJqe6v69Orxuz+f1ptXuUZvrk/f5bO2Q5FnMra7nPNu
zjk/3dN6Jc45v6qP5Zz9P+ecX9V3z1uIiDybtHl+nuBp/Zp+PK0fr843y/ul
F71293GqcVf1+NV17lV2fb95lWtfh65P3+Wztk+RZ1LttznnnL/maX0T55yf
7mM5Zz/POeen+O75BhGRZ5M2P88TPK0X049X2dWPV89n1vePz3p9qu28+vnu
dehVXIee4Gn71fv4rO1W5PuM7SvnfJ9zzk/xtL6Jc85P97Gcs5/nnPM03z1/
ICLyY9Lmz3myp/Vc1+vNu+/fWd8b3u3Bu49fXZddnVdWr0/3/u3V9lz9fPc6
9O76qtJ9nfXpevM7+KztVu6Zar/NOef8NU/roTjn/BQfyzn7c845X+275wNE
RH5M2rw3T/a03irHT+nHV/ekVU/d7a+r3rx7f/Vqfc36e1en6uVnfZ5h1v0E
qud/7d5cn36Kv+fdKlfN2I5y5hM45/x0T+unOOc8zcdyzn6bc85n+e7zexGR
H5M2j80TPK1vyvdT+vHu9d2P9xvP94Pd7++ufr7qi6tUP1+dhz7z2n4l7ddh
8fehz/Lq+ejT9ekn+vPvaJHPGdtRzvwD55yf4mn9FOecp/lYztlvc8555bvP
y0VEfkza/DNP9rT+KN/T+vHu94BXqZ5P9zyuevyqv+724NV66T6fXameZ7cH
775u3VTbQ/f3rt4+r92n69nT/LV3k9wtY3vJma/gnPPTPa234pzzXT6Wc/bP
nHO++/xbRO6btHljnuxp/c65vrof7/bm1XW73fOpWedfVR9a/Xx3v1c9z+51
zbP+rlf33z+mul67+/yrx6967e71+937FVSPrzfXp9/Bu9uz3DPd4xHnnPPh
ab0V55zv8rGcs3/mnF/Pd583i8h9kzbfy5M9rZc513f14Lvuu149zqzrvqv7
h8/d7537/eOzUvXs3e2qWl+/+sjvvv36Iz/9/O9/375vf5Xu96dXj7P6/Zi2
v5rrace1+3j3/SLXztgucuZDOOf8dE/rszjnfLWP5Zz9MOf8XN99fiwi10/a
PC1P9rQ+5Xqe1o+v7s1n9enV9cJV39rdzrt/b3We2H2cq6Zav4974c/rqxo/
V9tV9ThV/z7re8+r6NP17Cf63L2BnJ5qP8w55/yxp/VZnHO+2sdyzn6Yc57j
u89rReT6SZtf5Sd6Wg9yPU/rwWf141Vm9ebd64ir3tz47Rqp7jNQ3o+92B66
5/un9Ob6dD27Pl12pXuc5ZxzPjyt5+Kc81k+lnP2t5xz/biInJu0eVF+oqf1
FNfztL57Vz9eZVdvXvWq1fXFq18HmZtqHF7tD6vrx6vMuk97N/r0ZE87vuf7
rPeFnJVq/8w55/yxp/VcnHM+y8dyzv6Wc64HF5GcpM1n8it5Wr9wrqf12nrz
x715937s1Xlc93vSZW+615VXvXm1Xd2tN9en69n16bI6Y/3nzPNwzvkpntZ/
cc5518dyzn6Vc64fF5F1SZuH5FfytPn/fE/rm9J89f6w24+v7s2rx6ned6v7
UHktVd/dHc+v7s316ZnHhbM8bRyiT5e5qfbbnHPOH3ta/8U5510fyzn7Vc7v
7LvPC0XkvKTNH/I7eNq8vb77FN+1n1zdj5fXEU+6z3b3cSQz1X511vslrTev
krZfSju+XNvTxjP6dHktYz3nzCNxzvkpntaLcc555WM5Z//J+R1893meiOQm
bd6P38HT5tX13af47v3lj5nVj0+7rrzZd1ffY643v0aq91G1vVXnEauvN9en
69lzPG28pE+XkWr/zDnn/LGn9WKcc175WM7Zf3J+ou8+bxOR3KTN1/E7e9p8
uB78qv316uzqx7u9efX8qx68un/7e15VWZ3qPKL6vET1/fXd3vyU69CrpO1v
9e8Jnja+0qfLSLWf55xzPjytF+Oc88rHcs7+k/Nk330eJiL7kzbPxvmV+vG0
XkNP/Z6s7sFn9eNpvXl1fjd7/UgvVd9dbYfd9b6rN9ez8/zPCaSNx/Tmd8tY
nznzV5xzfoqn9WWccz6Wc/aTnL/Td59Xicj7kjY/xvkdevDKr9pfX7WH6ub0
Hrzbj8/qzatU49iqn61+ftb6lcep9nvVeq/WY5XudpjWp6ft99L65VN81uv5
nnFI2rhOn363VMdlzjnnw9P6Ms45H8s5+0nOV/ju8yQRmZ+0eS3O9eNf78e7
+4G0fqfqobq92Cl91il9965+vMqs/rR7ftd9nvKedNd7ldV9+i7Xs+/twavM
+l4Jffpr3n2dZW+q4zLnnPPHntajcc7v42M5Z3/I+TO++7xHROYnbT6Kc/34
+68f7/Yg3Xn71f3Oa/u9z69n9X3Hp/Tps/roWT31rt9b3o99cW/efZ7yWqrt
vFov1f6qWu/d+xJUmbX9r/5cSrU/6f78rj69m7QevEp3vVTPp3vc1Kc/9lnr
V/ZmrM+ceTbOOU/ztB6Nc34fH8s5+0POv/fd5zEi8nrS5pc414Pn9OPVfqPb
d1TrZdZ1cNXrMKv3rJ5/9fOr+6zVvVj1d42/+/l5kmq7mnXdbnf9zvLV329e
fR7j1ddJ/vF0X+dZfXrl1XbS7eVnfc6k+r3V61a9Dt394Sl9+q50P4dQvf7V
+qqOd9Xj773fe9o4U59+1VTjH84558PTejTO+X18LOfsD/m1ffd5iYi8nrR5
Ic714/fpzav5+ap/GcvPj0O6vdWs/rHbk+66PnRWP169ntV6r85fuq9Pt7+u
Ur0vutdRVo/T7T2r7bzaj1Xvx+56vFse93SfX+dqvVTrsdqfVD/f3W90t/Pu
z3e32+pxqtdzVr9/yn3gV2fW/UOqx6+2/2o9ug59rs/eXmRPqvcR55zz4Wn9
Guf8ej6Wc/Z7/Bq++zxDRF5P2vwP5/rxc/vxWb15t7ftXs9YjZO7+8/q+Ve/
t+q/uteTVun27LOuJ931eYPqfd19/PL3Nl//1c9nVvTmj1Otx7Tr98fzWne+
tvrzJ93n0+21T/mei1O+X6PaD3ffF9316Dr017z7/pK96e7POef8bp7Wr3HO
r+djOWe/xzN993mDiLyetHkbzvXgOb66H5/Vm8+6Dr27n6x+vnsf2mocXj1+
93rS6vWZ9f3I3XR7tNXfz1tlvC7GvXJWZn0fevfzJ1UfWr2Pdr2/qv1tdbzo
3mdjdU+d9v0a3c+hre7Nq7gO/bG/+n6SrHT3t5xzfjdP69045+f6WM7Zv/G9
vvs8QER+OWnzMJzneE4ffYrv6serzOoXur1zd769epxun149//HvP4/Tus+n
+r2zrnMvvXkdYvc+vd08Xi+fX8/qvGnW8xFJTtWfVt7dL3XTvU9I93M7s/r0
Wd9n0U13fXW9+r3l5zeax5fV9893Hfpjn7UdyntSjQ8555wPT+vdOOfn+ljO
2b/xub57XC8iv5y0+RPOczynXz7d064rr9K9rrzqU7rz5N3rKFf3vLOuE6/e
X9XPd+/D3O3Hq/ORV/8+EXlfqv3q6vtaVPv/av88qzdf3TtX+8nu31s9/qz1
Muv+Ld37JJTXvxfHnWr8oDd/7K9uF7In1X6Ac8758LTejXN+ro/lnP0bf813
j99F5C9Jmw/hPN9z+uXTfVc/vut68+pxqnn4bv87/vtzx12P78P8/PWh3fvu
drfPan11n6eI3CfV/Eb189V+bHXv370vR3Xcqf7e8ns6quu+C+8eH7uvQ3d9
de8brzef6931K3tT7Tc455wPT+vjOOf5PpZz9mP8se8ej4vIX5I2v8F5juf0
yFf10/vxKrPu0149fre/qMbP1eN3r3PclaqP6J4vVNtn9Xu7Py8i0r2Ou9qP
VceLajwz63srqlT71e73iVfPv3r86vlU++fu/r97XK6Om9V6n3Wfdn36Y/+l
7VeyUr1POeecD0/r4zjn+T6Wc/Zjd/Pd42sR+UvS5is4z/Gcvpjv7c1X74e7
32fa/T7Zbh+x63VYne77fffzFRH5Md37YFQp74PRvC67SrdHXv09IFW6fXQ1
v1QdXx5/buHzcUdvvtfXbGXy7oz1mTP/yTnnuzytj+Oc5/tYztmPXdV3j5dF
7pi0+QfOczyn/+WZ/fiu68rTevPqfbSr15iVWX2TiMjpmbU/r+ZbVjznd+bx
92g837dWnzdYfTzVm8/1WetF3pOx3nLmRTnnPM3TejrOeY6P5Zz91em+e1ws
csekzSdwru/mXb9qP15lVj/e7c2r8XD3/bj69RERkb3pzp9c9XhR/b3Vz8/6
vpLqcc663vx6ffqr61P2pHr/cs45H57W03HOc3ws5+yvTvHd41+RKydtfoBz
vTbveloPfko/vro37z5/40AREfk+1XGn2+eeku74obo+vTouz3o9M/txvblk
phrfcs753Tytp+Oc5/hYztlf7fLd41aROyZtHoCf6Dk9Kb+np/Xg+vExD9/t
zavr2qrvt63Gk+5/LiJyz1THi93P66upjtfV8a57vXl3nFA9zqzx0nvGk2nn
U/r0u6Uax3LOOR+e1t9xzvXmq333+FTkykk7f+fPeE7/yHmCp/Xd+vG5/Xh1
HVy3N+/24935/1n3uRUREUnOrOv09eZ7fcW2IevSnUflnPO7eVp/xznXm8/y
3eNQkSsn7Tz9np7TM3J+oqf13Wm9+awefNb90mel6s27/Xg1rt71d4mIiHwl
1bxK93Nc1fhk9f3tz+rNr9env7bVSVq6866cc35VT+vvOOd6867vHleKXCFp
593X9pzekPMTPa2n1o8/7sernrqbsu9uXj8uIiIiX0/1ebPV32NeRW+e6Su2
PVmX7nws55xf1dP6O8653rzy3eNHkSsk7Tz62p7TM3Ke4Gm98yk+a//f7cFn
/d5uqvFqNT/fvb96tX1W48/q9ame567XTURErp3quNP93pDu8av6fNqsflxv
/r2nnc/qze+WajzMOed8eFqvxzm/T2++e5woclLSzouv7Tn9I+f67uv5rONC
d166ez14NT9f/V3d51OND6sevBrfdnuEtM8PiIiIfCXd+ZbufVqu2pvv7dPT
zn/15jJS7U845/xuntbrcc6v15vvHveJnJS0899r+316yV1/L9dH38F3HS+6
89LVvHd3/rzazqufn3X/9mp8W+3nX/09IiIiV0g1P1Pev6V5vK5689X3aa9y
jfOmtPNlvfndUu03OOf8bp7W63HOz+3Nd4/vRE5K2nnutT2nD+1uJ2n9IOd3
9hXHgmey+nvJq99bXfdd+Ttfk+9T7Z93PR8REZHkVPdpqfr0ytOuQ68yaxy4
+rwy8zxab363rJ435pzz0z2t7+Oc5/Tmu8dxIicl7Xz22p5zHXG1PVTXcZwy
X8T5HXzW+25WdvXm1XiyevxTXk8REZE7pzvPUx33q/OaWb152vmR3vw1n7W+
ZG+q/QbnnN/N0/o+zvn7e/Pd4zKRxKSdh97Tc/rxbk/U7a2u+r2BnN+5B68y
az55Vm/evX97FeNMERGR/FTjhFnnO6v79F3nQe85P007H9eb3y3d+WTOOb+q
p/V9nPN1vfnu8ZdIYtLON+/p534/dbVddb93uHqc7vcPpl2vcbrPet3S4nXe
m7TevNrPzOrTRURE5Nx079/e7dO7PXv189XzrH6++nv15q/56u1Q3pNqPplz
zu/maX0f5/zrvnucJZKYtPNK/r3fpzfvzttU3y9czUet7s1n5ap9a9p9KWVv
Vvfjq3vzav9TfV9q9fjd/Z6IiIisS3VcruaXZn2OblbPXv189/PGVfZeh552
nq43v1vG+szprTjnfJen9X2cc725yFeSdv7Iv/dz+/HVvXn3Oo7q93av15j9
/rtaVvfd1tdZWX1/0eX9+KQevBp/Pt4Pm18VERE5MdX4oTp/qcYDs/r3qh+v
fm93PKY3f82/up1JdsZ6zumzOOd8l6f1gJxzvbnI90k7T+Tfe04/Xnlabz7r
+ohTvk8wLbP6zerxq+N19/Gtr7lZ/b6YtV11+/FqXvrxPPPn/Xm13ZovFRER
uV6q8Uk1Hqj69GqcMP75ef6528uXz2fS91vpzV/ztVun7E71/uWc87t5Wg/I
Odeby7WTdt7Hv+I5/Xjlq+8H3u1Vq3mh8bp+HqdVj1P1a7O+T/Bu3r0/QPe4
XM3vWV/X9u76rbaT7vztrP2V+66LiIjIKfnz+Our32+lN3/s71yn8v5U8xKc
c343T+sBOed6c7lG0s7v+Fc8pwevfNd15dX8THkdaHGdRbWf797XvfJuf7fL
d/WV3fVYpfvzs9ZXWl98N19933XzliIiInJ6qnFU97ys+vlZn/d7T2+uT5fM
jPWZ01txzvkuT+sBOed6czkraedr/Cue04N3fXVvXqXbo3Uff9b3A3Z79q5X
z7PyXb18t6+sjr9j+fO4uvpcRPd+krP69NM//3BKD756O6y2q1n7MREREZFd
+dVHfvft1x/56efxzu/LcVr189Xjd/t6vflr/s5tRt6f6vyXc87v5mn9IOdc
by57k3Zexr/iOX1312f142m9eXf+oXs9e7d/r3reysfy5/HkrOuvV3v5OhSv
Z/Xz3e2ten2628Pq16H7e9P697TPaXRf/1mfnxERERHZleo8oprvqn6++3nd
KnrzuT5/i5GkVOf7nHN+N0/rBznnenN5T9LOv/gKz+nBu35Kb155ty+rrqfo
zldUr2f1PLvHnfFzz48zu738rOu1q5/vzst177ffvS6met1m9afd+wB03y+r
+/Q0n/Y5jWr7L7a3ajupHr/78yIiIiJp6X7esnocvflcf+c2IO9P93yfc86v
6mn9IOdcby5zk3aexVd4Tt/d9dX9+Or7G3eve93V81aPXz2f7vrqHr+q31v+
XZP69+7rWaX6e7vzeFWq/n3WdTfjef8jn3OYtP10/fR+fNZ15dV66T6+iIiI
SDfd+011H787Dlzdj+vNX/NXty85I9X7nXPO7+Zp/SDnXG8uryXtfIqv8Jy+
u+u7+vG03nx1n9793sDufEj18+OfjevQm/3srL541v3Yf+n3/JhqvVfvl+7j
z7pOudpOZl3/PquPTvNyvTTvnyAiIiKSlu7nOavM+r6e6vH15u/xuVuXpKV7
Xs8551f1tH6Qc643l5G08yP+Ts/pu2f5VfvxWd+/vPo61irVcWcsP9+3dv+u
6vGr7af6vd3723ePv6u3q266z3/W61yle3+A0/v37vPsfr+ncaCIiIikpRrn
Vz9fjaPSevO958tp8w96c3mc6rySc86v6mn9IOfcfOndknYexN/pOb32LL/b
deWn9+ZpqXrw8b55fnzb3R663/dd/d7Vr8+secvq+Xevj378uYXP+4fquvjT
t9vVnxPorncRERGR1enOX83q06vH15u/x9dsTZKe7vk455xf1dN6Q87v7LvH
RzInaec7fIXn9NerPa0fv2pvXj2f8vu7i16ye3yp1vus17P7e9P661np3je+
2592H391qudfPc/u99SvTvf5VL159XmD8nUIW48iIiJyn1Tj8O74rfs54e64
V2/+Hn/PVidpqc67Oef8bp7WG3J+Z989PpJe0s5r+ArP6a9Xe1oPvuu+2bP6
8Vm9+dgez+2Lu6l6xln305bHqV7/7vVB3fdFt0fu9tqz/PTr5UVERESqPD5/
fP57kbrjqO7nBvXm7/HV25tkppp/4Jzzu3lab8j5nX33+OjuSTtP4Ss8p6fe
5Wk9+N368dX3Y6+OL/o+SUj3fVF59z7w3fnbrouIiIjISPdzmNXPV4+f2Zun
zXvozeW1jPWf01txzvkuT+sNOb+z7x4f3SVp5yP8K57TR6d5Wg9+1X581nXl
VbrXZZT3hW7eR3HW6y/yfar9eff72avH7/bpXe++74z3RERE5G6pzrO6/XgV
vfl7fMW2Ifmpzr845/xuntYbcn5n3z0+OjVp5xf8K57TO5/id+vBq8z6XvJZ
14l3M+u+0NXxpXrfVa/D+PfP95UiCam2//Z94Jv3C63eL7u+n11ERERkV7rj
omt8v3navIreXF5L9f7lnPO7eVpvyPmdfff4KD1p5xH8Gc/pl0/3u/XgVWb1
4935mSqz7gtdvY+q3zv+/edxXfX3dv8ukYRU75fu9Uqzrm+qHqd6P1b781df
DxEREZF3p5q/Kj9/2OzHu+cvevO9/p6tTtJSne9wzvlVPa035PzOvnsc9O6k
jf/5M57TI5/uevCRWT34rPuuV8+z+76oHqfq3arr2R9vV+YxRL5P931UvR+7
913v7gdERERETkn3/le7+nG9+Xt87tYlp2Ss/5w+i3POV3tab8j5nX33OOir
SRvP82c8p0e+qp/Sj6/ur3f5rO8l795vefzc8+Ou7nqs3tfd9S5y53Tfp9XP
V/v/3X+fiIiIyLOpxj+zevPu88nsx/Xmr21dcnqq8yDOOb+qp/WGnN/Zd4+D
fkza+Jx/7zm98N389O8Tr/rlaj6k2zt3ry9Y3YN3+/HqdZv1/eOn3AdA5A6p
jrPdx/G+FhERkVNSjX+6nxOuojdPmC/Sm8vcjPWf02dxzvkuT+sTOb+D7xr/
pI3D7+k5vTC/Rj9epXt/vLGdfh4nVD8/q9de3Y/v6s2r17PaDn/p8URkfrrH
i1nzwyIiIiJpqc5Pq3mta9+PXW/+zm1PclLNY3DO+d08rU/k/A4+azyTNq6+
p+f0vzyzB0+773r1OGO7/jxO6PbF3f56tXdfz6o3/+1H/vjz9x//4eft7zfl
9yNX+43u69Z9/iLyOdX7t/r5av/c3R+KiIiIXDV684T5KL25zE01L8Q553fz
tD6R8zt4d9ySNn6+tuf0v/waPfiu68q712V3+6Du/f2mXQ9e9F9l39306nWo
fr47XyQiOane19X+s9u/i4iIiOxK9fneavxTnZfNOt/Rj5/lc7dGOSVj/ef0
VpxzvsvT+kTO7+DV+CRtnHyW5/S8/J49+K5+fNb3g1fzJ+V8y+L+utvLV8+n
6sHLfrx5XbnrxEWul1nf+ykiIiKyK935qOo80XXlCfNdenN5T8b6z+mtOOd8
l6f1iZzfwdPGw3s9p8893dP64qv6rvOX1b159Xur/qjav43lz+ON6vG7/fW8
V7SX6u+q3o/d10FERERERGR1qvOvXdeV680zfe5WJ6ekmsfgnPO7eVqfyPkd
PG08PNdzeuRZntbb8mv04FW6/fis+7RX3r7uu9mzV+ulur67+r3Vfmn88/n+
unqe3ccRkXNzyvFCREREpErVj6ddV643z/T3bKWSlmreg3PO7+ZpfSLnd/C0
8fBjz+mvZ/nqvjWtFz7d33mOsCKzevBZ15W3v0+8ef/26nlW+8Pu48x6/t1U
+5NXH09EREREROSrqc6zZvXjVa7Rj+vNK1+xrUp+xvrP6a0453yXp/WJnN/B
08bDmecpOdeDV+PJ1d9rrKfOzK6+e1c/Xl2nUGX895/HG937w+9K9/mbZxAR
ERERkVmp5j2qn6/O+7rnp93nqTe/tn9tK5ZTU82HcM753TytT+T8Dq4H39uD
d/vi7nWvqz/XLa9l13Xf1Xay2qvXYewnPo8Hqu8T737PeHee55RU+9vq9dz9
fEVEREREJDfV+UU1j7Rr/mH1PEzafFRaf73LV2zzkp9qfoNzzu/maX0i53fw
U3rwtPt177puutubzzqf3dWzz+qRZ33uPc27131X13F3++huur+38vHfP98L
d3t8ERERERGRu6X7uetd8wl682fm667nK7Z5OTfVvBDnnF/V0/pEzu/g+u69
9wOf1f9Wj1/d17rqMVefF++6nrpa792/N82r5195td7H8ufjcnf7qX6+e3/1
WVn9eQAREREREZFT0j0/6p6frv68vd58nH/fzWdtP3KNVPNXnHN+VU/rEzm/
g6/uu3ePp37MKdcLl71ncZ5brd/qdajWe/Xzq/vl7u/tfn7gVx/53bdff+Sn
n1+/30/7vd1eeNbfVV7H3ey1x899Pi5311f1ON3XodqfdB9fRERERETkqqnO
62edn6bdp05vPs7v7+azth+5Rqp5Ic45v6qn9Ymc38F3j3dERERERERERO6e
qneu5nPK770qPkddRW+uN0/2WduPXCNju8jpszjnfLWn9Ymc38Gr8bnrzV1v
/n1cb+56c9ebi4iIiIiI5KQ6r3e9ud78Sj5r+5FrpJoX4pzzq3pan8j5HXz1
OD/te8zT+n3fb/6ezxv4fnPfb+77zUVERERE5M7x/eZ68xN91vYj10g1f8U5
51f1tD6R8zv4a+PY958vpPXsu3r5bp9+yufGu3/vrM8bpN1/YNbnByovr09f
3C93f2/l47//+vXss/4uERERERGR09P9nPau+QS9+TPzddfzFdu8nJtqXohz
zq/qaX0i53fw94x708478vv6anzY7YV3fQ5cHiftevzVXr0OYz/xeTzQ7dOr
x6/e12vW6vtS7W+r13P38xURERERkdxU5xfVPNKu+Qe9+Yr5unxfsc1Lfqr5
Dc45v5un9Ymc38HTxsOZ5yk5PXs1nlx9XW3a5wdkZNd167PuJ1/9Xd37wFcZ
//3n8Ub3e9t3pfv8zTOIiIiIiMisVPMe1c9X532nXIeeNr+UOV+nN5f3pJoP
4Zzzu3lan8j5HTxtPPzY085fcnr2apy5q+++qr/zHGFF0u4bP6tP/9VHfvft
1x/56efr0X9fPs9qf9h9nFnPv5tqf/Lq44mIiIiIiHw11XnWKdehp80XZc7L
6c3lPRnrP6e34pzzXZ7WJ3J+B08bD8/1tPOdnJ6dZ/ru85Ifk3bf+G7vXP18
tT+s1kvVp1e/t9ovjX9+Hv9Uj1M9z+7jiMi5OeV4ISIiIlKlum/YrD599Xn6
3nmhtHk2vbm8J9W8B+ec383T+kTO7+Bp4+G9ntOPn+5pffRVfdf5y+rr0Kvf
2+3Bx/Lz/XI1n9P9XvXVqf6u6v3YfR1ERERERERWpzr/ch263lxvLtU8Buec
383T+kTO7+DV+CRtnHyW5/TXXL+/omdf3Zt378de9drV48zyKtXzqeaFun19
9Tp07xsvIvmZ9f0OIiIiIrvSnY9Kuw597zxG2nyX3lzek7H+c3orzjnf5Wl9
Iud38O64JW38fG3P6Zf5tXv2Wec1s+7TXvXIVbq9Uvf+8OXvXdzXl3168fOz
rssQkfenel+Xny8Kuw+GiIiISJXy88/F+Kc6L9t1HfreeYm0eSq9ubwnY/3n
9Facc77L0/pEzu/gs8YzaePqe3pOv8yv0bN39wPd69Crxxnb9edxQrdP7/bj
q737epY9e/M69Gq/0X3dus9fRD6n23dX++fu/lBERETkqnEdesJ8lN5c5qaa
F+Kc87t5Wp/I+R181/gnbRx+T8/pl3lmzz7r/T6rN69+vnsf+NU+7Xr25nXo
3dez2g5/6fFEZH66x4tq/7P77xARERH5aqrz02peS2+eML+kN5e5qeYxOOf8
bp7WJ3J+B989DvoxaeNz/r3n9Mt389P79Goeo+p/Z/XX3evfZ30/e7dPr163
Wb356s9FiMjzqY6z3cfxvhYREZFTUo1/ut+3VWXW5wn15pn+6nYhZ2es/5ze
inPOd3lan8j5HXz3OOirSRvP82c8p4++qp/ep5/us/r07jzS+Lnnx1fd9Vi9
r7vrXeTO6b5Pq5+v9v+7/z4RERGRZ1ONf7qfE9abJ8zz6M1lbqrzIM45v6qn
9Yac39l3j4PenbTxP3/Gc/ro0/2UPn110nrz6nl23xfV41Tfe1719Y+3K/MY
It+n+z6q3o+VV+O37n5ARERE5JTM6s2vff/2tHkbvbnMzVj/OX0W55yv9rTe
kPM7++5xUHrSzhf4M57TU5/uevaR1X169/lU80jd+7pX76Pq945//3lc152P
EklO9X6peu3qcbo/332c6v1Y7c9ffT1ERERE3p1q/uq3H/njz+OhP/w87vlN
eZ+uXX36e87f0+Zh9OYyN9X5DuecX9XTekPO7+y7x0GnJu08gn/Fc3rqU3xX
n57Ws8/q06vrVSuf9fxnfX96dXyp3nfV6zD+/edx46y/V2RFqu2/nNdtevV7
q/fLrO8JFRERETkl3XFR9/PMevP3+Hu2FklL9f7lnPO7eVpvyPmdfff46C5J
Ox/hX/Gc/jrN0/r0XT376vu6d78nvfv8y+vZi16vuh62mqda/XkAke9T7c+r
7XD8++c/v1G9L6r3Ude77zvjPREREblbqvOsWff/0Zu/x1dsG5Kf6vyLc87v
5mm9Ied39t3jo7sn7TyFr/CcXnuXp/XmV+3TZ123Put68+7jiKxI931Rebcf
797PoesiIiIiMlL149V5U7dP15u/x9+5zUhOxvrP6a0453yXp/WGnN/Zd4+P
pJe08xq+wnP67tWe1pvfrU+vns/YHp+/3vb0VPNmrot/T7rznLPeF+37qBc9
+GrXm4uIiMhV8/j88fP5cjWv1R1Hdb8fJ7M3v16fvnp7k8xU8w+cc343T+sN
Ob+z7x4fyZykne/wFZ7Td6/2tN58dZ8+63vSZ/XmZa9XzC91jy/Vep/1enZ/
b7V+x99z7ucHuvOB3e957D7+6rT78WZ/vTqz+vTyexMmfa+6iIiIyKxU4/Du
+K17H6FrfL+53lyukeq8m3PO7+ZpvSHnd/bd4yNZm7TzIP5Oz+nBZ7nefG5v
vvr+7Wmp+sTxvnl+HNvdHqr1ktbXd+cPu98P3u2jq/VV7R+691E/JauvQ++u
dxEREZHV6c5fdfvx6nyqeny9+Xt8zdYk6emej3PO+VU9rTfk/M6+e3wke5J2
fsTf6Tk9+CzXm2f25tVxZyw/3wt3/67q8avtp/q9j3vb5+8bWfmu7wWo0n3+
s17nKrO+N7yb7vtllnefZ/U6GAeKiIjIKZn1uc1uP643z/Q1W5mkpzqv5Jzz
q3paP8g5N18qryXtfIqv8JwevOt3uw599febV31c1SNXz7M7H1L9/Pjn8+PP
7n2nq76128PO+p7EX/o9P6Za79X7pfv41d9Vvf7V41Tbyel9964+fdf95EVE
RERmpTq/6I4P03rzvX162jyD3lxGuuf1nHN+VU/rBznnenOZm7TzLL7Cc/rx
rt+tN5/Vu5XX+TZ74er5dNdX9/hV/d7u9cuzfNZ1+t35vSrd+cnu8x/P++uf
Z5jVO3c/Z7LaV/fp1fqq1kv38UVERES6qcbJ1fik+/jdcaDePNNf3b7kjFTv
d845v5un9YOcc725vCdp5198hef0411P682710F0e67u/cYfv68/v57V8+we
d8bPNa4rn9RrV9n1OYTqdavWY/f1nHV9d/U43e9zrx7/lB58V59evW7l9j/p
vgHdnxcRERFJy7W/9zxt3kBvLiPd833OOb+qp/WDnHO9uexN2nkZ/4rn9OBd
P6U3737fX3f+odvntu9b3uyvx/LXe95Z1/NO6zEn3b+98ur16W4Pq1+H7u+d
1Ud3P5cy6/sR0vr0WZ+XEBEREdmV6jyimu/qfq61O17Sm8/1+VuMJKU63+ec
87t5Wj/IOdebS2bSztf4VzynH+/66b15lVO+P7o7f5XWY1avW3X8Hcv/yHX0
Rc8+63r5tOusV/fduzxtO6y2q9XfNyEiIiKyOtV9mapxWvc+TtXj6M3n+ju3
GXl/qvNfzjm/m6f1g5xzvbmclbTzOP4Vz+nHK1/dm3fvuz7r/t7V43R77bRe
Ne364u56rDLr+vq79dSn++re3PykiIiInJ5uf109TvXzsz63rDd/zb+2dUhK
xvrM6ac453yXp/WAnHO9uVw7aed3/Cue05tXvvp68+78TNWrjtf18zitehx9
63t6z2p9dY/L1fXm1te1vbt+q+2kO387a381a/5ZREREZHX+PP768fyoGqdV
j/Oe3jztvF4/LiPVvATnnN/N03pAzrneXOT7pJ0n8u89px+vfNd16N1erJtd
veqrzzcls3rP6vGr43X38a2vuTmlT6/me6u/q7yvRbGfqfbn1XZrvlREROR6
qcYn1Xigul9WNU4Y//w8/1w9Tvdzqt3zqerv3Xuf9rTzer25jFTvX845v5un
9YCcc725yDNJO3/k37vevHv9crcv6/ats99/V8vqPtr6Oitp16F39w/VvHT3
+0Cr8efj/bD5VRERkRPT7bWr8UD3e4vK5/Pwc4Cff293PKY3f82/up1JdsZ6
zumtOOd8l6f1gJxzvbnIV5J2Xsm/93P79Gp7m3WdcjVPVfVlp/Stqz+3sCuu
B5fvc0yfXsw/z+rZ3dddREQkJ9VxuZpfmtV3V+OTyrvjnFn379Kbv+avvt6S
lbE+c/opzjnf5Wl9H+f86z6WP7/fd4+/RBKTdr55T79Pbz6rz+r+3lffHz9m
Vt99is963dLidd6btPu6V/uZWfPkIiIicm6698Xq9uDd+y9179/V/fzee/px
vblkpppP5pzzu3la38c5X9ebV757XCaSmLTz0Hv6ub15t7ea9X3W3e08rT/l
/A79e1pvPqsfN84UERHJTzVOmHW+M+u8Ju086D3np2nn43rzu6U7n8w551f1
tL6Pc/7+3rzy3eM1kZOSdt56bc/p06vtobp+0/XgnOf4rPfdrOzqzavxZPX4
p7yeIiIid053nqc67lfnNav78VmvQ3d8qB9/zWetL9mbar/BOed387S+j3Oe
05tXvnscJ3JS0s5nr+3516FXSesTOb+zrzgWPJNt92n/yOfvMa/8na/J96n2
z7uej4iISHJ+9ZHfffv1R376+Xj++/J+5t37se+6X1aVWePA1eeVmefR+vG7
ZfW8Meecn+5pfR/nPL83r3z3uE/kpKSd/17bc65PX+27/l6+d71zffr3Xs1v
d+/HXm3n1c9X16N1U41vq/38q79HRETkCqnmZ6rjfvd4Pet7yWf9vdc4b0o7
X9ab3y3VfoNzzu/mab0e5/x6vXnlu8eDIicl7bz42p7Tt3Ku37+ezzoudHvz
7nx4dT1a9Xd1n081PqyuZ6/Gt9XzrP6uaj5/1noRERF5Z7rzLd3Py6VdV756
nPaecXja+a/eXEaq/QnnnN/N03o9zvl9evPKd48TRa6QtPPoa3tO78l5gqf1
1Kf4rP1/9/7ts35vN9V4terNy+vjip+vts9q/Fm9PtXz3PW6iYjItVMdd7qf
E+sev6rP1121N987fk47n9Wb3y3VeJhzzvnwtF6Pc643r3z3uFLkCkk7v762
5/SYnJ/oab32Vfv0Wd+TPut+7NXjVN69bk5ERESeT/X5tFl9evf56M0zfcW2
J+vSnY/lnPOrelp/xznXm8/y3eNNkSsn7Xz8np7TY3J+oqf14Hfr02c9z27K
/r2Y/6+u46vG1bv+LhERka+kmlfpfg6tGp/ozZ/xtPNN/fjd0p135Zzzq3pa
f8c515uv9t3jUJErJ+38nT/jOT0m5wme1oPv6s2rdPv0bs/e7d+7vXz3+vRu
n9593aqfd728iIjcIffszdPOB/Xmd0t3HpVzzu/maf0d51xvvst3j1tF7pi0
831+ouf0rfyentab69Nf69O7vXk1nuz26SIico1Ux4vdz+urqY7X1fGu+7mv
Wd97rjff63O3OlmdahzLOed8eFp/xznXm5/iu8e5IldO2jwA53p83vW03lyf
/tr94Y0DRUTk+6y+33hauuOH6r4u1XF51uuZ2Y9frzefvX3JnlTjW845v5un
9XSc8xwfyzn7q9N99/hX5I5Jm0/gXC/Pu65Pf09vXo2Hu+/H1a+PiIjsTXf+
5KrHi+rvrX5+1veMVI9zjT497fzC+Oeqqd6/nHPOh6f1dJzzHB/LOfurq/ru
8bLIHZM2z8B5juf0xfyeffrq69Cr3ry6Dq6632z1Pqp+76zXZ3XcT15EZGTW
/ryab1nxnN+Z6rhZHR+rx6l68NXH0729edr4X29+t4z1ljMvyjnnaZ7W03HO
c3ws5+yv7ua7x9Ei8pekzUtwnuM5PTLf26ev3g+n9ea7XofV6b7fdz9fEZEf
M+vzP9V+vvq+8u711N1eeNfnsrrXcVfzS9Xxpfq7quNOdRw/63rztPG8fvxu
GeszZ/6Tc853eVofxznP97Gcsx/jj333uFtE/pK0+Q3OczynX76q3+069O59
2qvHr3rzqh+pxs/V48+6P+3qdO9jP5Y/j0ur7bP6vd2fFxGp9lfVz1f7sce9
7efxTHm8aHqVar86674o1eNXz6faP3f3/93jcnXc1Jvv9V/afiUr1fuUc875
8LQ+jnOe72M5Zz/GX/Pd43QR+UvS5j04z/ecPvp0P71P7/bm1eNUvUM1P1/1
5uO/P3fcVf1d1fZTPU73us7u9vn4PsB6dhH5nGp+o/r5aj/W7bu76X5eqzru
VH9vddysHr97HX31893Xobu+uveNqV4H/fhr3l2/sjfVfoNzzvnwtD6Oc57v
YzlnP8bn+u7xu4j8ctLmSTjP8Zw++nQ/vTev5s+791evXp/qccb2+Hl8tfo+
urN6nOr9Vf181Zt0+5Tq9azOR179+0Tkfel+7mVWqv1/tX/u3vejevxZXv3e
aj/Z/Xurx5+1XrqPUx13yuNI8fhlb14cd/Tmr/mr24XsSbUf4JxzPjytd+Oc
n+tjOWf/xvf67vMAEfnlpM23cJ7jOT31KX5Kb969T3v3+rjuvHr1OFUvUG23
1fMf//7zOK37fKrfW16HOOm+xN0+ffXnEB6vl8+vZ3XeNOv5iCSn2wt390vd
dD+HM6s37x53Ku/26d3s6v27n6eqjhfV61aNB2bdp33u+CptPKw3v2qq8SHn
nPPhab0b5/xcH8s5+zee6bvPD0Tk9aTNz3CuT8/xtOvQu/Pk3fu4dveT1c93
+/FqHF49frf3L+/Tu/g60Crd3mrW5y66Ga+Lca+cle51u1Uef4/D5/1Y974c
u95f1f52Vj/ePU7N+jzYau8eT6vtofu9Ht0evMp7+vFze/NX30+Sle7+lnPO
7+ZpvRvn/Fwfyzn7N34N330+ISKvJ22eh3M9+/X69Gr/0+0XZs3zV+Pk7v6z
ev7l9+pOuu67Stp1iN0+pUq37+s+fvl7F38eY1dWXw97eqr1OGt7npXxvNad
r3W/x6FKddzpPp9u37q6Bz/d28fZ5n1FZq3H7nhj7ngpbbyqN79quvtzzjm/
m6f1a5zz6/lYztnv8Wv77vMPEXk9afM/nOvTz+3Tq/3MrOvKx/Lz45Bq/n9X
/1v9fLfX3nV9YvX8q9ezWu/V+Uv39Vnd93XvM189TrU9d8/jqv1Y9X7Umz/O
4z7u8+tcrZdqPXY/z9Pdb3S38+7Pd7fb6nGq13PW54VW3w/8lMzq06vHr7b/
7n3aq8d3Xfljn729yJ5U7yPOOefD0/o1zvn1fCzn7Pc4/953n6+IyOtJm0fi
XJ9+bm/e3c90e6XHj/98v/laD/v8vPeufnx1nz7+7ufnQ6rtqvv6V+mu31ne
3W6r16f6+bTro6+a7uvc/dxO934U1Xay+v4V5d/bvB9I9TrM6sd/6e++S2Z9
T0r3e0yqx3dd+Wu+cxuSfqrxD+ec8+FpPRrn/D4+lnP2h5w/47vPb0RkftLm
nTjXs7+/T+/2Gt2ecXVf/Np+7/PrWfVHp9xnuNunz+rjquz6vd1+s9v7V+d3
3ecpr6Xazqv1Mqsf72bW9r/6czXdfvb068R3fR9KN931Uj0f15XP9VnrV/Zm
rM+ceTbOOU/ztB6Nc34fH8s5+0POV/ju8yERmZ+0+SvO9elf79O7+4FT+uJu
H3pKP776dUu7Xr7y7na7ujcfy8bDp2TWfRK6223a+27Wfm/muvnHsrrv3uXd
12HWfV30469593WWvamOy5xzzh97Wo/GOb+Pj+Wc/SHn7/Td508i8r6kzXdx
rk/PuZ5uVlb3y7v/vmdz1f59Vp/evY64GsdWfWv187PWrzxOtd+b9XmJ1f14
2udq1q6t6/bgu3r27uO8ZxySNq7Tj98t1XGZc8758LS+jHPOx3LOfpLzZN99
viUi+5M2n8b5lXr2tF7glL7+9Jzes8/qzVd/v7m8J1UPXm2H3fV+Sj/+nlf7
c9KOF1w/rh+/T8b6zJm/4pzzUzytL+Oc87Gcs5/k/ETffX4mIrlJm5fjd/ac
fnyWp/UCevz3JK1P39Wby1mpziN+9ZHfffv1R376ef3/vryfwK7efNfrlra/
PatHvqqnja/05jJS7ec555wPT+vFOOe88rGcs//k/A6++3xORHKTNo/H7+Bp
8+F69lN89/7yx+zq06ses3s/9qo/7T6OZKZ6H1XbW3Ue0e3NT7l+PG3/pu9O
8LTxkn5cRqr9M+ec88ee1otxznnlYzln/8n5nX33+Z+InJe0+UB+B0+bV9e/
n+K79pO7rkPv9t2zHkcyU+1XZ71fTrmuPG2/lHZ8ubanjWf04/JaxnrOmUfi
nPNTPK0X45zzysdyzv6Tc65nF5F1SZtX5FfytPn5fE/rj9J89f5w23Xoxf3Y
q8ep3ndp99OWkepzDt3xfPU4q683n/U6pO1P0vb/1/C0cYh+XOam2m9zzjl/
7Gn9F+ecd30s5+xXOef6dBHJSdr8JL+Sp83/n+tp/dTd+vRZvXn1fqnO46rv
v5bMlPcTKLaH1b35rL8rbf+Qtn8+y9PGCTk+6/0iZ2Ws/5x5Hs45P8XT+i/O
Oe/6WM7Zr3LO9ewicm7S5jn5iZ7WI1zP03quu/Xm1e+tevDqe89Xvw4yN9U4
vNofzrrP/1V787T9aqanHd/zfdb7Qs5KtX/mnHP+2NN6Ls45n+VjOWd/yznP
8d3nryJy/aTNl/ITPa2nuJ6n9ear+/RdvXl13bHx2zVSfS6iex1693x/Vm+u
H0/wtOPvuT733S2np3uc5ZxzPjyt5+Kc81k+lnP2t5zzc333+a6IXD9p8648
2dP6jut5Wm8+q0+f1ZtXj19dR9y9f3u1Xrp/b3We2H2cq6Zav4973s/rqxo/
V9tV9TjV/Qeq7eqU3jxt//YeTztuXs/n7g3k9FT7Yc455489rc/inPPVPpZz
9sOc8+v57vNjEblv0uZvebKn9Snn+lV7824/Xl1f3P1e8qpPn7vf+3r/fnqq
+wN0t6tqfVV9d/e+BFVm3addP64HP9G77xe5dsZ2kTMfwjnnp3tan8U556t9
LOfshznnfPd5tojcN2nzwDzZ0/qacz2tT696xu751Kzzr6oPrX6+u9+rnmf3
+uVZf9er++8fU/XR3edfPX71+Yfqdat+vvs5jerxZ72e+nH9eLJ3t2e5Z7rH
I84558PTeivOOd/lYzln/8w555XvPv8WEfkxafPJPNnTep98T7sOfXUv2T2P
qx5/1nXu1XrpPp9dqZ5n1TtX6b5u3VTbQ/f36s3141fy195NcreM7SVnvoJz
zk/3tN6Kc853+VjO2T9zzvks330eLyLyY9LmpXmCp/VE+Z7Wp3evF+7el/vx
6/N5u+r2wt3ro6tUP1+dhz7z2n4l7dehuL9693Gq9TvLZ32P+T378bT9P3/+
HS3yOWM7ypl/4JzzUzytn+Kc8zQfyzn7bc45X+27z+9FRH5M2jw2T/a0HirH
T+nTu/1mN90etnqcqp+t+uXqfLNaX7P+3tWpPg9QvZ7V5yW63z8+a/vRjyfs
t/l73q1y1YztKGc+gXPOT/e0fopzztN8LOfstznnPM13zxOIiPyYtPlwnuxp
fZY+fdb16d1+tvv4VW9enVdWr89r19c/37tVvfbqcd3qfnzW87x2b562v+Wz
tlu5Z6r9Nuec89c8rYfinPNTfCzn7M855/wU3z2vICLybNLm1XmCp/Vf5/bm
s/r0KrOuR+72vNXzqXrqX33kd99+/ZGffr4e/ffleeis16fazqufr66X7/5e
/XiCp+1X7+OztluR7zO2r5zzfc45P8XT+ibOOT/dx3LOfp5zzq/qu+chRESe
Tdr8PE/wtL5Mn76rT6+uH6/ON6uevXu/9+515au/r7zbm89a76u3z7T3aeb+
8Ho+a/sUeSbVfptzzvlrntY3cc756T6Wc/bznHN+N989byEi8mzS5vl5gqf1
a/r0tD69ep5VD15tb93rxLs/P6sfP6U3T3vfZe7frueztkORZzK2u5zzbs45
P93TeiXOOb+qj+Wc/T/nnPPhu+c5RES+mrS+gL/T0/o4ffrqPr3qnbvfn171
3dV4qTrPrXr5Kmm9+bWvK0/bX13Pu9ubyFdS7Z8555zP9bReiXPOr+pjOWf/
zznn/DXfPV8iIvJs0voFnuA5/XjX79an77oOvfv96eX94Yu+vtubr75P+zX6
cb35au9uVyIrMrbHnPNizjk/3dP6I845v5uP5ZzjAuec87m+ex5FROSrSesp
+Ds9re/Tm8/qzav+uurHq+df/Xz3dat69l3fb36N3jxtf3Kud7cfkRUZ22PO
eS7nnF/V0/ojzjm/m4/lnOMC55zzvb57PkZE5Nmk9Rr8nZ7Tm1d+Sp+++j7t
VT/eTXX/9urxu+fF1e8tr1svnk/1OnT7dP34tf3V94HIOzK205zzU845v6qn
9UScc86Hj+Wc4wXnnPNM3z1/IyLy1aT1JnyF5/TmlevNR2Zdb979XvXu61Ct
x2q8VPXp1etWPR+9+TW8+34UeWeq/RjnnPO5ntYHcc45f+xjOec4wjnn/Bq+
ex5IROTZpPUs/Cue049Xfkpvvut+7N3ruFd/33o3s9ZLZm+e9n7P8Vnbj8iK
jO005zyRc87v5ml9EOec88c+lnOOI5xzzq/tu+eNRES+mrS+hj/jOb155Wm9
ebdfLq8rr+6vPqkf714vP8u71493X/+9vXna+zfHu+tXJCF/Ph/78z93nw9y
zvlVPa334Zxz/pqP5ZzjC+ecc/69755nEhF5Nmn9Dn/G9eZVb1tdD14dr6vX
ubyuvOjZZ30/+Op0+/TuOMd15e/xd24zIqtT7Wc455zP9bR+h3PO+VwfyznH
Hc455/wZ3z0vJSLybNJ6Iv6Mn9und7fP7vXm3eusu9/3vasfX/06V3+vfvw9
vmKbEdmV7nkT55zzuZ7W73DOOZ/rYznnuMM555yv8N3zWyIizyatb7qn36c3
n3W/8b/5yN9/+7u//cgvfo/5rH589ffFr/b3bFdp7y/9uMgzmXUexDnn/DVP
63E455y/x8dyzvGIc845f6fvng8TEXk2af3UPV1v3r2/+qxe/p59t3688u72
I5Kc7vkL55zzuZ7W13DOOd/rYznnOMU555wn++55NRGRH5PWZ13br9ebz7ru
e9Z916/da+vBu97dDkWSM+t8hHPO+VxP62s455zv9bGcc5zinHPOr+S75+dE
RH5MWi92Dc/vzav+uuq7q+vKu49f/bx+/J79+Kv7LZGTMus8gnPO+VxP62U4
55xn+ljOOX5xzjnnd/Dd83kiIj8mrV+7huf05lU/Xn0veXXf9e7jVz9/7X48
bTvUj4usyKzzAs4553M9rX/hnHN+lo/lnOMa55xzzj/77nlBEZEfk9bTZfq6
3rxaL93+urpOvOvV41+jH0/brnL8q/sRkROyepzPOef8NU/rWTjnnF/Dx3LO
8Y5zzjnnz/vueUQRkR+T1utl+tf73Or1r3rt337kj9/++iN/+Plxf7P8PuqZ
/Xja9pDva/YWIlmZNT7nnHP+Hk/rWTjnnF/Dx3LO8Y5zzjnn63z3fKSI3Ddp
PWCmv/++7pm9tr57te/eH4jszKxxNeec8/d4Wp/COef82j6Wc46DnHPOOc/x
3fOaInLfpPWMmZ7Wa+vB03z3+1hkZ7rjXs4553s9rTfhnHN+Tx/LOcdHzjnn
nOf77nlQEZEfk9ZXZrq++3Tf/T4T2ZnueJVzznmmp/UjnHPOud6cc8455+/0
3fOsInLfpPWenOvHRR6nGk9yzjm/hqf1I5xzzrnenHPOOefJvnu+VkTum7T+
lF/Dd2/XIomZNW7knHOe6Wk9COecc64355xzzvkdfPe8r4jIj0nrbflc3719
iZyUtHEj55zzuZ7Wd3DOOed6c84555zz5333/LGIyLNJ64tP993rU+QKSRvX
cc45f4+n9Rqcc8653pxzzjnnfJ3vnocWERERSUnaOI1zzvl7PK2/4JxzzvXm
nHPOOef5vns+W0REROTZpI2jOOec7/W0noJzzjlP8LGcc7zmnHPOOb+q754v
FxERkesnbfzDOec809N6Cs455zzBx3LO8ZpzzjnnnD/23fPxIiIi8r6kjUM4
55yf5Wl9BOecc57sYznnOM4555xzzuf67vl+ERER+UvSxgmcc86v4Wm9A+ec
c36ij+Wc4zvnnHPOOd/ru/sEERGRk5J2HOecc35tT+sXOOec8yv5WM457nPO
Oeec87N8d18hIiIyM2nHWc455/f0tB6Bc845v4OP5ZzxAOecc845v6fv7klE
ROSaSTvecc455997Wl/AOeec39nHcs44gXPOOeec86/47n5GRETWJu24wznn
nD/jab0A55xzzvXmnHPOOeecP+O7eyERkaslbT/POeecr/C0+X/OOeec69M5
55xzzjlP8N09lYjIV5O2X+Wcc84TPG0+n3POOef6dM4555xzzu/su/s0EclN
2v6Kc845P9HT5uc555xznu9jOWc8wznnnHPOOf+67+79RK6ctPc755xzfmdP
m2/nnHPO+fV8LOeMfzjnnHPOOefn+u6eU66ZtO2cc8455+s8bf6cc84553ws
54yXOOecc84555xzzjnnnF/D0+bDOeecc867PpZzxlecc84555xzzjnnnHPO
Mz1tfptzzjnnfLWP5ZzxGOecc84555xzzjnnnPP3eNp8Neecc875KT6Wc8Z1
nHPOOeecc84555xzzoenzSdzzjnnnN/Nx3LO+JBzzjnnnHPOOeecc86v6mnz
w5xzzjnn/LGP5ZzxJOecc84555xzzjnnnJ/iafO9nHPOOed8ro/lnPEn55xz
zjnnnHPOOeec7/K0+VvOOeecc77Xx3LOeJVzzjnnnHPOOeecc85nedp8LOec
c845v4aP5ZxxL+ecc84555xzzjnn/D6eNl/KOeecc865Pp1zzjnnnHPOOeec
c77C0+Y/Oeecc84516dzzjnnnHPOOeecc85XeNp8Juecc8455wk+lnPG7Zxz
zjnnnHPOOeec8+c9bb6Rc84555zzK/lYzhn/c84555xzzjnnnHN+Z0+bP+Sc
c8455/zOPpZzzhc455xzzjnnnHPOOb+Sp80Hcs4555xzzvXsnHPOOeecc845
55x/xdPm6zjnnHPOOec5PpZzzl8455xzzjnnnHPOOf+Kp82/cc4555xzzq/n
YznnPIhzzjnnnHPOOeecX9vT5sc455xzzjnnvPKxnHM+xTnnnHPOOeecc87P
8rT5Ls4555xzzjlf7WM557yMc84555xzzjnnnM/1tPkozjnnnHPOOT/Fx3LO
+R3nnHPOOeecc845f+xp80ucc84555xzfjcfyznniZxzzjnnnHPOOeene9r8
D+ecc84555zzuT6Wc85DOeecc84555xzzld72vwM55xzzjnnnPNMH8s557Oc
c84555xzzjnnXU+bb+Gcc84555xzfm0fyznnxZxzzjnnnHPOOb+ep82HcM45
55xzzjnnX/GxnHPezTnnnHPOOeec8/d72nwF55xzzjnnnHOe7GM557yec845
55xzzjnnnz1tPoFzzjnnnHPOOb+zj+WceQPOOeecc8455/xETzvf55xzzjnn
nHPO+TofyznzEpxzzjnnnHPO+QpPOx/nnHPOOeecc875uT6Wc+Y9OOecc845
55zf09POlznnnHPOOeecc84rH8s58yqcc84555xzzjM97XyWc84555xzzjnn
fJeP5Zx5G84555xzzjnnr3na+SbnnHPOOeecc875VX0s58wLcc4555xzzvlV
Pe18kHPOOeecc84555zP9bGcMx/FOeecc84557M87fyLc84555xzzjnnnF/D
x3LOPBjnnHPOOef8Pp52fsQ555xzzjnnnHPO+Vd8LOfMv3HOOeecc8713Zxz
zjnnnHPOOeecJ/tYzpn345xzzjnn/M6edr7AOeecc84555xzzjl/3sdyznwj
55xzzjnn7/S08TnnnHPOOeecc8455/xcH8s585+cc8455/zanjYe5pxzzjnn
nHPOOeec81k+lnPmYznnnHPO+VxPG39yzjnnnHPOOeecc8753Xws58wbc845
55ynedr4jXPOOeecc84555xzzvlZPpZz5r0555xzfj1PG/9wzjnnnHPOOeec
c8455+/0sZwzb88555xzvTbnnHPOOeecc84555xzfiUfyzm9A+ecc77C046/
nHPOOeecc84555xzzjnnYzmnT+Gcc/4eTzsecc4555xzzjnnnHPOOeec88c+
lnP6Js45rzxt/8k555xzzjnnnHPOOeecc855so/lnL6Pc/0y55xzzjnnnHPO
Oeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPO
Oeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPO
Oeecc84555xzzjnnnHPOOeecc84555xzzjnn/Bn//wE3HS7W
     "], "Real", ColorSpace -> Automatic, Interleaving -> True, Magnification -> 
     1], $CellContext`image2$$ = Image[CompressedData["
1:eJzt3c+qXUu/1+FXvAGxISpC8CaELSTjCuycGxAE29rOFaRpQ9AdTtKwdS7h
6AUoBFsi7E062jIksJJm0pQ1au0/GsYkY8wxqr5V9XxAPOPhvPt93zlX1qr6
/c5c+af/6t/81b/+u3/5y1/+xd8p/+/xf/5Ha/95+Sdrf73847X/snDOOeec
c84555xzzjnnnHPOOeecc84555xzznkv/vfX/tPy99b+7fIf/8Nj/41zfqGn
fR/gnHPOOeecc84555xzzjnn/ApP29NxzvleT/u+yjnnnHPOOeecc84555xz
zm972r6Jc875uZ72c4dzzjnnnHPOOeecc84553zL0/YsnHPOuX0955xzzjnn
nHPOOeecc87/7Gn7CM4553xmTzsncM4555xzzjnnnHPOOecJnjbP55xzznm/
nnbO4ZxzzjnnnHPOOeeccz62p83JOeecc87P8rRzF+ecc84555xzzjnnnPNz
PW0uzTnnnHM+qqedAznnnHPOOeecc84557x3T5sDc84555zzOp52LuWcc845
55xzzjnnnPO9njZ35Zxzzjnnc3raOZlzzjnnnHPOOeecc57vaXNOzjnnnHPO
Ezzt3M4555xzzjnnnHPOOf9xT5s3cs4555xzPoOn3Qs455xzzjnnnHPOOe/R
0+Z+nHPOOeec8/qedk/hnHPOOeecc8455/weT5u/cc4555xzzsfztHsQ55xz
zjnnnHPOOR/b0+ZjnHPOOeecc77X0+5ZnHPOOeecc84557yOp82pOOecc845
57x3T7v3cc4555xzzjnnnM/mafMizjnnnHPOOee3Pe1eyTnnnHPOOeecc57m
afMczjnnnHPOOedtPe3eyjnnnHPOOeecc77X0+YtnHPOOeecc87H9rR7Meec
c84555xzzufxtDkJ55xzzjnnnHP+Z0+7R3POOeecc8455zzf0+YbnHPOOeec
c855TU+7p3POOeecc8455/x+T5s/cM4555xzzjnnI3naHIBzzjnnnHPOOZ/B
0+YDnHPOOeecc845/3FPmzNwzjnnnHPOOefJnnav55xzzjnnnHPO+XWeNpfg
nHPOOeecc86v8LT7OOecc84555xzzvv1tLkH55xzzjnnnPM5Pe2+zDnnnHPO
Oeecc77laXMVzjnnnHPOOed9edo9l3POOeecc8455/wsT5vDcM4555xzzjmv
42n3U84555xzzjnnnPNePG3OwznnnHPOOef8tqfdKznnnHPOOeecc85H9bS5
EOecc84555yP6mn3Qc4555xzzjnnnHN+zNPmTpxzzjnnnHOe5mn3OM4555xz
zjnnnHNex9PmVJxzzjnnnHN+tafdyzjnnHPOOeecc855pqfNtTjnnHPOOed8
y9PuU5xzzjnnnHPOOed8Tk+bm3HOOeecc87H87R7EOecc84555xzzjnnP+Jp
czbOOeecc855vqfdazjnnHPOOeecc845v8LT5nKcc84555xze3DOOeecc845
55xzzpM9be7HOeecc845tx/nnHPOOeecc8455zzB0+aEnHPOOeecz+Bp9wLO
Oeecc84555xzzvn3njZX5JxzzjnnvEdPO+dzzjnnnHPOOeecc87v97Q5JOec
c8455/bgnHPOOeecc84555zzZE+bc3LOOeecc24/zjnnnHPOOeecc845T/C0
uSjnnHPOOZ/T087JnHPOOeecc84555xznjZH5ZxzzjnnY3jauZdzzjnnnHPO
Oeecc873etrclXPOOeecZ3raOZZzzjnnnHPOOeecc86v9rQ5Leecc845r+Np
51LOOeecc84555xzzjlP87S5Luecc845P+Zp50zOOeecc84555xzzjnv3dPm
wJxzzjnnvHjauZFzzjnnnHPOOeecc85n87S5Meecc875qJ52DuScc84555xz
zjnnnHN+29PmzJxzzjnnvXjauY5zzjnnnLf18vzvfv///2rtf/DOPO3rinPO
Oeect/W0uTTnnHPOeStPO6dxzjnnnI/q5Tlnf8p5j57255pzzjnnfFRPm2Nz
zjnnnJ/laecuzjnnnPOrvTzn7Ps45+N52vc9zjnnnPOrPW3uzTnnnHO+5Wnn
KM4555zzLS/POfsvzjlP87Tv25xzzjnnW542J+ecc875PJ52LuKcc875eF6e
c/ZHnHPOz/W0nzucc845H8/T5uqcc84579fTzjmcc845z/HynLN/4Zxzzv/s
aT83Oeecc57jaXN4zjnnnOd42rmFc84559d5ec7Za3DOOefJnvZznHPOOefX
edrcnnPOOef245xzzjn/cS/POfsFzjnnfGZPOydwzjnn/H5Pm/Nzzjnn3H6c
c845H8nLc86cn3POOec5nnZu4Zxzzvn3nrYX4Jxzzmf2tHMC55xzPrOX55x5
O+ecc87n8bRzEeeccz6zp+0ROOec8xk87TzAOeec9+jlOWfuzTnnnHPeytPO
aZxzznmPnrZH4JxzzkfytJ/7nHPOebKX55z5M+ecc875qJ52DuScc86TPW3v
wDnnnCd72s9xzjnnPMHLc858mHPOOeecH/O0cybnnHOe4Gl7Cs4559x+nHPO
Oa/j5Tlnfss555xzzjM97RzLOeec1/S0vQbnnHNuP84555zf9vKcM1/lnHPO
Oedzeto5mXPOOb/C0/YgnHPOub0555zzUb0858w/Oeecc845v8LTzuGcc875
j3jaHoRzzjm3H+ecc967l+ecuSXnnHPOOecJnnZu55xzzn/E0/YmnHPOx/a0
n4Occ875n70858wbOeecc845n8HT7gWcc875nz1tz8I557wvT/u5xjnnfE4v
zznzQM4555xzzrk9O+ec8zE8bS/DOec809N+fnHOOR/by3POHI9zzq/2v0g/
UNrXLeecX+1p9xTOOedje9pehnPOeVtP+znFOed8DC/POfM3zvk83nrPKc1Y
2vcBzvk8nnYP4pxzPoan7XE455yf62k/dzjnnI/h5TlnbsY5z/fW+z1J/ZX2
fYxznu9p9ybOOedjeNreh3PO+W1P+znCOed8DC/POXMwzrm9tiSdVdr3Yc65
fTrnnPO+PG1PxDnnvHjazwvOOeeZXp5z5lecc3ttSRq1tJ8jnHN7ds455+d6
2p6Ic85n87SfC5xzzjO9POfMnTif2VvvbSRJfZf2c43zmT3t3sc55zzT0/ZK
nHPeu6d9n+ecc57p5TlnjsT5DN56fyJJ0q3Sfm5yPoOn3RM555xnetoeinPO
e/G07+ecc87reHnOmf9wPpK33mNIktRTaT/HOR/J0+6hnHPO63jaHopzztM8
7fs255zzOl6ec+Y2nPforfcJUo3+4drfLP9g7b8+/Tn43wvvy1t/HUk1Sjsn
cN6jp91bOeec1/G0vRXnnF/tad+HOeec1/HynDOH4TzZW8/7NVdpe1XOE7z1
n0vNVfm6yzmHcJ7safdczjnndTxtz8U552d52vdbzjnn53p5zpmrcJ7grefx
6qO0vSHn3L5emZWvl5xzDucJnnYv5pxzfq6n7bk453yvp31f5Zxzfq6X55w5
Cec1vfW8XFml7d0457z190VlVb4ucs5RnNunc845P8vT9mKcc77lad8/Oeec
H/PynDP34NweXHtL22fxH/G/Xf792v9c/tna/+FTeNrXId/y1t/XdW3lfc45
p3Fun84553zL0/ZinHOe9n2Sc875MS/POXMMzu3BlbYnGtvT9qecJ3jan9Px
vPXPGZ3T1nmM8x497Z7OOef8mKft0Tjn43na9z3OOefHvDznzCU4tx+fp7R9
Taan7Q2v879e++/Lv1z7X8s/X/vE+f/jaV+3dTzt+1KOt/45pn1dfQ7k3D6d
c875Xk/bu3HO+/W072+cc85ve3nOmTNwbg/eb2l7k0xP27vl7Kmv/vp8ufZp
efvmsYfl2dqXZctfrH1enq89LN++PvZh03/71/209nH59Ze1zf9er39+7OPv
Xx+/+9r7p/vVu6f36dX2P2fjf3/rn7/V1n/+va/D3td5/zu5L3t8+3f79/E6
6zzJuX0655zzLU/bu3HO8z3t+xjnnPPbXp5z5gac24/nl7a/qONp+6z6e+29
Xyd7985797nSPW19ve3d++/997WXn3Mvf+5Xr/bW6rzKuX0655zP42l7Os55
jqd9v+Kcc168POfMATi3B88pbb9Qx+fZa+/dX9f82pNUOmtfP/ZePu3niD37
qKWdkzm3T+ec83xP29Nxzu3HOeecFy/POfd6zu3H65c2/7fvPvfz2ld8zUga
u7TPy9u/n+tXfM3o+9LO1Zzbp3POeb6n7fU45/bmnHM+qpfnnHs6n9Nbzy9n
KW0+P9sefO/75XPckkbtrO9v9uxt/YqvDX1f2rmdz+lpcwzOOZ/N0/Z6nHP7
cc45793Lc869m8/preeOs5Q2V0/bg1/9uW/7bkmq097vt319zj3t57J9elpp
53w+p6fNPTjnfDZP2wNyzu3HOec8zctzzj2az+mt54ijlTYP730PvvU6b/3+
4ddr75/Ou++e/nO88nUuSZ219f386r//3Z79ttf8GpihtHsBn9PT5iSccz6b
p+0NOZ/Z074/cM75qF6ec+7FfE5vPRfstbR59Wx78JrvtSRpvOzZ23rN93qk
0u4RfE5Pm6twzvmonrY35HwGT/s+wDnno3p5zrnn8rG99TxvtNLmzL3vwf3+
c0lSj139++Tt2YvXfE9nKO2ewsf2tDkM55yP6ml7Rs5H8rQ/75xz3ruX55x7
Kx/bW8/hei1tPmwPLknSeNmz1/Ga7+lIpd1r+NieNrfhnPPePW3PyHmPnvbn
mnPOR/XynHM/5WN467lar6XNda/ej/u96JIk9Vtfvzc+7Rxln35WafcgPoan
zW0453xUT9tLcp7saX9+Oee8dy/POfdQPoa3npP1Wtqc9ty59I/vx7deH3tw
SZLG66w9+9XnlrRzWs33aKTS7k18DE+b83DOee+etpfkPMHT/pxyznnvXp5z
7pV8DG8990ovbb569X78rM+Jv157/3QufPf07/fK15skSRO19zzgc+u3veZ7
12Np9yw+hqfNhTjnvHdP22Nybm/OOef5Xp5z7ol8DG89x0ovbS567hz4/s+J
+3vDJUnS1Z3197BffY5KOzfWfI96LO1exsfwtDkS55z34ml7TM7tzTnnPN/L
c859kPflredS6aXNOa/eg+/dj0uSJPWez60Xb/0+pJd2j+N9edociXPOe/G0
PSbn9uOcc57j5Tnn3sf78tZzpvTS5pZX78e3Xgd/n7gkSZqtzL9vPedcWvO9
6LG0ex/vy9PmTpxz3oun7T05tzfnnHP7cZ7predG6aXNIc/ag/v7xCVJks4t
8+9bzznH1nwveiztnsj78rQ5Feecp3na3pNz+3HOObcf52299RwovV724Gft
x31OXJIkqW1b57HZfg986/chvbR7Je/L0+ZanHOe5ml7Us7tzTnn3N6cn+ut
5zrpjbof3/rvaz8uSZLUV34PfPGar3mPpd1DeaanzbU45zzN0/akfE5P+3PB
OedpXp5z7lk801vPaVJquwfP2Y//Nk/9ae3j8usva75OJEmSBmnveW/Ufbo9
++3S7q0809PmYJxznuZpe1U+tqd9/XPOeSsvzzn3Jt6Xt57HpDTbflySJEm6
p1H36a1f15TS7q28L0+bm3HOeStP26vysT3t659zzlt5ec65H/FMbz13Scl+
XJIkSbou+/SxS7vn8kxPm5txznkrT9ur8jE87eucc85beXnOuQfxTG89R0nJ
flySJEnKyT597NLuxTzT0+ZsnHPeytP2sLwvT/t65pzzVl6ec+47vK23nouk
NOp+/OXap+Xtm8celt/+HsrWr7ckSZJ0pK3zrX362KXdo3lbT5uzcc55K0/b
w/JMT/u65ZzzVl6ec+41vK23nnOkZD8uSZIkjZd9+pyl3bt5W0+by3HOeStP
29tye3POObcf52neep5RO/txSZIkSfbpY5d27+aZnjbH45zzqz1tb8vtzTnn
3N6ct/LWc4vajbofb/26SpIkSTNmnz5Gafd03tbT5nicc361p+1tuf0455zb
j/OrvfUconb245IkSZJaZZ8+Rmn3et7W0+Z+nHN+taftebm9Oeec25vzs7z1
vKF2vezN7cclSZKkeTp3n25vfnVp93re1tPmfpxzfrWn7Xm5vTnnnNuP873e
eq5QO/txSZIkSb1nn95XaXMA3tbT5oScc36Wp+15uf0455zbm/Mtbz0nqN2o
+/Fna1+Wn9Y+Lr/+sjbd+ytJkiTN0N7zv316X6XNDXgdT5sTcs751Z62F+b2
5pzzOb0859wLeFtvPQ+4qt7341v+cu3T8vbNYw/Lb/Oy1q+3JEmSpPZt3Rf2
3jvs09uWNjfgbT1trsg552d52l6Y25tzzuf08pxz/ud1vPW9v3Zp+/G9e3P7
cUmSJElntXefftZ9x9783NLmDLyOp80VOef8LE/bC3P7cc752F6ec875vI63
vsfXrvfPlbd+/SRJkiTp/8/n0PsqbS7B63jaHJJzzs/ytD3ybJ729cA552d5
ec45z/M63vq+flWj7sdfr71/Ope8e/rnvhr2fZQkSZKU0977iH16ZmlzCV7H
0+aQnHN+lqftkWfztK8Hzjnf6+U559zO63jre3nt0vbje/fmfu+6JEmSpF7y
e93HKG2Owet42tySc873etoeeVRPe9855/wsL88553Nex1vfv69q1M+VS5Ik
SdKo+Rx6ZmlzDF7H0+aWnHN+lqftnXv3tPeXc87P8vKccz7n53rre3bt7Mcl
SZIkaYx62ae3fp1qlzb34Od62tySc87P8rS9c++e9v5yzvleL88553Bex1vf
p68qbT++d2/+Yu3z8nztYfn29bEPw75fkiRJkrTV1v3I73XPLG3uwet42pyT
c873etreuRdPex855/wsL885521+rre+N19Vq9+z53PlkiRJkpRZL59Dt0/P
nJ/wY5425+Sc87M8bU+d5mnvF+ec7/XynHOu5nW89f34qnrfj79ee/90znj3
9M99Nez7JUmSJElntfc+1cs+veZrWLO0OQmv42lzUc453+tpe+o0T3u/OOd8
r5fnnPMzP9db34OvqvfPlb9c+7S8ffPYw/Js7cuw75ckSZIktWrr/tXL3tw+
PXPewo952lyUc873etqeOs3T3i/OOd/r5Tnn/MzP9db33avqZT/e+nWSJEmS
JO2rl31669fpqtLmKvxcT5uLcs75Xk/bU9uPc875MS/POedkfq63vtdelc+V
S5IkSZKuyOfQ+yptDsPP9bQ5Kuec7/W0vba9Oeec3/bynHMe5ud66/vrVfWy
H2/9OkmSJEmSrq2XfXrr1+mq0uYw/FxPm6NyzvleT9tr25tzznnx8pxz7uXn
eut76lX1/rnyF2ufl+drD8u3r499GPb9kiRJkqRR27rf9bI3t0/PnOfwY542
d+Wc8y1P22vbm3POefHynHO+5ed66/voVfWyH2/9OkmSJEmSsupln976dbqq
tLkNP9fT5q6cc77laXtt+3HOOS9ennPOt/xcb30fvTefK5ckSZIk9ZjPoWeW
Nrfh53ra3JVzzvd62h7c3pxzPqqX55xzLD/XW987r6qX/Xjr10mSJEmS1He9
7NNbv05XlTbn4ed62pyWc863PG0Pbm/OOR/Vy3POeZWf663vl1fVy9785dqn
5e2bxx6WZ2tfhn1fJEmSJEnH2ro/2pu3LW3Ow8/1tDkt55xvedoe3N6ccz6q
l+ec8yo/5q3vkVfVy3689eskSZIkSZor+/S2pc2F+DFPm9NyzvmWp+3B7c05
56N6ec45r/Jj3vq+eFW97M19rlySJEmSdEU+h55Z2lyIH/O0OS3nnG952h7c
fpxz3ruX55xzKT/XW98X763Ofvy6vfnrtfdP54N3T//6V92/L5IkSZKktm3d
N3vZm4+6T0+bC/FzPW2uyznnW25vzjnnx7w855w/+TFvfS+8ql72461fJ0mS
JEmSbtXLPr3163RVaXMkfszT5rqcc77l9uacc37My3PO+ZMf89b3v6vqZW/+
Yu3z8nztYfn29bEPw74vkiRJkqTMtu6n9uZtS5sj8WOeNtflnPMttzfnnPNj
Xp5zzp/8mLe+/91bL/vx1q+TJEmSJElnZp9ep7Q5Ej/maXNdzjnfcntzzjm/
7eU555zJz/XW9797szeXJEmSJKl+9uZ1Spsj8XM9bQ7MOef25pxzftvLc855
kh/z1ve8q+plb+73sUuSJEmSeszvb88sbe7Ej3naHJhzzu3HOef8tpfnnPMk
P+at73NX1Wpv7nPlkiRJkiR937F9ur353tLmTvyYp82BOed8y+3NOee8eHnO
OU/yY976PndvvXyuvPXrJEmSJElSy3wOvU5pcyd+zNPmwJxzvuX25pzz2bw8
55wb+bne+j53b73szV+ufVrevnnsYXm29qX711+SJEmSpD+3df+1N69T2tyJ
n+tpc2POObc355zP5uU553zIj3nre9tV9bI3b/06SZIkSZLUMnvztqXNqfgx
T5sbc865vTnnfDYvzznnQ37MW9/P7s1+XJIkSZKk8bJPr1PanIof87S5Meec
25tzzmfz8pxzPuTHvPX97N562Zv7feySJEmSJH2f39/etrQ5FT/maXNjzjm3
N+ecz+blOed8yI956/vZvfWyN3+x9nl5vvawfPv62IfuX39JkiRJku5p675s
b16ntDkVP+Zpc2POObcf55zP5uU553zIb3vre9hV9bI3b/06SZIkSZLUU/bm
bUuba/HbnjY35pzzLbc355z37uU55xzIj3nr+9ZVtdqb249LkiRJklS/Y/t0
e/O9pc21+DFPmzNzzrm9Oee8dy/POec9fsxb37fuzefKJUmSJEmSz6HXKW2u
xY952pyZc87tzTnnvXt5zjnv8WPe+r51b73szV+ufVrevnnsYXm29qX711+S
JEmSpJpt3a/tzeuUNtfixzxtzsw55/bmnPPevTznnPf4MW9937q3XvbmL9Y+
L8/XHpZvXx/70P3rL0mSJElSzbbu1/bmdUqba/FjnjZn5pxze3POee9ennPO
e/yYt75v3Vsve/PXPz/28fd/buvXTZIkSZKkHtu6X9ub1yltrsWPedqcmXPO
7c055717ec457/Fj3vq+dW9pe/PWr4ckSZIkSfoje/NzS5tr8WOeNmfmnHN7
c855716ec857/La3vlddVau9+db/HXvr10OSJEmSJP3Rsc+h25vvLW0Oxm97
2pyZc87tzTnnvXt5zjnv8dve+v50Va0+V25vLkmSJElSfmm/v73163FVaXMw
ftvT5sycc25vzjnvxctzzrmOH/PW96d7S/t97PbmkiRJkiTll7Y3H3WfnjYH
48c8bS7NOZ/H7c055714ec45v/Fj3vr+dG+97M1frn1a3r557GF5tval+9df
kiRJkqTktu7j9uZ1SpuD8WOeNpfmnM/j9uac8168POec3/gxb31/ujd7c0mS
JEmStJW9edvS5mD8mKfNpTnn87i9Oee8Fy/POec3fsxb35/urZe9+Yu1z8vz
tYfl29fHPnT/+kuSJEmSlNzWfdzevE5pczB+zNPm0pzzedzenHPei5fnnPMb
P+at70/3Zm8uSZIkSZK2sjdvW9ocjB/ztLk053wetzfnnPfi5Tnn/MaPeev7
0731sjf/7ffA/bT2cfn1l7XuX39JkiRJkpLbuo/bm9cpbQ7Gj3naXJpzPo/b
m3POe/HynHN+48e89f3p3nrZm7d+nSRJkiRJ0h/Zm9cpbQ7Gj3naXJpzPo/b
m3POe/HynHN+48e89f3p3nrZm7/++bGPv/9zW79ukiRJkiTN0NZ93N68Tmlz
MH7M0+bSnPN53N6cc96Ll+ec8xs/5q3vT/fWzd587f3Tz+93T//6V92//pIk
SZIkJbd1H7c3r1PaHIwf87S5NOd8Hrc355z34uU55/zGj3nr+9O99bI3b/06
SZIkSZKkP7I3r1PaHIwf87S5NOd8Hrc355z34uU55/zGj3nr+9O99bI393lz
SZIkSZLq5/PmbUubg/FjnjaX5pzP4/bmnPNevDznnN/4MW99f7q3bvbm/n5z
SZIkSZKq5+83b1vaHIwf87S5NOd8Hrc355z34uU55/zGj3nr+9O99bI3b/06
SZIkSZKkP7I3r1PaHIwf87S5NOd8Hrc355z34uU55/zGj3nr+9O99bI3f7b2
Zflp7ePy6y9r3b/+kiRJkiQlt3UftzevU9ocjB/ztLk053wetzfnnPfi5Tnn
/MaPeev70731sjd/sfZ5eb72sHz7+tiH7l9/SZIkSZKS27qP25vXKW0Oxo95
2lyacz6P25tzznvx8pxzfuPHvPX96d7szSVJkiRJ0lb25m1Lm4PxY542l+ac
z+P25pzzXrw855zf+DFvfX+6t1725i/XPi1v3zz28PvvbW/9+kmSJEmSNHJb
93F78zqlzcH4MU+bS3PO53F7c855L16ec85v/Ji3vj/dm725JEmSJEnayt68
bWlzMH7M0+bSnPN53N6cc96Ll+ec8xs/5q3vT/fWy9689eskSZIkSZL+yN68
TmlzMH7M0+bSnPN53N6cc967l+eccx2/7a3vT1dlby5JkiRJkrZK25u3fj2u
Km0Oxm972pyZc87tzTnnvXt5zjnv8dve+v50Va0+h25vLkmSJElSfsf25j5X
vre0ORi/7WlzZs45tzfnnPfu5TnnvMePeet71b2l/f721q+HJEmSJEn6I7+P
/dzS5lr8mKfNmTnn3N6cc967l+ec8x4/5q3vW/eWtjff+r9jf/3zYx9//+e2
ft0kSZIkSeqxrft12u9jtzfnyZ42Z+acc3tzznnvXp5zznv8mLe+b91bL3vz
F2ufl+drD8u3r4996P71lyRJkiSpZlv3a3vzOqXNtfgxT5szc865vTnnvHcv
zznnPX7MW9+37q2XvfnLtU/L2zePPSzP1r50//pLkiRJklSzrfu1vXmd0uZa
/JinzZk559zenHPeu5fnnPMeP+at71v31svevPXrJEmSJEnSyNmb1yltrsWP
edqcmXPO7c055717ec457/Fj3vq+dVWt9un25pIkSZIk1e/Y3tx+fG9pcy1+
zNPmzJxzbm/OOR/Vy3POOZDf9tb3ravyOXRJkiRJksbL58rbljbX4rc9bW7M
Oedbvndvbp/OOe/Fy3PO+ZAf89b3sHvrZW/+Yu3z8nztYfn29bEP3b/+kiRJ
kiTd09Z92d68TmlzKn7M0+bGnHN+1n7c3pxz3ouX55zzIT/mre9n99bL3vzl
2qfl7ZvHHpZna1+6f/0lSZIkSbqnrfuyvXmd0uZU/JinzY0559zenHM+m5fn
nPMhP+at72f31svevPXrJEmSJElST9mb1yltTsWPedrcmHPO7c0557N5ec45
H/Jj3vp+dlX26ZIkSZIk5Wc/3ra0ORU/5mlzY845tzfnnM/m5TnnfMjP9db3
tnvrZW/u97dLkiRJkmbI72NvW9rciZ/raXNjzjm3N+ec8+LlOefcyI956/vc
vfWyN2/9OkmSJEmS1DJ78zqlzZ34MU+bA3PO+Zbbm3POefHynHOe5Me89X3u
qlrt0+3NJUmSJEn6vmN7c/vxvaXNnfgxT5sDc875ll+9N7dP55z34uU55zzJ
j3nr+9xV9fI59Bdrn5fnaw/Lt6+PfRj2fZEkSZIkjdHWfdbnytuWNnfixzxt
Dsw556324/bmnPNevDznnCf5ud76nndvvezNW79OkiRJkiSdmb15ndLmSPxc
T5sDc865vTnnnB/z8pxzzuTHvPX9797szSVJkiRJqp+9eZ3S5kj8mKfNdTnn
fMvtzTnn/JiX55zzJz/mre9/V9XLPt3vb5ckSZIkJeT3sWeWNkfixzxtrss5
51tub84558e8POecP/kxb33/u6pe9uatXydJkiRJkm5lb962tDkSP+Zpc13O
Od9ye3POOT/m5Tnn/MnP9db3wnursze/bp/+eu390/ng3dO//lX374skSZIk
qW1b981e9uOj7s3T5kL8XE+b63LO+Zan7c3t0znnvXt5zjmX8mPe+r54Vb3s
zV+ufVrevnnsYXm29mXY90WSJEmSVKet+2Yve/PWr99Vpc2F+DFPm9NyzvmW
p+3B7c0556N6ec45r/Jj3vq+eFW97M1bv06SJEmSpLmyN29b2lyIH/O0OS3n
nG952h7c3pxzPqqX55zzKj/XW98jr6qXfbrPoUuSJEmSfiSfK88sbc7Dz/W0
OS3nnG952h7c3pxzPqqX55zzKj/XW98vr6qXvXnr10mSJEmS1Hf25m1Lm/Pw
cz1tTss551uetge3N+ecz+blOeccy8/11vfOe6uzN79un/5i7fPyfO1h+fb1
sQ/dvy+SJEmSpNtt3Qd72Y+PujdPm9vwcz1t7so553s9bQ9un845n83Lc875
lp/rre+jV9XL3rz16yRJkiRJyqqXvXnr1+mq0uY2/FxPm7tyzvmWp+217c05
57x4ec453/JzvfV99Kp8Dl2SJEmSlJDPlfdV2tyGn+tpc1fOOd/ytL22vTnn
nN/28pxz7uXneut76lX1sjdv/TpJkiRJkq6tl71569fpqtLmMPxcT5ujcs75
Xk/ba9ubc875bS/POedhfq63vr9eVe+fQ3+59ml5++axh+XZ2pdh3y9JkiRJ
6qWt+1ov+3F788z5DD/maXNUzjnf62l7bft0zjk/5uU555zMz/XW99qr6mVv
3vp1kiRJkiTtq5e9eevX6arS5ir8XE+bi3LO+V5P21Onedr7xTnne70855yf
+bne+r57VT6HLkmSJEn6kXyuvK/S5ir8XE+bi3LO+V5P21Onedr7xTnne708
55yfeR1vfQ++ql725lv/+V+vvX86Z7x7+ue+Gvb9kiRJkqSz2nuf6mVvXvM1
rFnanITX8bS5KOec7/W0PXWap71fnHN+lpfnnHM1P9db34+vqvfPobd+/SRJ
kiRptHrZj9ubZ85P+DFPm3NyzvlZnran7sXT3kfOOd/r5TnnvM3reOt781Wl
7c337tNfrH1enq89LN++PvZh2PdLkiRJkrbauh+dux/3ufKzSpt78DqeNufk
nPO9nrZ37t3T3l/OOT/Ly3POOZyf663v07VL26f7HLokSZIkHauXz5W3fp1q
lzb34Od62tySc87P8rS9c++e9v5yzvlZXp5zzue8jre+Z19Vq9+zZ58uSZIk
ScfqZT8+2948bY7B63ja3JJzzs/ytL3zqJ72vnPO+V4vzznnc17HW9+/a5e2
N9+7T3+59ml5++axh+XZ2pfp3kdJkiRJ+W3dX/ze9b5Km2PwOp42t+Sc872e
tkeezdO+Hjjn/Cwvzznndl7HW9/Lr2rUz6G/Xnv/dC559/TPfTXs+yhJkiQp
p733EZ8rzyxtLsHreNocknPOz/K0PfJsnvb1wDnnZ3l5zjnP8zre+r5eu1H3
6ZIkSZLUKvvxvkqbS/A6njaH5Jzzszxtj8zt0znnY3t5zjnn8zre+h5fu7S9
+d59ut/rLkmSJOms/N71MUqbM/A6njZX5JzzszxtL8ztzTnnc3p5zjn/87be
+t5/Vb1/Dt0+XZIkSdLe9u7Hfa48s7S5AW/raXNFzjk/y9P2wtzenHPO7dN5
63lA7Xrfp2/99/ptHvbT2sfl11/Wpnt/JUmSpBnae/63H++rtLkBr+Npc0LO
Ob/a0/bC3D6dc87tzfmWt54T1G7UfbokSZKkebIf76u0OQBv62lzQs45P8vT
9rzc3pxzzu3T+Vneeq5QO/t0SZIkSWnZj/dV2r2et/W0uR/nnF/taXtebm/O
Oef25vwsbz1vqF0ve3P7dEmSJGm8zt2P25u3Ku1ez9t62tyPc86v9rQ9L7dP
55xz+3R+tbeeQ9TOPl2SJEnSWdmPj1HaPZ239bQ5HuecX+1pe1tub8455/bm
PM1bzy1qN+o+/eXap+Xtm8celmdrX6Z7fyVJkqQfaev8bD8+Rmn3bp7paXM8
zjm/2tP2ttzenHPOE7w859xTeFtvPc9IyT5dkiRJGi/78TlLu3fztp42l+Oc
81aetrflmZ72dcs55628POfca3hbbz3nSMk+XZIkScrPfnzO0u7RvK2nzdk4
57yVp+1heV+e9vXMOeetvDzn3Hd4preei6Q06j699esqSZIkHcl+fOzS7sU8
09PmbJxz3srT9rB8DE/7Ouec81ZennPuQTzTW89RUrJPlyRJkq7Lfnzs0u65
PNPT5macc97K0/aqfGxP+/rnnPNWXp5z7ke8L289d0nJPl2SJEn68ezHxy7t
3sr78rS5Geect/K0vSof29O+/jnnPM3Lc869iWd663lMSm335jn79N/+nsmf
1j4uv/6y5utEkiRpkPae90bdj9ub3y7t3sozPW0OxjnnaZ62V+VzetqfC845
T/PynHPP4pneek6T3mz79Jdrn5a3bx57WH6bt9Z8zSVJkvTj7T2/jbofr/ma
91jaPZRnetpci3PO0zxtT8q5vTnnnNub8zreeq6T3qj79C23T5ckSWrb1nls
77nOfnzs0u6VvC9Pm2txznmap+1JObdP55xz+3Te1lvPgdJru0+/f8++d+66
9Tq8Xnv/dD579/Tv98rXjyRJ0lN7z0t19uM559ia70WPpd0TeV+eNqfinPM0
T9t7cm5vzjnn9um8L289N0ovbQ551ueM/B54SZKk2/k96re95nvRY2n3Pt6X
p82dOOe8F0/be3Jun8455zlennPufbwvbz1nSi9tbnn1Pn3vnl2SJKn3Zvs9
6vbjx0q7x/G+PG2OxDnnvXjaHpNze3POOc/38pxzH+RjeOu5VHppc85z57f3
f279xdrn5fnaw/Lt62MffF1JkqTT2nveqLMHtx/vvbR7GR/D0+ZInHPei6ft
MTm3N+ec8369POfcE/kY3nqOlV7aXPTqPbu/b12SJJ1V5t8nnr8Htx8/Vto9
i4/haXMhzjnv3dP2mJwneNqfU845793Lc869ko/hredevZY2Xz13nuzvW5ck
Sd+X+feJ5+/Ha75HI5V2b+JjeNqch3POe/e0vSTnyZ7255dzzkf18pxzD+Vj
eOs5Wa+lzWmv3rOf9bl1e3ZJkup31h7c58SL13zvRirtHsTH8LS5Deecj+pp
e0nOe/S0P9ecc967l+ec+ykf21vP1Xotba579T796j27v4ddkqTvO+vvDfc5
8dte8z0dqbR7DR/b0+Y2nHPeu6ftGTkfydP+vHPO+ahennPurXxsbz2HG620
+bA9uyRJ9bMHr+M139MZSrun8LE9bQ7DOeejetqekfMZPO37AOecj+rlOeee
y+f01vO8XkubM4+6Z/d74yVJV9TX70Xvdw9uP35uafcIPqenzVU453xUT9sb
cj6zp31/4Jzz2bw859yL+Zzeei44Wmnz6tn27K/X3j+dd989/ed45etckjpr
6/u5PXhbr/k1MENp9wI+p6fNSTjnfDZP2xtyzu3TOec8zctzzj2az+mt54iz
lDYP733P7vfJS1JmV//+c3vwY17za2Dm0s75fE5Pm3twzvlsnrYH5Jzbp3PO
ee9ennPu3XxObz13nKW0uXove/az9u973y/7d0mjdtb3t8x993h7cPvxtqWd
2/mcnjbH4Jzz2Txtr8c5tzfnnPPZvDzn3NM5t2evX9p8frY9+1n7d3/Pu6Sz
Ouv7SV+f+7YH17mlnas5tx/nnPN8T9vrcc7t0znnnBcvzzn3es7t03NKm//b
v5+7l9/al/lcvJTT1p/Hq//+bvvuTK/5tafvSzsnc24/zjnn+Z62p+Oc53ja
9yvOOee3vTznzAE4t2fPL22/MOqevZe9/FZ79/Wvf37s4++v+xVfu9JvbX29
nbW/3mrsvbY9+Jaf+9WrvbU6r3JuP8455/N42p6Oc57vad/HOOec3/bynDM3
4Nw+vd/S9heZnrbPqr+XP2tfv7etfejevf+W//av+2nt4/LrL2ub/7229rmv
194/3a/ePb1Pr7b/ORv/+3v/7xO2/vPvfR32vs7738l9tfp6TvtzfdvTvk/m
+NVfnzrWWedJzu3HOeecb3na3o1z3q+nfX/jnHN+zMtzzpyBc3v2eUrbm2R6
2t5tvD0+78vTvm7reNr3pRxv/XNM+7r6HMi5/TjnnPO9nrZ345yP52nf9zjn
nB/z8pwzl+DcPl1p+5qxPW1vyHmCp/05Hc9b/5zROW2dxzjv0dPu6Zxzzo95
2h6Nc87Tvk9yzjk/5uU5Z47BuT279pa2J+I/4mn7U17H074O+Za3/r6uayvv
c845jXP7cc4551uethfjnPMtT/v+yTnn/FwvzzlzD87t2dWqtH0W55y3/r6o
rMrXRc45inP7cc4552d52l6Mc873etr3Vc455+d6ec6Zk3Ce4K3n5eqjtL0b
59y+W5mVr5eccw7nCZ52L+acc36up+25OOf8LE/7fss557yOl+ecuQrnyd56
Hq+5Stsbcp7grf9caq7K113OOYTzZE+753LOOa/jaXsuzjm/2tO+D3POOa/j
5TlnDsN5j9563i/VKG2vyo95668jqUZp5wTOe/S0eyvnnPM6nra34pzzNE/7
vs0557yOl+ecuQ3nI3nrfYIkST2V9nOc85E87R7KOee8jqftoTjnvBdP+37O
Oec808tzzvyH8xm89R5DkqRbpf3c5HwGT7sncs45z/S0PRTnnPfuad/nOeec
Z3p5zpkjcT6zt96fSJL6Lu3nGucze9q9j3POeaan7ZU453w2T/u5wDnnPNPL
c87ciXNu/y5Jo5b2c4Rzbj/OOef8XE/bE3HOOS+e9vOCc875GF6ec+ZXnHN7
eUk6q7Tvw5xze3DOOed9edqeiHPO+W1P+znCOed8DC/POXMwznm+t96PSeqv
tO9jnPN8T7s3cc45H8PT9j6cc87P9bSfO5xzzsfw8pwzN+Ocz+Ot93vSjKV9
H+Ccz+Np9yDOOedjeNoeh3POeVtP+znFOed8bC/POfM3zjm/2lvvOdVHaV+3
nHN+tafdUzjnnI/taXsZzjnnmZ7284tzzvmcXp5z5nicc84555xz+3HOOedj
eNpehnPOeV+e9nONc845/7OX55x5IOecc8455zN42r2Ac845/7On7Vk455yP
7Wk/BznnnPMf8fKcM2/knHPOOec8wdPO7ZxzzvmPeNrehHPOObdP55xz3ruX
55y5Jeecc84551d42jmcc845/xFP24Nwzjnn9uacc8558fKcM//knHPOOedz
eto5mXPOOb/C0/YgnHPOuX0655xzfszLc858lXPOOeecZ3raOZZzzjmv6Wl7
Dc4559w+nXPOOW/r5Tlnfss555xzzo952jmTc845T/C0PQXnnHOe7Gk/xznn
nPNkL88582HOOeec81E97RzIOeecJ3va3oFzzjkfydN+7nPOOec9ennOmT9z
zjnnnLfytHMa55xz3qOn7RE455zzGTztPMA555zP7OU5Z+7NOeec83k87VzE
Oeecz+xpewTOOed8Zk87J3DOOef8ey/POfN2zjnnnOd42rmFc84559972l6A
c8455/bpnHPO+cxennPm/JxzzvnMnnZO4Jxzzvn9njbn55xzzrl9Ouecc87v
9/Kcs1/gnHPOkz3t5zjnnHPOr/O0uT3nnHPOczzt3MI555zzHC/POXsNzjnn
/M+e9nOTc8455zmeNofnnHPOeb+eds7hnHPO+XhennP2L5xzzs/1tJ87nHPO
OR/P0+bqnHPOOZ/H085FnHPOOedbXp5z9kecc57mad+3Oeecc863PG1Ozjnn
nHO+5WnnKM4555zzq7085+y/OOfjedr3Pc4555zzqz1t7s0555xzfpannbs4
55xzzkf18pyz7+O8R0/7c80555xzPqqnzbE555xzzlt52jmNc84555y39fKc
sz/l9s6cc8455/x+T5tLc84555z34mnnOs4555xzzjnnnHPOOee3PW3OzDnn
nHM+qqedAznnnHPOOeecc84553w2T5sbc84555zz4mnnRs4555xzzjnnnHPO
Oe/d0+bAnHPOOef8mKedMznnnHPOOeecc8455zzN0+a6nHPOOee8jqedSznn
nHPOOeecc8455/xqT5vTcs4555zzTE87x3LOOeecc84555xzzvleT5u7cs45
55zzMTzt3Ms555xzzjnnnHPOOedpc1TOOeeccz6np52TOeecc84555xzzjnn
43naXJRzzjnnnHP7dM4555xzzjnnnHPO+RWeNufknHPOOefcnp1zzjnnnHPO
Oeecc36Pp80hOeecc84579HTzvmcc84555xzzjnnnPPvPW2uyDnnnHPO+Qye
di/gnHPOOeecc84553wGT5sTcs4555xzzu3TOeecc84555xzzjm/wtPmfpxz
zjnnnHN7ds4555xzzjnnnHPO7/G0uRznnHPOOec839PuNZxzzjnnnHPOOeec
/4inzdk455xzzjnn43naPYhzzjnnnHPOOeecz+lpczPOOeecc8453/K0+xTn
nHPOOeecc845z/S0uRbnnHPOOeecX+1p9zLOOeecc84555xzXsfT5lScc845
55xznuZp9zjOOeecc84555xzfszT5k6cc84555xzPqqn3Qc555xzzjnnnHPO
R/W0uRDnnHPOOeec89uedq/knHPOOeecc84578XT5jycc84555xzzut42v2U
c84555xzzjnn/CxPm8NwzjnnnHPOOe/L0+65nHPOOeecc84551ueNlfhnHPO
Oeeccz6np92XOeecc84555xz3q+nzT0455xzzjnnnPMrPO0+zjnnnHPOOeec
8+s8bS7BOeecc84555wne9q9nnPOOeecc8455z/uaXMGzjnnnHPOOed8Bk+b
D3DOOeecc8455yN52hyAc84555xzzjnn93va/IFzzjnnnHPOOa/pafd0zjnn
nHPOOeec53vafINzzjnnnHPOOf+zp92jOeecc84555xzPo+nzUk455xzzjnn
nI/tafdizjnnnHPOOeec872eNm/hnHPOOeecc97W0+6tnHPOOeecc84552me
Ns/hnHPOOeecc37b0+6VnHPOOeecc84557N52ryIc84555xzznv3tHsf55xz
zjnnnHPOOa/jaXMqzjnnnHPOOd/rafcszjnnnHPOOeeccz62p83HOOecc845
5+N52j2Ic84555xzzjnnnPN7PG3+xjnnnHPOOa/vafcUzjnnnHPOOeecc857
9LS5H+ecc8455zN42r2Ac84555xzzjnnnHP+4542b+Scc8455zzB087tnHPO
Oeecc84555zzfE+bc3LOOeec8zk97ZzMOeecc84555xzzjnnez1t7so555xz
zut42rmUc84555xzzjnnnHPOe/e0OTDnnHPO+aiedg7knHPOOeecc84555xz
fq6nzaU555xzzs/ytHMX55xzzjnnnHPOOeec87E9bU7OOeec83497ZzDOeec
c84555xzzjnnnCd42jyfc845n9nTzgmcc84555xzzjnnnHPOOb/f0/YRnHPO
ub0255xzzjnnnHPOOeecc85n8LQ9C+ec83M97ecO55xzzjnnnHPOOeecc845
v+1p+ybOOd/rad9XOeecc84555xzzjnnnHPOOb/C0/Z0nM/gad8HOOecc845
55xzzjnnnHPOOeecc84555xzzjnnfK//XzIo/fo=
     "], "Real", ColorSpace -> Automatic, Interleaving -> True, Magnification -> 
     1], $CellContext`oldbail1$$ = 64, $CellContext`oldbail2$$ = 
    64, $CellContext`oldres1$$ = 1, $CellContext`oldres2$$ = 
    1, $CellContext`p1$$ = {0., 0.}, $CellContext`p2$$ = {0., 
    0.}, $CellContext`r1$$ = 2., $CellContext`r2$$ = 2., $CellContext`res$$ = 
    1, $CellContext`show1$$ = True, $CellContext`show2$$ = 
    True, $CellContext`z$$ = {0., 0.}, $CellContext`zoom1$$ = 
    0, $CellContext`zoom2$$ = 0, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`bail$$], 64, ""}, {64, 128, 256, 512, 1024}}, {{
       Hold[$CellContext`res$$], 2, ""}, {1, 2, 4, 8}}, {
      Hold[
       Row[{
         Column[{
           Column[{"Maximum iterations", 
             Manipulate`Place[1]}], 
           Column[{"Resolution", 
             Manipulate`Place[2]}], 
           Button[
           "RESET", $CellContext`p1$$ = {0., 0.}; $CellContext`p2$$ = {0., 
              0.}; $CellContext`r1$$ = 2.; $CellContext`r2$$ = 
             2.; $CellContext`c$$ = $CellContext`p1$$; $CellContext`z$$ = \
$CellContext`p2$$; $CellContext`res$$ = 2; $CellContext`bail$$ = 
             64; $CellContext`oldbail1$$ = 65; $CellContext`oldbail2$$ = 65; 
            Null]}], 
         Row[{
           Column[{
             Button[
             "Update left", $CellContext`c$$ = $CellContext`p1$$; \
$CellContext`imagine[
                
                Unevaluated[$CellContext`image1$$], $CellContext`p1$$, \
$CellContext`p2$$, $CellContext`r1$$, $CellContext`res$$, $CellContext`bail$$,
                 1], Method -> "Queued"], 
             Button[
             "Zoom in left", $CellContext`c$$ = $CellContext`p1$$; \
$CellContext`r1$$ = 0.5 $CellContext`r1$$; $CellContext`imagine[
                
                Unevaluated[$CellContext`image1$$], $CellContext`p1$$, \
$CellContext`p2$$, $CellContext`r1$$, $CellContext`res$$, $CellContext`bail$$,
                 1], Method -> "Queued"], 
             Button[
             "Zoom out left", $CellContext`c$$ = $CellContext`p1$$; \
$CellContext`r1$$ = 2. $CellContext`r1$$; $CellContext`imagine[
                
                Unevaluated[$CellContext`image1$$], $CellContext`p1$$, \
$CellContext`p2$$, $CellContext`r1$$, $CellContext`res$$, $CellContext`bail$$,
                 1], Method -> "Queued"], 
             Row[{"Show axes and arrows\t", 
               Checkbox[
                Dynamic[$CellContext`show1$$]]}]}], 
           Column[{
             Row[{"A = ", 
               Pane[
                Dynamic[
                 Part[$CellContext`p1$$, 1]], 60]}], 
             Row[{"B = ", 
               Pane[
                Dynamic[
                 Part[$CellContext`p1$$, 2]], 60]}], 
             Row[{"Zoom = ", 
               Pane[
                Dynamic[
                 ScientificForm[2/$CellContext`r1$$, 2]], 50]}]}]}, " "], 
         Row[{
           Column[{
             Button[
             "Update right", $CellContext`z$$ = $CellContext`p2$$; \
$CellContext`imagine[
                
                Unevaluated[$CellContext`image2$$], $CellContext`p2$$, \
$CellContext`p1$$, $CellContext`r2$$, $CellContext`res$$, $CellContext`bail$$,
                 2], Method -> "Queued"], 
             Button[
             "Zoom in right", $CellContext`z$$ = $CellContext`p2$$; \
$CellContext`r2$$ = 0.5 $CellContext`r2$$; $CellContext`imagine[
                
                Unevaluated[$CellContext`image2$$], $CellContext`p2$$, \
$CellContext`p1$$, $CellContext`r2$$, $CellContext`res$$, $CellContext`bail$$,
                 2], Method -> "Queued"], 
             Button[
             "Zoom out right", $CellContext`z$$ = $CellContext`p2$$; \
$CellContext`r2$$ = 2. $CellContext`r2$$; $CellContext`imagine[
                
                Unevaluated[$CellContext`image2$$], $CellContext`p2$$, \
$CellContext`p1$$, $CellContext`r2$$, $CellContext`res$$, $CellContext`bail$$,
                 2], Method -> "Queued"], 
             Row[{"Show axes and arrows\t", 
               Checkbox[
                Dynamic[$CellContext`show2$$]]}]}], 
           Column[{
             Row[{"X = ", 
               Pane[
                Dynamic[
                 Part[$CellContext`p2$$, 1]], 60]}], 
             Row[{"Y = ", 
               Pane[
                Dynamic[
                 Part[$CellContext`p2$$, 2]], 60]}], 
             Row[{"Zoom = ", 
               Pane[
                NumberForm[
                 Dynamic[2/$CellContext`r2$$], 4], 50]}]}]}, " "]}, "   "]], 
      Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`res$$], 2}}, {{
       Hold[$CellContext`bail$$], 64}}, {{
       Hold[$CellContext`p1$$], {0., 0.}}}, {{
       Hold[$CellContext`p2$$], {0., 0.}}}, {{
       Hold[$CellContext`zoom1$$], 0}}, {{
       Hold[$CellContext`zoom2$$], 0}}, {{
       Hold[$CellContext`show1$$], True}}, {{
       Hold[$CellContext`show2$$], True}}, {{
       Hold[$CellContext`oldbail1$$], 64}}, {{
       Hold[$CellContext`oldbail2$$], 64}}, {{
       Hold[$CellContext`oldres1$$], 0}}, {{
       Hold[$CellContext`oldres2$$], 0}}, {
      Hold[$CellContext`image1$$]}, {
      Hold[$CellContext`image2$$]}, {{
       Hold[$CellContext`c$$], {0., 0.}}}, {{
       Hold[$CellContext`z$$], {0., 0.}}}, {{
       Hold[$CellContext`r1$$], 2.}}, {{
       Hold[$CellContext`r2$$], 2.}}}, Typeset`size$$ = {681., {175., 180.}}, 
    Typeset`update$$ = 0, Typeset`initDone$$, Typeset`skipInitDone$$ = 
    False, $CellContext`bail$367$$ = 0, $CellContext`res$368$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     2, StandardForm, 
      "Variables" :> {$CellContext`bail$$ = 
        64, $CellContext`c$$ = {0., 0.}, $CellContext`image1$$ = 
        Null, $CellContext`image2$$ = Null, $CellContext`oldbail1$$ = 
        64, $CellContext`oldbail2$$ = 64, $CellContext`oldres1$$ = 
        0, $CellContext`oldres2$$ = 
        0, $CellContext`p1$$ = {0., 0.}, $CellContext`p2$$ = {0., 
         0.}, $CellContext`r1$$ = 2., $CellContext`r2$$ = 
        2., $CellContext`res$$ = 2, $CellContext`show1$$ = 
        True, $CellContext`show2$$ = 
        True, $CellContext`z$$ = {0., 0.}, $CellContext`zoom1$$ = 
        0, $CellContext`zoom2$$ = 0}, "ControllerVariables" :> {
        Hold[$CellContext`bail$$, $CellContext`bail$367$$, 0], 
        Hold[$CellContext`res$$, $CellContext`res$368$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> Row[{
         Column[{
           Row[{
             Subscript["{z", "n+1"], " = ", 
             Subscript["z", "n"], " + A+Bi} where ", 
             Subscript["z", "1"], " is ", 
             Dynamic[
              NumberForm[
               Part[$CellContext`p2$$, 1], 4]], " + ", 
             Dynamic[
              NumberForm[
               Part[$CellContext`p2$$, 2], 4]], "i"}], If[
             
             Or[$CellContext`oldres1$$ != $CellContext`res$$, \
$CellContext`oldbail1$$ != $CellContext`bail$$], $CellContext`oldres1$$ = \
$CellContext`res$$; $CellContext`oldbail1$$ = $CellContext`bail$$; \
$CellContext`imagine[
               
               Unevaluated[$CellContext`image1$$], $CellContext`p1$$, \
$CellContext`p2$$, $CellContext`r1$$, $CellContext`res$$, $CellContext`bail$$,
                1]]; With[{$CellContext`s$ = $CellContext`res$$ First[
                 ImageDimensions[$CellContext`image1$$]]}, 
             LocatorPane[
              Dynamic[$CellContext`p1$$], 
              Graphics[{
                If[$CellContext`show1$$, {
                  $CellContext`graphVectorsJulia[
                  15, Part[$CellContext`p2$$, 1] + 
                   I Part[$CellContext`p2$$, 2], $CellContext`p1$$], White, 
                  Thick, 
                  Circle[$CellContext`p1$$, 0.02 $CellContext`r1$$], Thin, 
                  Arrow[{{0, 0}, {1.7, 0}}], 
                  Arrow[{{0, 0}, {-1.7, 0}}], 
                  Arrow[{{0, 0}, {0, -1.7}}], 
                  Arrow[{{0, 0}, {0, 1.7}}], 
                  Text[
                   Style["A", Medium], {1.5, -0.1}], 
                  Text[
                   Style["B", Medium], {-0.1, 1.5}]}], Null}, 
               PlotRange -> {
                Part[$CellContext`c$$, 
                   1] + {-$CellContext`r1$$, $CellContext`r1$$}, 
                 Part[$CellContext`c$$, 
                   2] + {-$CellContext`r1$$, $CellContext`r1$$}}, 
               ImageSize -> $CellContext`s$, Prolog -> 
               Inset[$CellContext`image1$$, $CellContext`c$$, {1, 
                  1} (($CellContext`s$ + 1)/(2 $CellContext`res$$)), 
                 Scaled[{1, 1}]]]]]}], 
         Column[{
           Row[{
             Subscript["{z", "n+1"], " = X+Yi + c} where c is ", 
             Dynamic[
              NumberForm[
               Part[$CellContext`p1$$, 1], 4]], " + ", 
             Dynamic[
              NumberForm[
               Part[$CellContext`p1$$, 2], 4]], "i"}], If[
             
             Or[$CellContext`oldres2$$ != $CellContext`res$$, \
$CellContext`oldbail2$$ != $CellContext`bail$$], $CellContext`oldres2$$ = \
$CellContext`res$$; $CellContext`oldbail2$$ = $CellContext`bail$$; \
$CellContext`imagine[
               
               Unevaluated[$CellContext`image2$$], $CellContext`p2$$, \
$CellContext`p1$$, $CellContext`r2$$, $CellContext`res$$, $CellContext`bail$$,
                2]]; With[{$CellContext`s$ = $CellContext`res$$ First[
                 ImageDimensions[$CellContext`image2$$]]}, 
             LocatorPane[
              Dynamic[$CellContext`p2$$], 
              Graphics[{
                If[$CellContext`show2$$, {
                  $CellContext`graphVectorsMan[
                  15, $CellContext`p1$$, Part[$CellContext`p2$$, 1] + 
                   I Part[$CellContext`p2$$, 2]], White, Thick, 
                  Circle[$CellContext`p2$$, 0.02 $CellContext`r2$$], Thin, 
                  Arrow[{{0, 0}, {1.7, 0}}], 
                  Arrow[{{0, 0}, {-1.7, 0}}], 
                  Arrow[{{0, 0}, {0, -1.7}}], 
                  Arrow[{{0, 0}, {0, 1.7}}], 
                  Text[
                   Style["X", Medium], {1.5, -0.1}], 
                  Text[
                   Style["Y", Medium], {-0.1, 1.5}]}], Null}, 
               PlotRange -> {
                Part[$CellContext`z$$, 
                   1] + {-$CellContext`r2$$, $CellContext`r2$$}, 
                 Part[$CellContext`z$$, 
                   2] + {-$CellContext`r2$$, $CellContext`r2$$}}, 
               ImageSize -> $CellContext`s$, Prolog -> 
               Inset[$CellContext`image2$$, $CellContext`z$$, {1, 
                  1} (($CellContext`s$ + 1)/(2 $CellContext`res$$)), 
                 Scaled[{1, 1}]]]]]}]}], 
      "Specifications" :> {{{$CellContext`bail$$, 64, ""}, {64, 128, 256, 512,
          1024}, ControlPlacement -> 1}, {{$CellContext`res$$, 2, ""}, {1, 2, 
         4, 8}, ControlPlacement -> 2}, 
        Row[{
          Column[{
            Column[{"Maximum iterations", 
              Manipulate`Place[1]}], 
            Column[{"Resolution", 
              Manipulate`Place[2]}], 
            Button[
            "RESET", $CellContext`p1$$ = {0., 0.}; $CellContext`p2$$ = {0., 
               0.}; $CellContext`r1$$ = 2.; $CellContext`r2$$ = 
              2.; $CellContext`c$$ = $CellContext`p1$$; $CellContext`z$$ = \
$CellContext`p2$$; $CellContext`res$$ = 2; $CellContext`bail$$ = 
              64; $CellContext`oldbail1$$ = 65; $CellContext`oldbail2$$ = 65; 
             Null]}], 
          Row[{
            Column[{
              Button[
              "Update left", $CellContext`c$$ = $CellContext`p1$$; \
$CellContext`imagine[
                 
                 Unevaluated[$CellContext`image1$$], $CellContext`p1$$, \
$CellContext`p2$$, $CellContext`r1$$, $CellContext`res$$, $CellContext`bail$$,
                  1], Method -> "Queued"], 
              Button[
              "Zoom in left", $CellContext`c$$ = $CellContext`p1$$; \
$CellContext`r1$$ = 0.5 $CellContext`r1$$; $CellContext`imagine[
                 
                 Unevaluated[$CellContext`image1$$], $CellContext`p1$$, \
$CellContext`p2$$, $CellContext`r1$$, $CellContext`res$$, $CellContext`bail$$,
                  1], Method -> "Queued"], 
              Button[
              "Zoom out left", $CellContext`c$$ = $CellContext`p1$$; \
$CellContext`r1$$ = 2. $CellContext`r1$$; $CellContext`imagine[
                 
                 Unevaluated[$CellContext`image1$$], $CellContext`p1$$, \
$CellContext`p2$$, $CellContext`r1$$, $CellContext`res$$, $CellContext`bail$$,
                  1], Method -> "Queued"], 
              Row[{"Show axes and arrows\t", 
                Checkbox[
                 Dynamic[$CellContext`show1$$]]}]}], 
            Column[{
              Row[{"A = ", 
                Pane[
                 Dynamic[
                  Part[$CellContext`p1$$, 1]], 60]}], 
              Row[{"B = ", 
                Pane[
                 Dynamic[
                  Part[$CellContext`p1$$, 2]], 60]}], 
              Row[{"Zoom = ", 
                Pane[
                 Dynamic[
                  ScientificForm[2/$CellContext`r1$$, 2]], 50]}]}]}, " "], 
          Row[{
            Column[{
              Button[
              "Update right", $CellContext`z$$ = $CellContext`p2$$; \
$CellContext`imagine[
                 
                 Unevaluated[$CellContext`image2$$], $CellContext`p2$$, \
$CellContext`p1$$, $CellContext`r2$$, $CellContext`res$$, $CellContext`bail$$,
                  2], Method -> "Queued"], 
              Button[
              "Zoom in right", $CellContext`z$$ = $CellContext`p2$$; \
$CellContext`r2$$ = 0.5 $CellContext`r2$$; $CellContext`imagine[
                 
                 Unevaluated[$CellContext`image2$$], $CellContext`p2$$, \
$CellContext`p1$$, $CellContext`r2$$, $CellContext`res$$, $CellContext`bail$$,
                  2], Method -> "Queued"], 
              Button[
              "Zoom out right", $CellContext`z$$ = $CellContext`p2$$; \
$CellContext`r2$$ = 2. $CellContext`r2$$; $CellContext`imagine[
                 
                 Unevaluated[$CellContext`image2$$], $CellContext`p2$$, \
$CellContext`p1$$, $CellContext`r2$$, $CellContext`res$$, $CellContext`bail$$,
                  2], Method -> "Queued"], 
              Row[{"Show axes and arrows\t", 
                Checkbox[
                 Dynamic[$CellContext`show2$$]]}]}], 
            Column[{
              Row[{"X = ", 
                Pane[
                 Dynamic[
                  Part[$CellContext`p2$$, 1]], 60]}], 
              Row[{"Y = ", 
                Pane[
                 Dynamic[
                  Part[$CellContext`p2$$, 2]], 60]}], 
              Row[{"Zoom = ", 
                Pane[
                 NumberForm[
                  Dynamic[2/$CellContext`r2$$], 4], 50]}]}]}, " "]}, 
         "   "], {{$CellContext`res$$, 2}, ControlType -> 
         None}, {{$CellContext`bail$$, 64}, ControlType -> 
         None}, {{$CellContext`p1$$, {0., 0.}}, ControlType -> 
         None}, {{$CellContext`p2$$, {0., 0.}}, ControlType -> 
         None}, {{$CellContext`zoom1$$, 0}, ControlType -> 
         None}, {{$CellContext`zoom2$$, 0}, ControlType -> 
         None}, {{$CellContext`show1$$, True}, ControlType -> 
         None}, {{$CellContext`show2$$, True}, ControlType -> 
         None}, {{$CellContext`oldbail1$$, 64}, ControlType -> 
         None}, {{$CellContext`oldbail2$$, 64}, ControlType -> 
         None}, {{$CellContext`oldres1$$, 0}, ControlType -> 
         None}, {{$CellContext`oldres2$$, 0}, ControlType -> 
         None}, {$CellContext`image1$$, ControlType -> 
         None}, {$CellContext`image2$$, ControlType -> 
         None}, {{$CellContext`c$$, {0., 0.}}, ControlType -> 
         None}, {{$CellContext`z$$, {0., 0.}}, ControlType -> 
         None}, {{$CellContext`r1$$, 2.}, ControlType -> 
         None}, {{$CellContext`r2$$, 2.}, ControlType -> None}}, 
      "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{732., {261., 266.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    Initialization:>({
      Attributes[Subscript] = {NHoldRest}, $CellContext`imagine[
         Pattern[$CellContext`image, 
          Blank[]], 
         Pattern[$CellContext`p1, 
          Blank[]], 
         Pattern[$CellContext`p2, 
          Blank[]], 
         Pattern[$CellContext`r, 
          Blank[]], 
         Pattern[$CellContext`res, 
          Blank[]], 
         Pattern[$CellContext`bail, 
          Blank[]], 
         Pattern[$CellContext`type, 
          Blank[]]] := ($CellContext`time = First[
          
          AbsoluteTiming[$CellContext`progress = 0; 
           Module[{$CellContext`s = 333, $CellContext`f}, $CellContext`f := 
              Switch[$CellContext`type, 1, $CellContext`mandelbrot, 
                2, $CellContext`juliaset]; $CellContext`image = Image[
                
                MapIndexed[($CellContext`progress = $CellContext`res (
                    Part[#2, 1]/$CellContext`s); 
                 Map[$CellContext`f[#, Part[$CellContext`p2, 1] + 
                    I Part[$CellContext`p2, 2], $CellContext`bail]& , #])& , 
                 $CellContext`pixels[$CellContext`p1 - $CellContext`r, \
$CellContext`p1 + $CellContext`r, {$CellContext`s/$CellContext`res, \
$CellContext`s/$CellContext`res}]], 
                Magnification -> $CellContext`res]]]]), \
$CellContext`mandelbrot = CompiledFunction[{8, 9., 5468}, {{
           Blank[Real], 1}, 
          Blank[Complex], 
          Blank[Integer]}, {{3, 1, 0}, {4, 0, 0}, {2, 0, 0}, {3, 1, 
         20}}, {{{24, 82, 177}, {2, 1, 8}}, {1, {2, 0, 2}}, {{9, 1, 47}, {2, 
          1, 4}}, {11, {2, 0, 14}}, {{255, 170, 0}, {2, 1, 14}}, {
          13, {2, 0, 16}}, {{4, 4, 73}, {2, 1, 5}}, {12, {2, 0, 15}}, {
          7., {3, 0, 3}}, {15, {2, 0, 18}}, {{12, 44, 128}, {2, 1, 7}}, {{248,
           201, 95}, {2, 1, 13}}, {0. + 1. I, {4, 0, 1}}, {6, {2, 0, 9}}, {
          10, {2, 0, 13}}, {{153, 87, 0}, {2, 1, 16}}, {2, {2, 0, 3}}, {{204, 
          128, 0}, {2, 1, 15}}, {5, {2, 0, 8}}, {{0., 0., 0.}, {3, 1, 1}}, {
          8, {2, 0, 11}}, {7, {2, 0, 10}}, {9, {2, 0, 12}}, {{241, 233, 
          191}, {2, 1, 12}}, {{0, 0, 0}, {2, 1, 2}}, {14, {2, 0, 17}}, {
          False, {1, 0, 2}}, {0.00392156862745098, {3, 0, 4}}, {
          4, {2, 0, 4}}, {0., {3, 0, 2}}, {{106, 52, 3}, {2, 1, 17}}, {
          0, {2, 0, 1}}, {16, {2, 0, 6}}, {3, {2, 0, 7}}, {{25, 7, 26}, {2, 1,
           3}}, {{134, 181, 229}, {2, 1, 10}}, {{211, 236, 248}, {2, 1, 
          11}}, {{57, 125, 209}, {2, 1, 9}}, {{0, 7, 100}, {2, 1, 6}}}, {18, 
         21, 5, 5, 
         21}, {{6, 1, 5}, {38, 0, 0, 2, 0, 1}, {38, 0, 0, 3, 0, 0}, {11, 0, 2,
           3}, {17, 1, 3, 2}, {11, 1, 2, 3}, {14, 3, 2, 3}, {8, 0, 2}, {25, 5,
           0, 3}, {2, 3, 6}, {40, 38, 4, 0, 2, 3, 0, 1}, {10, 4, 0}, {27, 3, 
          3, 1, 0, 0}, {5, 0, 1}, {3, 2}, {5, 2, 1}, {2, 1, 8}, {6, 5, 19}, {
          12, 19, 2, 20}, {6, 20, 5}, {40, 56, 4, 0, 2, 4, 0, 4}, {14, 4, 3, 
          4}, {8, 4, 2}, {3, -15}, {24, 5, 0, 1}, {2, 1, 3}, {
          42, "CopyTensor", 3, 1, 1, 3, 1, 20}, {3, 99}, {41, 261, 2, 0, 5, 2,
           0, 4, 2, 0, 19}, {24, 19, 1, 3}, {2, 3, 3}, {
          42, "CopyTensor", 2, 1, 2, 2, 1, 20}, {3, 92}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 2, 0}, {2, 0, 3}, {
          42, "CopyTensor", 2, 1, 3, 2, 1, 18}, {3, 86}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 3, 4}, {2, 4, 3}, {
          42, "CopyTensor", 2, 1, 4, 2, 1, 20}, {3, 80}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 7, 5}, {2, 5, 3}, {
          42, "CopyTensor", 2, 1, 5, 2, 1, 18}, {3, 74}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 4, 6}, {2, 6, 3}, {
          42, "CopyTensor", 2, 1, 6, 2, 1, 20}, {3, 68}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 8, 7}, {2, 7, 3}, {
          42, "CopyTensor", 2, 1, 7, 2, 1, 18}, {3, 62}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 9, 8}, {2, 8, 3}, {
          42, "CopyTensor", 2, 1, 8, 2, 1, 20}, {3, 56}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 10, 9}, {2, 9, 3}, {
          42, "CopyTensor", 2, 1, 9, 2, 1, 18}, {3, 50}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 11, 10}, {2, 10, 3}, {
          42, "CopyTensor", 2, 1, 10, 2, 1, 20}, {3, 44}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 12, 11}, {2, 11, 3}, {
          42, "CopyTensor", 2, 1, 11, 2, 1, 18}, {3, 38}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 13, 12}, {2, 12, 3}, {
          42, "CopyTensor", 2, 1, 12, 2, 1, 20}, {3, 32}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 14, 13}, {2, 13, 3}, {
          42, "CopyTensor", 2, 1, 13, 2, 1, 18}, {3, 26}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 15, 14}, {2, 14, 3}, {
          42, "CopyTensor", 2, 1, 14, 2, 1, 20}, {3, 20}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 16, 15}, {2, 15, 3}, {
          42, "CopyTensor", 2, 1, 15, 2, 1, 18}, {3, 14}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 17, 16}, {2, 16, 3}, {
          42, "CopyTensor", 2, 1, 16, 2, 1, 20}, {3, 8}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 18, 17}, {2, 17, 3}, {
          42, "CopyTensor", 2, 1, 17, 2, 1, 18}, {3, 2}, {
          42, "CopyTensor", 2, 1, 2, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {41, 259, 3, 0, 4, 2, 1, 20, 
          3, 1, 18}, {42, "CopyTensor", 3, 1, 18, 3, 1, 20}, {1}}, 
         Function[{$CellContext`p, $CellContext`p2, $CellContext`bail}, 
          
          Module[{$CellContext`i = 0, $CellContext`c0 = 
            Part[$CellContext`p, 1] + 
             I Part[$CellContext`p, 2], $CellContext`z = $CellContext`p2}, 
           While[
             And[$CellContext`i < $CellContext`bail, Abs[$CellContext`z] < 4],
              Increment[$CellContext`i]; $CellContext`z = $CellContext`z^2 + \
$CellContext`c0; Null]; 
           If[$CellContext`i == $CellContext`bail, {0., 0., 0.}, 
             If[Mod[$CellContext`i, 4] == 0, {0, 0, 0}, 
               If[Mod[$CellContext`i, 16] == 1, {25, 7, 26}, 
                If[Mod[$CellContext`i, 16] == 2, {9, 1, 47}, 
                 If[Mod[$CellContext`i, 16] == 3, {4, 4, 73}, 
                  If[Mod[$CellContext`i, 16] == 4, {0, 7, 100}, 
                   If[Mod[$CellContext`i, 16] == 5, {12, 44, 128}, 
                    If[Mod[$CellContext`i, 16] == 6, {24, 82, 177}, 
                    If[Mod[$CellContext`i, 16] == 7, {57, 125, 209}, 
                    If[Mod[$CellContext`i, 16] == 8, {134, 181, 229}, 
                    If[Mod[$CellContext`i, 16] == 9, {211, 236, 248}, 
                    If[Mod[$CellContext`i, 16] == 10, {241, 233, 191}, 
                    If[Mod[$CellContext`i, 16] == 11, {248, 201, 95}, 
                    If[Mod[$CellContext`i, 16] == 12, {255, 170, 0}, 
                    If[Mod[$CellContext`i, 16] == 13, {204, 128, 0}, 
                    If[Mod[$CellContext`i, 16] == 14, {153, 87, 0}, 
                    If[Mod[$CellContext`i, 16] == 15, {106, 52, 3}, {0, 0, 
                    0}]]]]]]]]]]]]]]]] 0.00392156862745098]]], 
         Evaluate], $CellContext`juliaset = CompiledFunction[{8, 9., 5468}, {{
           Blank[Real], 1}, 
          Blank[Complex], 
          Blank[Integer]}, {{3, 1, 0}, {4, 0, 0}, {2, 0, 0}, {3, 1, 
         20}}, {{{24, 82, 177}, {2, 1, 8}}, {1, {2, 0, 2}}, {{9, 1, 47}, {2, 
          1, 4}}, {11, {2, 0, 14}}, {{255, 170, 0}, {2, 1, 14}}, {
          13, {2, 0, 16}}, {{4, 4, 73}, {2, 1, 5}}, {12, {2, 0, 15}}, {
          7., {3, 0, 3}}, {15, {2, 0, 18}}, {{12, 44, 128}, {2, 1, 7}}, {{248,
           201, 95}, {2, 1, 13}}, {0. + 1. I, {4, 0, 2}}, {6, {2, 0, 9}}, {
          10, {2, 0, 13}}, {{153, 87, 0}, {2, 1, 16}}, {2, {2, 0, 3}}, {{204, 
          128, 0}, {2, 1, 15}}, {5, {2, 0, 8}}, {{0., 0., 0.}, {3, 1, 1}}, {
          8, {2, 0, 11}}, {7, {2, 0, 10}}, {9, {2, 0, 12}}, {{241, 233, 
          191}, {2, 1, 12}}, {{0, 0, 0}, {2, 1, 2}}, {14, {2, 0, 17}}, {
          False, {1, 0, 2}}, {0.00392156862745098, {3, 0, 4}}, {
          4, {2, 0, 4}}, {0., {3, 0, 2}}, {{106, 52, 3}, {2, 1, 17}}, {
          0, {2, 0, 1}}, {16, {2, 0, 6}}, {3, {2, 0, 7}}, {{25, 7, 26}, {2, 1,
           3}}, {{134, 181, 229}, {2, 1, 10}}, {{211, 236, 248}, {2, 1, 
          11}}, {{57, 125, 209}, {2, 1, 9}}, {{0, 7, 100}, {2, 1, 6}}}, {18, 
         21, 5, 5, 
         21}, {{6, 1, 5}, {8, 0, 3}, {38, 0, 0, 2, 0, 1}, {38, 0, 0, 3, 0, 
          0}, {11, 0, 2, 1}, {17, 2, 1, 4}, {11, 1, 2, 1}, {14, 1, 4, 1}, {25,
           5, 0, 3}, {2, 3, 6}, {40, 38, 4, 0, 1, 3, 0, 1}, {10, 4, 0}, {27, 
          3, 3, 1, 0, 0}, {5, 0, 1}, {3, 2}, {5, 2, 1}, {2, 1, 8}, {6, 5, 
          19}, {12, 19, 2, 20}, {6, 20, 5}, {40, 56, 4, 0, 1, 4, 0, 4}, {14, 
          4, 3, 4}, {8, 4, 1}, {3, -15}, {24, 5, 0, 1}, {2, 1, 3}, {
          42, "CopyTensor", 3, 1, 1, 3, 1, 20}, {3, 99}, {41, 261, 2, 0, 5, 2,
           0, 4, 2, 0, 19}, {24, 19, 1, 3}, {2, 3, 3}, {
          42, "CopyTensor", 2, 1, 2, 2, 1, 20}, {3, 92}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 2, 0}, {2, 0, 3}, {
          42, "CopyTensor", 2, 1, 3, 2, 1, 18}, {3, 86}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 3, 4}, {2, 4, 3}, {
          42, "CopyTensor", 2, 1, 4, 2, 1, 20}, {3, 80}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 7, 5}, {2, 5, 3}, {
          42, "CopyTensor", 2, 1, 5, 2, 1, 18}, {3, 74}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 4, 6}, {2, 6, 3}, {
          42, "CopyTensor", 2, 1, 6, 2, 1, 20}, {3, 68}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 8, 7}, {2, 7, 3}, {
          42, "CopyTensor", 2, 1, 7, 2, 1, 18}, {3, 62}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 9, 8}, {2, 8, 3}, {
          42, "CopyTensor", 2, 1, 8, 2, 1, 20}, {3, 56}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 10, 9}, {2, 9, 3}, {
          42, "CopyTensor", 2, 1, 9, 2, 1, 18}, {3, 50}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 11, 10}, {2, 10, 3}, {
          42, "CopyTensor", 2, 1, 10, 2, 1, 20}, {3, 44}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 12, 11}, {2, 11, 3}, {
          42, "CopyTensor", 2, 1, 11, 2, 1, 18}, {3, 38}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 13, 12}, {2, 12, 3}, {
          42, "CopyTensor", 2, 1, 12, 2, 1, 20}, {3, 32}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 14, 13}, {2, 13, 3}, {
          42, "CopyTensor", 2, 1, 13, 2, 1, 18}, {3, 26}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 15, 14}, {2, 14, 3}, {
          42, "CopyTensor", 2, 1, 14, 2, 1, 20}, {3, 20}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 16, 15}, {2, 15, 3}, {
          42, "CopyTensor", 2, 1, 15, 2, 1, 18}, {3, 14}, {41, 261, 2, 0, 5, 
          2, 0, 6, 2, 0, 19}, {24, 19, 17, 16}, {2, 16, 3}, {
          42, "CopyTensor", 2, 1, 16, 2, 1, 20}, {3, 8}, {41, 261, 2, 0, 5, 2,
           0, 6, 2, 0, 19}, {24, 19, 18, 17}, {2, 17, 3}, {
          42, "CopyTensor", 2, 1, 17, 2, 1, 18}, {3, 2}, {
          42, "CopyTensor", 2, 1, 2, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {
          42, "CopyTensor", 2, 1, 20, 2, 1, 18}, {
          42, "CopyTensor", 2, 1, 18, 2, 1, 20}, {41, 259, 3, 0, 4, 2, 1, 20, 
          3, 1, 18}, {42, "CopyTensor", 3, 1, 18, 3, 1, 20}, {1}}, 
         Function[{$CellContext`p, $CellContext`p2, $CellContext`bail}, 
          
          Module[{$CellContext`i = 
            0, $CellContext`c0 = $CellContext`p2, $CellContext`z = 
            Part[$CellContext`p, 1] + I Part[$CellContext`p, 2]}, While[
             And[$CellContext`i < $CellContext`bail, Abs[$CellContext`z] < 4],
              Increment[$CellContext`i]; $CellContext`z = $CellContext`z^2 + \
$CellContext`c0; Null]; 
           If[$CellContext`i == $CellContext`bail, {0., 0., 0.}, 
             If[Mod[$CellContext`i, 4] == 0, {0, 0, 0}, 
               If[Mod[$CellContext`i, 16] == 1, {25, 7, 26}, 
                If[Mod[$CellContext`i, 16] == 2, {9, 1, 47}, 
                 If[Mod[$CellContext`i, 16] == 3, {4, 4, 73}, 
                  If[Mod[$CellContext`i, 16] == 4, {0, 7, 100}, 
                   If[Mod[$CellContext`i, 16] == 5, {12, 44, 128}, 
                    If[Mod[$CellContext`i, 16] == 6, {24, 82, 177}, 
                    If[Mod[$CellContext`i, 16] == 7, {57, 125, 209}, 
                    If[Mod[$CellContext`i, 16] == 8, {134, 181, 229}, 
                    If[Mod[$CellContext`i, 16] == 9, {211, 236, 248}, 
                    If[Mod[$CellContext`i, 16] == 10, {241, 233, 191}, 
                    If[Mod[$CellContext`i, 16] == 11, {248, 201, 95}, 
                    If[Mod[$CellContext`i, 16] == 12, {255, 170, 0}, 
                    If[Mod[$CellContext`i, 16] == 13, {204, 128, 0}, 
                    If[Mod[$CellContext`i, 16] == 14, {153, 87, 0}, 
                    If[Mod[$CellContext`i, 16] == 15, {106, 52, 3}, {0, 0, 
                    0}]]]]]]]]]]]]]]]] 0.00392156862745098]]], 
         Evaluate], $CellContext`pixels[{
          Pattern[$CellContext`xmin, 
           Blank[]], 
          Pattern[$CellContext`ymin, 
           Blank[]]}, {
          Pattern[$CellContext`xmax, 
           Blank[]], 
          Pattern[$CellContext`ymax, 
           Blank[]]}, {
          Pattern[$CellContext`width, 
           Blank[]], 
          Pattern[$CellContext`height, 
           Blank[]]}] := N[
         Table[{$CellContext`x, $CellContext`y}, {$CellContext`y, \
$CellContext`ymax, $CellContext`ymin, ($CellContext`ymin - \
$CellContext`ymax)/($CellContext`height - 
           1)}, {$CellContext`x, $CellContext`xmin, $CellContext`xmax, \
($CellContext`xmax - $CellContext`xmin)/($CellContext`width - 
           1)}]], $CellContext`graphVectorsJulia[
         Pattern[$CellContext`iter, 
          Blank[Integer]], 
         Pattern[$CellContext`c, 
          Blank[Complex]], 
         Pattern[$CellContext`z1, 
          Blank[]]] := 
       Module[{$CellContext`tmp1 = 
          Map[$CellContext`genVectorListJulia[$CellContext`iter, \
$CellContext`c, #]& , {
            Part[$CellContext`z1, 1] + I Part[$CellContext`z1, 2]}]}, 
         MapIndexed[{White, 
           Arrow[#]}& , 
          Map[Partition[
            Map[{
              Re[#], 
              Im[#]}& , #], 2, 
            1]& , $CellContext`tmp1]]], $CellContext`genVectorListJulia[
         Pattern[$CellContext`iter, 
          Blank[Integer]], 
         Pattern[$CellContext`z1, 
          Blank[Complex]], 
         Pattern[$CellContext`c, 
          Blank[]]] := 
       NestWhileList[#^2 + $CellContext`c& , $CellContext`z1, Abs[#] < 4& , 
         1, $CellContext`iter], $CellContext`graphVectorsMan[
         Pattern[$CellContext`iter, 
          Blank[Integer]], 
         Pattern[$CellContext`c, 
          Blank[]], 
         Pattern[$CellContext`z1, 
          Blank[]]] := 
       Module[{$CellContext`tmp1 = 
          Map[$CellContext`genVectorListMan[$CellContext`iter, #, \
$CellContext`z1]& , {Part[$CellContext`c, 1] + I Part[$CellContext`c, 2]}]}, 
         MapIndexed[{White, 
           Arrow[#]}& , 
          Map[Partition[
            Map[{
              Re[#], 
              Im[#]}& , #], 2, 
            1]& , $CellContext`tmp1]]], $CellContext`genVectorListMan[
         Pattern[$CellContext`iter, 
          Blank[Integer]], 
         Pattern[$CellContext`c, 
          Blank[Complex]], 
         Pattern[$CellContext`z1, 
          Blank[]]] := 
       NestWhileList[#^2 + $CellContext`c& , $CellContext`z1, Abs[#] < 4& , 
         1, $CellContext`iter]}; Typeset`initDone$$ = True),
    SynchronousInitialization->True,
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output",
 CellChangeTimes->{3.6154939853689294`*^9, 3.615495739028903*^9}]
}, Open  ]]
},
WindowSize->{1064, 1867},
WindowMargins->{{-1112, Automatic}, {Automatic, -251}},
FrontEndVersion->"9.0 for Microsoft Windows (64-bit) (November 20, 2012)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1485, 35, 51226, 1233, 3826, "Input"],
Cell[52714, 1270, 84056, 1486, 576, "Output"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature kvTMR5Q0KugOmD1haH6vhxkP *)
