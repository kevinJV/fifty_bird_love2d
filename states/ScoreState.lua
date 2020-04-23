--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local gold_medal = love.graphics.newImage('gold_medal.png')
local silver_medal = love.graphics.newImage('silver_medal.png')
local bronze_medal = love.graphics.newImage('bronze_medal.png')

function ScoreState:init()
    self.gold_medal = gold_medal
    self.silver_medal = silver_medal
    self.bronze_medal = bronze_medal
end

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score <= 3 then
        love.graphics.draw(self.bronze_medal, VIRTUAL_WIDTH/2 - self.bronze_medal:getWidth()/2, VIRTUAL_HEIGHT/2 - self.bronze_medal:getHeight()/2)
    elseif self.score <= 6 then
        love.graphics.draw(self.silver_medal, VIRTUAL_WIDTH/2 - self.silver_medal:getWidth()/2, VIRTUAL_HEIGHT/2 - self.silver_medal:getHeight()/2)
    else
        love.graphics.draw(self.gold_medal, VIRTUAL_WIDTH/2 - self.gold_medal:getWidth()/2, VIRTUAL_HEIGHT/2 - self.gold_medal:getHeight()/2)
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')
end