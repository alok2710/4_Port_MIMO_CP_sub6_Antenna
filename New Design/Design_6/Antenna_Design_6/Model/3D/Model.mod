'# MWS Version: Version 2016.1 - Feb 26 2016 - ACIS 25.0.2 -

'# length = mm
'# frequency = GHz
'# time = ns
'# frequency range: fmin = 1 fmax = 6
'# created = '[VERSION]2016.1|25.0.2|20160226[/VERSION]


'@ use template: Antenna - Waveguide_7.cfg

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

'@ define brick: component1:solid1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid1" 
     .Component "component1" 
     .Material "FR-4 (lossy)" 
     .Xrange "-s/2", "s/2" 
     .Yrange "-s/2", "s/2" 
     .Zrange "0", "1.6" 
     .Create
End With

'@ paste structure data: 1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Material 
     .Reset 
     .Name "Copper (annealed)" 
     .Folder "" 
     .FrqType "static"
     .Type "Normal"
     .MaterialUnit "Frequency", "Hz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "s"
     .Epsilon "1"
     .Mue "1.0"
     .Sigma "5.8e+007"
     .TanD "0.0"
     .TanDFreq "0.0"
     .TanDGiven "False"
     .TanDModel "ConstTanD"
     .EnableUserConstTanDModelOrderEps "False"
     .ConstTanDModelOrderEps "1"
     .SetElParametricConductivity "False"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .SigmaM "0"
     .TanDM "0.0"
     .TanDMFreq "0.0"
     .TanDMGiven "False"
     .TanDMModel "ConstTanD"
     .EnableUserConstTanDModelOrderMue "False"
     .ConstTanDModelOrderMue "1"
     .SetMagParametricConductivity "False"
     .DispModelEps  "None"
     .DispModelMue "None"
     .DispersiveFittingSchemeEps "Nth Order"
     .MaximalOrderNthModelFitEps "10"
     .ErrorLimitNthModelFitEps "0.1"
     .UseOnlyDataInSimFreqRangeNthModelEps "False"
     .DispersiveFittingSchemeMue "Nth Order"
     .MaximalOrderNthModelFitMue "10"
     .ErrorLimitNthModelFitMue "0.1"
     .UseOnlyDataInSimFreqRangeNthModelMue "False"
     .UseGeneralDispersionEps "False"
     .UseGeneralDispersionMue "False"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .FrqType "all"
     .Type "Lossy metal"
     .MaterialUnit "Frequency", "GHz"
     .MaterialUnit "Geometry", "mm"
     .MaterialUnit "Time", "s"
     .Mue "1.0"
     .Sigma "5.8e+007"
     .ReferenceCoordSystem "Global"
     .CoordSystemType "Cartesian"
     .NLAnisotropy "False"
     .NLAStackingFactor "1"
     .NLADirectionX "1"
     .NLADirectionY "0"
     .NLADirectionZ "0"
     .Rho "8930.0"
     .ThermalType "Normal"
     .ThermalConductivity "401.0"
     .HeatCapacity "0.39"
     .DynamicViscosity "0"
     .Emissivity "0"
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
With SAT 
     .Reset 
     .FileName "*1.cby" 
     .SubProjectScaleFactor "0.001" 
     .ImportToActiveCoordinateSystem "True" 
     .ScaleToUnit "True" 
     .Curves "False" 
     .Read 
End With

'@ transform: translate component1:Element_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Element_1" 
     .Vector "2.5", "-2.5", "0" 
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
WCS.MoveWCS "local", "30", "-30", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "-12.5", "5", "0.0"

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
WCS.MoveWCS "local", "0.0", "9.5", "0.0"

'@ define brick: component1:solid2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "solid2" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "0", "9.5" 
     .Yrange "0", "2" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ boolean add shapes: component1:Element_1, component1:solid2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element_1", "component1:solid2"

'@ activate global coordinates

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.ActivateWCS "global"

'@ transform: mirror component1:Element_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Element_1" 
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

'@ transform: mirror component1:Element_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Element_1" 
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

'@ transform: rotate component1:Element_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:Element_1" 
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

'@ pick edge

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Pick.PickEdgeFromId "component1:Element_1", "140", "88"

'@ boolean add shapes: component1:Element_1, component1:Element_1_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element_1", "component1:Element_1_1"

'@ boolean add shapes: component1:Element_1, component1:Element_1_2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element_1", "component1:Element_1_2"

