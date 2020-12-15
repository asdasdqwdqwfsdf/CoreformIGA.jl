using CoreformIGA
using Test

@testset "CoreformIGA.jl" begin
    # Write your tests here.
    @testset "BasisBernstein.jl" begin
        @test CoreformIGA.BasisBernstein.B( 1, 0.5 )[ 1 ] == 1.0/2.0
        @test CoreformIGA.BasisBernstein.B( 1, 0.5 )[ 2 ] == 1.0/2.0
        @test CoreformIGA.BasisBernstein.B( 2, 0.5 )[ 1 ] == 0.25
        @test CoreformIGA.BasisBernstein.B( 2, 0.5 )[ 2 ] == 0.5
        @test CoreformIGA.BasisBernstein.B( 2, 0.5 )[ 3 ] == 0.25
        @test CoreformIGA.BasisBernstein.B( 3, 0.5 )[ 1 ] == 1.0/8.0
        @test CoreformIGA.BasisBernstein.B( 3, 0.5 )[ 2 ] == 3.0/8.0
        @test CoreformIGA.BasisBernstein.B( 3, 0.5 )[ 3 ] == 3.0/8.0
        @test CoreformIGA.BasisBernstein.B( 3, 0.5 )[ 4 ] == 1.0/8.0
        @test CoreformIGA.BasisBernstein.dBdxi( 1, 0.5 )[ 1 ] == -1
        @test CoreformIGA.BasisBernstein.dBdxi( 1, 0.5 )[ 2 ] == 1
    end
    @testset "BasisMesh.jl" begin
        layout = CoreformIGA.BasisMesh.layout_bspline_1d_uniform_h_max_k( 1, 2 )
        bm_fc = CoreformIGA.BasisMesh.function_collection( layout )
        @test bm_fc.element_count() == 2
        @test bm_fc.global_function_count() == 3
        @test bm_fc.global_function_count_on_element( 1 ) == 2
        @test bm_fc.global_function_count_on_element( 2 ) == 2
        @test bm_fc.local_function_count_on_element( 1 ) == 2
        @test bm_fc.local_function_count_on_element( 2 ) == 2
        @test bm_fc.global_function_ids_on_element( 1 )[ 1 ] == 1
        @test bm_fc.global_function_ids_on_element( 1 )[ 2 ] == 2
        @test bm_fc.global_function_ids_on_element( 2 )[ 1 ] == 2
        @test bm_fc.global_function_ids_on_element( 2 )[ 2 ] == 3
        @test bm_fc.parametric_map_value( 1, 0.5 ) == 0.25
        @test bm_fc.parametric_map_value( 2, 0.5 ) == 0.75
        @test bm_fc.parametric_map_gradient( 1, 0.5 ) == 0.5
        @test bm_fc.parametric_map_gradient( 2, 0.5 ) == 0.5
        @test bm_fc.extraction_operator_on_element( 1 )[ 1, 1 ] == 1.0
        @test bm_fc.extraction_operator_on_element( 1 )[ 1, 2 ] == 0.0
        @test bm_fc.extraction_operator_on_element( 1 )[ 2, 1 ] == 0.0
        @test bm_fc.extraction_operator_on_element( 1 )[ 2, 2 ] == 1.0
        @test bm_fc.extraction_operator_on_element( 2 )[ 1, 1 ] == 1.0
        @test bm_fc.extraction_operator_on_element( 2 )[ 1, 2 ] == 0.0
        @test bm_fc.extraction_operator_on_element( 2 )[ 2, 1 ] == 0.0
        @test bm_fc.extraction_operator_on_element( 2 )[ 2, 2 ] == 1.0
        @test isapprox( bm_fc.local_basis_value( 1, 0.5 )[ 1 ], 0.5 )
        @test isapprox( bm_fc.local_basis_value( 1, 0.5 )[ 2 ], 0.5 )
        @test bm_fc.local_basis_parametric_gradient( 1, 0.5 )[ 1 ] == -1.0
        @test bm_fc.local_basis_parametric_gradient( 1, 0.5 )[ 2 ] == 1.0
    end
    @testset "BasisSpline.jl" begin
        #make a basis spline function collection
        @test bs.x == y
    end
end
