--[[
    PauseState Class
    
    Author: Kevin JV
    katz_powa@hotmail.com

    A little pause state class, in case you are marathon-ing the game want to take a break kappa
]]

PauseState = Class{__includes = BaseState}

function PauseState:init()
    gPause = true
    self.play_state = {}
end

--[[
    To pause the game, we must get enough params to keep drawing 
    the actual game
]]
function PauseState:enter(params)
    self.play_state = params.play_state
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.keyboard.wasPressed('space') or love.mouse.wasPressed('1') then
        gStateMachine:change('countdown', {
            play_state = self.play_state
        })
    end
end

function PauseState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Pause', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Touch or Press Enter or Space to resume', 0, 100, VIRTUAL_WIDTH, 'center')
end