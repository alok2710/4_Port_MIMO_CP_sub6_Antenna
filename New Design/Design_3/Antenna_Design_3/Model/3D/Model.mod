'# MWS Version: Version 2016.1 - Feb 26 2016 - ACIS 25.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 1 fmax = 6
'# created = '[VERSION]2016.1|25.0.2|20160226[/VERSION]


'@ use template: Antenna - Waveguide_6.cfg

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit  "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mue "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
Mesh.FPBAAvoidNonRegUnite "True"
Mesh.ConsiderSpaceForLowerMeshLimit "False"
Mesh.MinimumStepNumber "5"
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1%
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType("HF Time Domain")

'@ define material: FR-4 (lossy)

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Material
     .Reset
     .Name "FR-4 (lossy)"
     .Folder ""
.FrqType "all" 
.Type "Normal" 
.SetMaterialUnit "GHz", "mm"
.Epsilon "4.3" 
.Mue "1.0" 
.Kappa "0.0" 
.TanD "0.025" 
.TanDFreq "10.0" 
.TanDGiven "True" 
.TanDModel "ConstTanD" 
.KappaM "0.0" 
.TanDM "0.0" 
.TanDMFreq "0.0" 
.TanDMGiven "False" 
.TanDMModel "ConstKappa" 
.DispModelEps "None" 
.DispModelMue "None" 
.DispersiveFittingSchemeEps "General 1st" 
.DispersiveFittingSchemeMue "General 1st" 
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.Rho "0.0" 
.ThermalType "Normal" 
.ThermalConductivity "0.3" 
.SetActiveMaterial "all" 
.Colour "0.94", "0.82", "0.76" 
.Wireframe "False" 
.Transparency "0" 
.Create
End With

'@ new component: component1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Component.New "component1"

'@ define brick: component1:substrate

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "substrate" 
     .Component "component1" 
     .Material "FR-4 (lossy)" 
     .Xrange "-22.5", "22.5" 
     .Yrange "-22.5", "22.5" 
     .Zrange "0", "1.6" 
     .Create
End With

'@ define material: Copper (annealed)

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Material
     .Reset
     .Name "Copper (annealed)"
     .Folder ""
.FrqType "static" 
.Type "Normal" 
.SetMaterialUnit "Hz", "mm" 
.Epsilon "1" 
.Mue "1.0" 
.Kappa "5.8e+007" 
.TanD "0.0" 
.TanDFreq "0.0" 
.TanDGiven "False" 
.TanDModel "ConstTanD" 
.KappaM "0" 
.TanDM "0.0" 
.TanDMFreq "0.0" 
.TanDMGiven "False" 
.TanDMModel "ConstTanD" 
.DispModelEps "None" 
.DispModelMue "None" 
.DispersiveFittingSchemeEps "Nth Order" 
.DispersiveFittingSchemeMue "Nth Order" 
.UseGeneralDispersionEps "False" 
.UseGeneralDispersionMue "False" 
.FrqType "all" 
.Type "Lossy metal" 
.SetMaterialUnit "GHz", "mm" 
.Mue "1.0" 
.Kappa "5.8e+007" 
.Rho "8930.0" 
.ThermalType "Normal" 
.ThermalConductivity "401.0" 
.HeatCapacity "0.39" 
.MetabolicRate "0" 
.BloodFlow "0" 
.VoxelConvection "0" 
.MechanicsType "Isotropic" 
.YoungsModulus "120" 
.PoissonsRatio "0.33" 
.ThermalExpansionRate "17" 
.Colour "1", "1", "0" 
.Wireframe "False" 
.Reflection "False" 
.Allowoutline "True" 
.Transparentoutline "False" 
.Transparency "0" 
.Create
End With

'@ delete shape: component1:substrate

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Delete "component1:substrate"

'@ define brick: component1:Substrate

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "Substrate" 
     .Component "component1" 
     .Material "FR-4 (lossy)" 
     .Xrange "-27.5", "27.5" 
     .Yrange "-27.5", "27.5" 
     .Zrange "0", "1.6" 
     .Create
End With

'@ define brick: component1:Element_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "Element_1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "2.5", "27.5" 
     .Yrange "2.5", "27.5" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ pick face

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Pick.PickFaceFromId "component1:Element_1", "2"

'@ activate local coordinates

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.ActivateWCS "local"

'@ clear picks

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Pick.ClearAllPicks

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "27.5", "0.0", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "2.5", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "-3", "3", "0.0"

'@ define brick: component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "-19", "0" 
     .Yrange "0", "21" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ boolean subtract shapes: component1:Element_1, component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Subtract "component1:Element_1", "component1:solid1"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "-9.5", "3", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "9.5", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "-1", "0.0"

'@ define brick: component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "0", "9.5" 
     .Yrange "-11.5", "10.5" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ boolean add shapes: component1:Element_1, component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element_1", "component1:solid1"

'@ define cylinder: component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Cylinder 
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .OuterRadius "9.5" 
     .InnerRadius "0.0" 
     .Axis "z" 
     .Zrange "-.035", "0" 
     .Xcenter "0" 
     .Ycenter "0" 
     .Segments "0" 
     .Create 
