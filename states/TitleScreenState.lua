--[[
    TitleScreenState Class
    
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The TitleScreenState is the starting screen of the game, shown on startup. It should
    display "Press Enter" and also our highest score.
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    -- nothing
end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.keyboard.wasPressed('space') or love.mouse.wasPressed('1') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Fifty Bird', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Touch or Press Enter or Space to start', 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(smallFont)
    love.graphics.printf('Modified by Kevin JV', 5, VIRTUAL_HEIGHT - 25, VIRTUAL_WIDTH, 'left')
end