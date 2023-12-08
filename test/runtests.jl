using MagicFormulaTyre
using Test

@testset "MagicFormulaTyre.jl" begin
    # Write your tests here.
    @test lateralForce(deg2rad(12)) == 1924.3435368756814
end
