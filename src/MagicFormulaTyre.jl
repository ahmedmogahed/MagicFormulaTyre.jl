module MagicFormulaTyre

	include("./Argument.jl")
	using .Argument

    defaultArgs = default()

	export lateralForce
	function lateralForce(α; F_z=2000, γ=0)
        # For more information on the Magic Formula Tyre model, please refer to [ref: https://doi.org/10.4271/870421]
        a_1 = defaultArgs.a1; a_2 = defaultArgs.a2; a_3 = defaultArgs.a3; a_4 = defaultArgs.a4; a_5 = defaultArgs.a5; a_6 = defaultArgs.a6
        a_7 = defaultArgs.a7; a_8 = defaultArgs.a8; a_9 = defaultArgs.a9; a_10 = defaultArgs.a10; a_11 = defaultArgs.a11; a_12 = defaultArgs.a12

        # IMPORTANT conversions (forces in `kN` and angles in `deg`)
        α_d = rad2deg(α); γ_d = rad2deg(γ); F_zk = F_z / 1e3

        # Formula equations
        C = 1.3
        D = a_1 * F_zk ^ 2 + a_2 * F_zk
        B = a_3 * sin(a_4 * atan(a_5 * F_zk)) / (C * D) * (1 - a_12 * abs(γ_d))
        E = a_6 * F_zk ^ 2 + a_7 * F_zk + a_8
        # vertical and horizontal shifts due to camber
        ΔS_h = a_9 * γ_d
        ΔS_v = (a_10 * F_zk ^ 2 + a_11 * F_zk) * γ_d
        α_ΔS_h = α_d + ΔS_h
        ϕ = (1 - E) * α_ΔS_h + E / B * atan(B * α_ΔS_h)

        # Equation
        return D * sin(C * atan(B * ϕ)) + ΔS_v;
    end

end
