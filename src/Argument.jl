module Argument
	export default
	struct default 
		a1::Float64; a2::Float64; a3::Float64; a4::Float64
		a5::Float64; a6::Float64; a7::Float64; a8::Float64
		a9::Float64; a10::Float64; a11::Float64; a12::Float64
		a13::Float64

		default() = new(-22.1,1011,1078,1.82,0.208,0.000,
						-0.354,0.707,0.028,0.000,14.8,0.022,0.000)

		function default(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13)
			new(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13)
		end
	end
end