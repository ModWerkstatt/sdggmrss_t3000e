local soundeffectsutil = require "soundeffectsutil"

function data()
return {
	tracks = {
		{ name = "vehicle/mw_leicht/start.wav", refDist = 3.0 },
		{ name = "vehicle/mw_kessel/slow.wav", refDist = 3.0 },
		{ name = "vehicle/mw_kessel/normal.wav", refDist = 3.0 },
		{ name = "vehicle/mw_kessel/fast.wav", refDist = 3.0 },
		{ name = "vehicle/sfx/kurve_freight2.wav", refDist = 5.0 },
		{ name = "vehicle/sfx/bremse_mix.wav", refDist = 6.0 }
	},
		events = {
			clacks = {
				-- Klackern	
			names = {
				"vehicle/sfx/container_clack/clack6.wav",
				"vehicle/sfx/container_clack/clack7.wav",
				"vehicle/sfx/container_clack/clack8.wav",
				"vehicle/sfx/container_clack/clack9.wav",
	
					}, refDist = 1.0
				}
		},

	--bis
	
	updateFn = function (input)
		return {	
			tracks = {
							{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, { 0.05, 0.0 }, { 0.2, 5.0 }, { 0.3, 4.0 }, { 0.6, 1.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, { 0.25, 0.6 }, { 0.4, 2.5 }, { 0.6, 1.6 }, {1.0, 0.0}}, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, {0.2, 0.0}, { 0.3, 2.0 }, {0.5, 4.0}, {0.85, 3.0}, { 1.0, 1.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, {0.6, 0.1}, { 0.7, 0.2 }, { 0.8, 1.5 }, { 1.0, 3.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				soundeffectsutil.squeal(input.speed, input.sideForce, 0.7),
				soundeffectsutil.brake(input.speed, input.brakeDecel, 2.5)
			},
			events = {
				clacks = 
					{ gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, { 0.05, 3.6 }, { 0.2, 4.0 }, { 0.6, 4.0 }, { 0.7, 0.0 } }, input.speed01), pitch = 1.0 }
			}	
		}
	end
}
end