'@ boolean add shapes: component1:Element_1, component1:Element_1_3

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element_1", "component1:Element_1_3"

'@ activate local coordinates

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.ActivateWCS "local"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "9.5", "-9.5", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "3", "-5", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "-60", "0.0", "0.0"

'@ move wcs

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
WCS.MoveWCS "local", "12.5", "0.0", "0.0"

'@ define brick: component1:radiating_patch

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "radiating_patch" 
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

'@ transform: mirror component1:radiating_patch

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:radiating_patch" 
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

'@ transform: mirror component1:radiating_patch

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:radiating_patch" 
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

'@ transform: rotate component1:radiating_patch

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:radiating_patch" 
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

'@ boolean add shapes: component1:radiating_patch, component1:radiating_patch_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:radiating_patch", "component1:radiating_patch_1"

'@ boolean add shapes: component1:radiating_patch, component1:radiating_patch_2

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:radiating_patch", "component1:radiating_patch_2"

'@ boolean add shapes: component1:radiating_patch, component1:radiating_patch_3

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:radiating_patch", "component1:radiating_patch_3"

'@ pick face

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Pick.PickFaceFromId "component1:radiating_patch", "3"

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
Pick.PickFaceFromId "component1:radiating_patch", "9"

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
Pick.PickFaceFromId "component1:radiating_patch", "15"

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
Pick.PickFaceFromId "component1:radiating_patch", "21"

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

'@ define frequency range

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solver.FrequencyRange "1", "6"

'@ define time domain solver parameters

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Mesh.SetCreator "High Frequency" 
With Solver 
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "1"
     .StimulationMode "1"
     .SteadyStateLimit "-30.0"
     .MeshAdaption "False"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache  "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define brick: component1:Decoupling

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "Decoupling" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-.25", ".25" 
     .Yrange "-l", "l" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ define brick: component1:vertical_decoupler

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "vertical_decoupler" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-a", "a" 
     .Yrange "l", "l+.5" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ transform: mirror component1:vertical_decoupler

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:vertical_decoupler" 
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

'@ boolean add shapes: component1:vertical_decoupler, component1:vertical_decoupler_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:vertical_decoupler", "component1:vertical_decoupler_1"

'@ boolean add shapes: component1:Decoupling, component1:vertical_decoupler

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Decoupling", "component1:vertical_decoupler"

'@ define brick: component1:horizontal_decoupler

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "horizontal_decoupler" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "-xd", "xd" 
     .Yrange "yd", "yd+.5" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ transform: mirror component1:horizontal_decoupler

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:horizontal_decoupler" 
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

'@ define brick: component1:horizonatl_decoupler_vertical

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Brick
     .Reset 
     .Name "horizonatl_decoupler_vertical" 
     .Component "component1" 
     .Material "Copper (annealed)" 
     .Xrange "xd", "xd+.5" 
     .Yrange "-5", "5" 
     .Zrange "-.035", "0" 
     .Create
End With

'@ transform: mirror component1:horizonatl_decoupler_vertical

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
With Transform 
     .Reset 
     .Name "component1:horizonatl_decoupler_vertical" 
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

'@ boolean add shapes: component1:horizonatl_decoupler_vertical, component1:horizonatl_decoupler_vertical_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:horizonatl_decoupler_vertical", "component1:horizonatl_decoupler_vertical_1"

'@ boolean add shapes: component1:horizonatl_decoupler_vertical, component1:horizontal_decoupler

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:horizonatl_decoupler_vertical", "component1:horizontal_decoupler"

'@ boolean add shapes: component1:horizonatl_decoupler_vertical, component1:horizontal_decoupler_1

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:horizonatl_decoupler_vertical", "component1:horizontal_decoupler_1"

'@ rename block: component1:Decoupling to: component1:vertical_decoupler

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Rename "component1:Decoupling", "vertical_decoupler"

'@ rename block: component1:solid1 to: component1:Substrate

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Rename "component1:solid1", "Substrate"

'@ boolean add shapes: component1:Element_1, component1:horizonatl_decoupler_vertical

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element_1", "component1:horizonatl_decoupler_vertical"

'@ boolean add shapes: component1:Element_1, component1:vertical_decoupler

'[VERSION]2016.1|25.0.2|20160226[/VERSION]
Solid.Add "component1:Element_1", "component1:vertical_decoupler"

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

