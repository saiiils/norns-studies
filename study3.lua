-- study 3
-- code exercise
-- all the feels

engine.name = "PolyPerc"

function midi_to_hz(note)
	local hz = (440 / 32) * (2 ^ ((note - 9) / 12))
	return hz
end

function happy()
	engine.release(0.3)
	engine.hz(midi_to_hz(60))
	engine.hz(midi_to_hz(64))
	engine.hz(midi_to_hz(67))
end

function sad()
	engine.release(1)
	engine.hz(midi_to_hz(60))
	engine.hz(midi_to_hz(63))
	engine.hz(midi_to_hz(67))
end

function melancholic()
	engine.release(3)
	engine.hz(midi_to_hz(53))
	engine.hz(midi_to_hz(56))
	engine.hz(midi_to_hz(60))
	engine.hz(midi_to_hz(63))
	engine.hz(midi_to_hz(67))
  end

feelings = {sad,happy,melancholic,happy,happy,sad,sad,melancholic}
cutoffs = {800,400,1200}

feeling_index = 0 -- keep track of which feeling we're feeling
cutoff_index = 0 -- same for cutoff values

function key(n,z)
	if z == 1 then
		feeling_index = util.wrap(feeling_index + 1, 1, #feelings) -- increment index
		cutoff_index = util.wrap(cutoff_index + 1, 1, #cutoffs) -- increment index
		engine.cutoff(cutoffs[cutoff_index]) -- set cutoff
		feelings[feeling_index]() -- feel the feeling
	end
end