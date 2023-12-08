module MagicFormulaTyre

	export lateralForce
	function lateralForce(α; F_z=2000, γ=0)
        # For more information on the Magic Formula Tyre model, please refer to [ref: https://doi.org/10.4271/870421]
        a_1 = -22.1; a_2 = 1011; a_3 = 1078; a_4 = 1.82; a_5 = 0.208; a_6 = 0.000
        a_7 = -0.354; a_8 = 0.707; a_9 = 0.028; a_10 = 0.000; a_11 = 14.8; a_12 = 0.022

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
