-- study 2
-- code exercise
-- conditional reveal

function init()
  level = 3
  number = 84
  mode = 0
end

function redraw()
  screen.clear()
  if mode == 0 then
    screen.level(level)
    screen.font_face(10)
    screen.font_size(20)
    screen.move(0,50)
    screen.text("number: " .. number)
    screen.update()
  elseif mode == 1 then
    screen.move(0,20)
    screen.text("WILD")
    screen.update()
  end
end

function key(n,z)
  if n == 3 then
    mode = z
  else
    level = 3 + z * 12
  end
  redraw()
end

function enc(n,d)
  number = number + d
  redraw()
end