local soundeffectsutil = require "soundeffectsutil"


function data()
return {
	tracks = {
		{ name = "vehicle/mw_person_modern/slow.wav", refDist = 3.0 },
		{ name = "vehicle/mw_person_modern/normal.wav", refDist = 3.0 },
		{ name = "vehicle/mw_person_alt/fast.wav", refDist = 3.0 },
		{ name = "vehicle/mw_person_modern/kurve.wav", refDist = 5.0 },
		{ name = "vehicle/mw_person_alt/bremse_mix.wav", refDist = 6.0 }
	},
	events = {
		clacks = {
		    -- Klackern	
		names = {
	"vehicle/clack/modern/part_1.wav",
	"vehicle/clack/modern/part_2.wav",
	"vehicle/clack/modern/part_3.wav",
	"vehicle/clack/modern/part_4.wav",
	"vehicle/clack/modern/part_5.wav",
	"vehicle/clack/modern/part_6.wav",
	"vehicle/clack/modern/part_7.wav",
	"vehicle/clack/modern/part_8.wav",
	"vehicle/clack/modern/part_9.wav",
	"vehicle/clack/modern/part_10.wav"


				}, refDist = 2.0
			},
		-- Türen öffenen/schließen
		openDoors = { names =  { "vehicle/waggon_modern/open.wav" }, refDist = 5.0 },	
		closeDoors = { names = { "vehicle/waggon_modern/close.wav" }, refDist = 5.0 }
	},

	--bis
	
	updateFn = function (input)
		return {	
			tracks = {
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, { 0.05, 0.0 }, { 0.2, 4.0 }, { 0.3, 3.0 }, { 0.4, 0.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, {0.2, 1.0}, { 0.3, 2.0 }, {0.5, 3.0}, {0.7, 2.0}, { 0.8, 1.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 1.0 }, { 0.041, 1.0 }, { 0.075, 1.0 }, { 1.0, 1.0 } }, input.speed01)
				},
				{ 
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.00 }, {0.5, 0.5},  { 0.8, 3.0 }, { 0.9, 4.0 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 0.8 }, { 0.041, 0.8 }, { 0.075, 0.8 }, { 1.0, 0.8 } }, input.speed01)
				},
				soundeffectsutil.squeal(input.speed, input.sideForce, 0.7),
				soundeffectsutil.brake(input.speed, input.brakeDecel, 2.5)
			},
			events = 
			{
				clacks = {gain = 4.0, pitch = 1},
				-- Doors
				openDoors = { gain = 1.0, pitch = 1 },
				closeDoors = { gain = 1.0, pitch = 1 }
			}
		}
	end
}
end