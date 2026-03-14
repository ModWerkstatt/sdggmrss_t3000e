local soundeffectsutil = require "soundeffectsutil"

function data()
return {
	tracks = {
		{ name = "vehicle/mw_schiebewand/start.wav", refDist = 3.0 },
		{ name = "vehicle/mw_schiebewand/slow.wav", refDist = 3.0 },
		{ name = "vehicle/mw_schiebewand/normal.wav", refDist = 3.0 },
		{ name = "vehicle/mw_schiebewand/fast.wav", refDist = 3.0 },
		{ name = "vehicle/sfx/kurve_freight2.wav", refDist = 5.0 },
		{ name = "vehicle/sfx/bremse_mix.wav", refDist = 6.0 }
	},

	--bis
	
	updateFn = function (input)
		return {	
			tracks = {
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, { 0.05, 0.0 }, { 0.1, 4.0 }, { 0.2, 2.0 }, { 0.4, 0.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, { 0.2, 3.0 }, { 0.3, 2.0 }, { 0.4, 2.0 }, { 0.5, 1.0 }, {0.75, 0.0 }}, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, {0.2, 0.0}, { 0.3, 2.0 }, {0.5, 3.0}, {0.7, 3.0}, { 0.9, 1.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, {0.6, 0.5}, { 0.7, 1.0 }, { 0.8, 4.0 }, { 0.9, 4.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 0.8 }, { 0.041, 0.8 }, { 0.075, 0.8 }, { 1.0, 0.8 } }, input.speed01)
				},
				soundeffectsutil.squeal(input.speed, input.sideForce, 0.7),
				soundeffectsutil.brake(input.speed, input.brakeDecel, 2.5)
			},
		}
	end
}
end