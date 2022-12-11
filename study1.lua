-- many tomorrows
-- norns study 1
-- 
-- KEY 2 toggle sound on/off
-- KEY 3 toggle octave
-- ENC 2 change amplitude
-- ENC 3 change frequency
--
-- first turn on AUX reverb!

engine.name = "TestSine"

function init()
  sound = 0       -- intial state of engine amplitude, boolean
  level = 1       -- level of engine amplitude, float, two decimal points
  octave = 1      -- octave increase
  a = 0           -- initial engine amplitude
  f = 100         -- initial engine frequency
  position = 0
  engine.amp(a)   -- intialize engine amplitude
  engine.hz(f)    -- intialize engine frequency
  print("the end and the beginning they are the same.")
end

function key(n,z)
  if n == 2 then
    if z == 1 then
      sound = 1 - sound               -- trick below to toggle between 0 and 1
      engine.amp(sound * level)
    end
  elseif n == 3 then
    octave = z + 1                    -- increase frequency by 1 octave aka multiply frequency by 2
    engine.hz(octave * f)
  end
end

function enc(n,d)
  if n == 2 then
    -- level = math.random(100) / 100           -- generate random number between 0.00 to 1.00, two decimal points
    level = util.clamp(level + d / 100, 0, 1)   -- sets level of engine, 0 to 1
    engine.amp(sound * level)                   -- sound determines whether engine amplitude is on or off
  elseif n == 3 then
    position = (position + d) % 11              -- increase frequency by 50hz, wrapped to 10 steps
    f = 100 + position * 50
    engine.hz(octave * f)                       -- increase octave if K3 is pressed
  end
end