End With

'@ boolean subtract shapes: component1:Element_1, component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Subtract "component1:Element_1", "component1:solid1"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "-9.5", "0.0"

'@ define brick: component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "0", "9.5" 
     .Yrange "-.1", "0" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ boolean subtract shapes: component1:Element_1, component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Subtract "component1:Element_1", "component1:solid1"

'@ define brick: component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "0", "9.5" 
     .Yrange "-.2", "0" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ boolean subtract shapes: component1:Element_1, component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Subtract "component1:Element_1", "component1:solid1"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "-1.8", "0.0"

'@ define brick: component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "0", "9.5" 
     .Yrange "-.2", "0" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ boolean subtract shapes: component1:Element_1, component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Subtract "component1:Element_1", "component1:solid1"

'@ activate global coordinates

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.ActivateWCS "global"

'@ transform: translate component1:Element_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Element_1" 
     .Vector "0", "-30", "0" 
     .UsePickedPoints "False" 
     .InvertPickedPoints "False" 
     .MultipleObjects "False" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Transform "Shape", "Translate" 
End With

'@ activate local coordinates

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.ActivateWCS "local"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "-30", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "-3", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "-.2", "0.0"

'@ define brick: component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-1.5", "1.5" 
     .Yrange "0", "12" 
     .Zrange "1.6", "1.635" 
     .Create
End With

'@ activate global coordinates

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.ActivateWCS "global"

'@ transform: rotate component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:solid1" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .Angle "0", "0", "180" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Rotate" 
End With

'@ transform: mirror component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:solid1" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "0", "90", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ transform: mirror component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:solid1" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "90", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ activate local coordinates

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.ActivateWCS "local"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "5", "0.0"

'@ define brick: component1:solid2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "Vacuum" 
     .Xrange "0", "9.5" 
     .Yrange "0", "1" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ boolean subtract shapes: component1:Element_1, component1:solid2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Subtract "component1:Element_1", "component1:solid2"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "19", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "0.0", "-9.5", "0.0"

'@ define brick: component1:Element

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "Element" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "0", "9.5" 
     .Yrange "0", "2" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ boolean add shapes: component1:Element, component1:Element_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element", "component1:Element_1"

'@ activate global coordinates

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.ActivateWCS "global"

'@ transform: rotate component1:Element

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Element" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .Angle "0", "0", "180" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Rotate" 
End With

'@ transform: mirror component1:Element

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Element" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "90", "0", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ transform: mirror component1:Element

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Element" 
     .Origin "Free" 
     .Center "0", "0", "0" 
     .PlaneNormal "0", "90", "0" 
     .MultipleObjects "True" 
     .GroupObjects "False" 
     .Repetitions "1" 
     .MultipleSelection "False" 
     .Destination "" 
     .Material "" 
     .Transform "Shape", "Mirror" 
End With

'@ boolean add shapes: component1:solid1, component1:solid1_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:solid1", "component1:solid1_1"

'@ boolean add shapes: component1:solid1, component1:solid1_2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:solid1", "component1:solid1_2"

'@ boolean add shapes: component1:solid1, component1:solid1_3

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:solid1", "component1:solid1_3"

'@ pick face

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Pick.PickFaceFromId "component1:solid1", "9"

'@ define port:1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
' Port constructed by macro Calculate -> Calculate port extension coefficient


With Port
  .Reset
  .PortNumber "1"
  .NumberOfModes "1"
  .AdjustPolarization False
  .PolarizationAngle "0.0"
  .ReferencePlaneDistance "0"
  .TextSize "50"
  .Coordinates "Picks"
  .Orientation "Positive"
  .PortOnBound "True"
  .ClipPickedPortToBound "False"
  .XrangeAdd "1.6*7.1", "1.6*7.1"
  .YrangeAdd "0", "0"
  .ZrangeAdd "1.6", "1.6*7.1"
  .Shield "PEC"
  .SingleEnded "False"
  .Create
End With

'@ pick face

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Pick.PickFaceFromId "component1:solid1", "15"

'@ define port:2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
' Port constructed by macro Calculate -> Calculate port extension coefficient


With Port
  .Reset
  .PortNumber "2"
  .NumberOfModes "1"
  .AdjustPolarization False
  .PolarizationAngle "0.0"
  .ReferencePlaneDistance "0"
  .TextSize "50"
  .Coordinates "Picks"
  .Orientation "Positive"
  .PortOnBound "True"
  .ClipPickedPortToBound "False"
  .XrangeAdd "1.6*7.1", "1.6*7.1"
  .YrangeAdd "0", "0"
  .ZrangeAdd "1.6", "1.6*7.1"
  .Shield "PEC"
  .SingleEnded "False"
  .Create
End With

'@ pick face

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Pick.PickFaceFromId "component1:solid1", "21"

'@ define port:3

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
' Port constructed by macro Calculate -> Calculate port extension coefficient


