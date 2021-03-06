# unit tests
include( "./unit/testGeometry.jl" )
include( "./unit/testBasisBernstein.jl" )
include( "./unit/testBasisMesh.jl" )
include( "./unit/testBasisSpline.jl" )
include( "./unit/testField.jl" )
include( "./unit/testNonlinearSolver.jl" )
include( "./unit/testQuadrature.jl" )
include( "./unit/testBEXTImport.jl" )
include( "./unit/testPrecondition.jl" )

# system tests
include( "./system/1d_traction_1element.jl" )
include( "./system/1d_body_and_traction_flex_4_element.jl" )
