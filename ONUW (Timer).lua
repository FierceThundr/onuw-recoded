------------------Constants
BUTTON_COLOR = {0,0,0,1}
BUTTON_FONT_COLOR = {1,1,1,1}

------------------Variables
time = 301
currentTimerID = 0
playerc_list = {}
timeset = false
timeadjusted = false

------------------Functions
function onCall(timerset)
  if timerset == true then
	time = static_time
  elseif timeadjusted == true then
	time = whackedtime
	timeadjusted = false
  else
	time = 301
  end

  vnot = true

  playerc_list = a
  refreshButtons()
  time5m()
end

function getLabel()
    local minutes, seconds, timeLabel
    minutes = math.floor((time / 60))
    seconds = string.format('%02d',time % 60)
    timeLabel = minutes .. ':' .. seconds
    return timeLabel
end

------------------voicelines to add -- 1min,30sec,10sec warning
function timeRefresh()
    local minutes, seconds, timeLabel
    time = time - 1

	if time <= 30 and time % 2 == 0 then
		self.editButton({index = 0, font_color = stringColorToRGB('Red')})
    elseif time <= 60 then
        self.editButton({index = 0, font_color = stringColorToRGB('Yellow')})
    end

    self.editButton({index = 0, label = getLabel()})

	if time == 60 then
		Global.call('playSound', 23)
	elseif time == 30 then
		Global.call('playSound', 24)
	end

    if time == 0 then
		Global.call('playSound', 25)
        Wait.stop(currentTimerID)
		Wait.time(hideButtons,5.8)
    else
        currentTimerID = Wait.time(timeRefresh, 1)
    end
end

function time5m()
    self.editButton({index = 0, label = '', font_color = stringColorToRGB('White')})

    startTimer()
end

function startTimer()
    self.setLock(true)
    Wait.stop(currentTimerID)
    self.editButton({index = 1, label = 'Pause'})
    currentTimerID = Wait.time(timeRefresh, 1)
end

function setTime(value)

	if value > 0 then
		time = value + 1
		static_time = time
		tnot = false
	else
		whackedtime = (value * -1) + 1
		timeadjusted = true
	end
end

function pauseFunc()
    local buttonTable = self.getButtons()
    local newLabel

    if buttonTable[2].label == 'Start' and time != 0 then
        newLabel = 'Pause'
        currentTimerID = Wait.time(timeRefresh, 1)
    else
        newLabel = 'Start'
        Wait.stop(currentTimerID)
    end
    self.editButton({index = 1, label = newLabel})
end

function voteFunc(player,value,id)
	if vnot then
		time = 11
		Wait.stop(currentTimerID)
		currentTimerID = Wait.time(timeRefresh, 1)
	end
	vnot = false
end


function refreshButtons()
  local timeLabel

  local buttonParam = {click_function = 'nullFunc', function_owner = self, label = '', color = {0,0,0,1}, font_color = stringColorToRGB('White'), position = {0,2,-0.2}, width = 0, height = 0, font_size = 500}
  self.createButton(buttonParam)

	local buttonParam = {click_function = 'pauseFunc', function_owner = self, label = 'Pause', font_color = BUTTON_FONT_COLOR, color = BUTTON_COLOR, position = {-0.60,2,0.5}, width = 360, height = 220, font_size = 120, tooltip = 'Pause/Start the Timer'}
  self.createButton(buttonParam)

	local buttonParam = {click_function = 'voteFunc', function_owner = self, label = 'Vote Now', font_color = BUTTON_FONT_COLOR, color = BUTTON_COLOR, position = {0.38,2,0.5}, width = 600, height = 220, font_size = 120, tooltip = 'Skip to 10 seconds remaining on Timer'}
  self.createButton(buttonParam)

	local buttonParam = {click_function = 'nullFunc', function_owner = self, label = 'Time Remaining Before Vote', font_color = stringColorToRGB('White'), position = {0,2,-1}, width = 0, height = 0, font_size = 80}
  self.createButton(buttonParam)
end

function hideButtons()
	self.removeButton(3)
	self.removeButton(2)
	self.removeButton(1)
	self.removeButton(0)
	Global.call('tallyVote', "hello")
end