With Port
  .Reset
  .PortNumber "3"
  .NumberOfModes "1"
  .AdjustPolarization False
  .PolarizationAngle "0.0"
  .ReferencePlaneDistance "0"
  .TextSize "50"
  .Coordinates "Picks"
  .Orientation "Positive"
  .PortOnBound "True"
  .ClipPickedPortToBound "False"
  .XrangeAdd "1.6*7.1", "1.6*7.1"
  .YrangeAdd "0", "0"
  .ZrangeAdd "1.6", "1.6*7.1"
  .Shield "PEC"
  .SingleEnded "False"
  .Create
End With

'@ pick face

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Pick.PickFaceFromId "component1:solid1", "3"

'@ define port:4

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
' Port constructed by macro Calculate -> Calculate port extension coefficient


With Port
  .Reset
  .PortNumber "4"
  .NumberOfModes "1"
  .AdjustPolarization False
  .PolarizationAngle "0.0"
  .ReferencePlaneDistance "0"
  .TextSize "50"
  .Coordinates "Picks"
  .Orientation "Positive"
  .PortOnBound "True"
  .ClipPickedPortToBound "False"
  .XrangeAdd "1.6*7.1", "1.6*7.1"
  .YrangeAdd "0", "0"
  .ZrangeAdd "1.6", "1.6*7.1"
  .Shield "PEC"
  .SingleEnded "False"
  .Create
End With

'@ boolean add shapes: component1:Element, component1:Element_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element", "component1:Element_1"

'@ boolean add shapes: component1:Element, component1:Element_2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element", "component1:Element_2"

'@ boolean add shapes: component1:Element, component1:Element_3

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element", "component1:Element_3"

'@ define frequency range

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solver.FrequencyRange "1", "6"

'@ define time domain solver parameters

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30.0"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define farfield monitor: farfield (broadband)

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Monitor 
     .Reset 
     .Name "farfield (broadband)" 
     .Domain "Time" 
     .Accuracy "1e-3" 
     .FrequencySamples "21" 
     .FieldType "Farfield" 
     .Frequency "3.5" 
     .TransientFarfield "False" 
     .ExportFarfieldSource "False" 
     .Create 
End With 

'@ paste structure data: 1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With SAT 
     .Reset 
     .FileName "*1.cby" 
     .SubProjectScaleFactor "0.001" 
     .ImportToActiveCoordinateSystem "True" 
     .ScaleToUnit "True" 
     .Curves "False" 
     .Read 
End With 



'@ boolean add shapes: component1:Decoupler1, component1:Element

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Decoupler1", "component1:Element" 


'@ farfield plot options

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With FarfieldPlot 
     .Plottype "Cartesian" 
     .Vary "angle1" 
     .Theta "90" 
     .Phi "90" 
     .Step "1" 
     .Step2 "1" 
     .SetLockSteps "True" 
     .SetPlotRangeOnly "False" 
     .SetThetaStart "0" 
     .SetThetaEnd "180" 
     .SetPhiStart "0" 
     .SetPhiEnd "360" 
     .SetTheta360 "False" 
     .SymmetricRange "False" 
     .SetTimeDomainFF "False" 
     .SetFrequency "3.5" 
     .SetTime "0" 
     .SetColorByValue "True" 
     .DrawStepLines "False" 
     .DrawIsoLongitudeLatitudeLines "False" 
     .ShowStructure "False" 
     .ShowStructureProfile "False" 
     .SetStructureTransparent "False" 
     .SetFarfieldTransparent "False" 
     .SetSpecials "enablepolarextralines" 
     .SetPlotMode "Directivity" 
     .Distance "1" 
     .UseFarfieldApproximation "True" 
     .SetScaleLinear "False" 
     .SetLogRange "40" 
     .SetLogNorm "0" 
     .DBUnit "0" 
     .EnableFixPlotMaximum "False" 
     .SetFixPlotMaximumValue "1" 
     .SetInverseAxialRatio "False" 
     .SetAxesType "user" 
     .SetAntennaType "unknown" 
     .Phistart "1.000000e+00", "0.000000e+00", "0.000000e+00" 
     .Thetastart "0.000000e+00", "0.000000e+00", "1.000000e+00" 
     .PolarizationVector "0.000000e+00", "1.000000e+00", "0.000000e+00" 
     .SetCoordinateSystemType "spherical" 
     .SetAutomaticCoordinateSystem "True" 
     .SetPolarizationType "Linear" 
     .SlantAngle 0.000000e+00 
     .Origin "bbox" 
     .Userorigin "0.000000e+00", "0.000000e+00", "0.000000e+00" 
     .SetUserDecouplingPlane "False" 
     .UseDecouplingPlane "False" 
     .DecouplingPlaneAxis "X" 
     .DecouplingPlanePosition "0.000000e+00" 
     .LossyGround "False" 
     .GroundEpsilon "1" 
     .GroundKappa "0" 
     .EnablePhaseCenterCalculation "False" 
     .SetPhaseCenterAngularLimit "3.000000e+01" 
     .SetPhaseCenterComponent "boresight" 
     .SetPhaseCenterPlane "both" 
     .ShowPhaseCenter "True" 
     .StoreSettings
End With 


