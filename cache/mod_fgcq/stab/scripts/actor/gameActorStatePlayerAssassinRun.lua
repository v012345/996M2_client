local gameActorStateMoveBase = require( "actor/gameActorStateMoveBase")
local gameActorStatePlayerAssassinRun = class('gameActorStatePlayerAssassinRun', gameActorStateMoveBase)

function gameActorStatePlayerAssassinRun:ctor()
    self.super.ctor(self)
end

function gameActorStatePlayerAssassinRun:GetStateID()
    return global.MMO.ACTION_ASSASSIN_RUN
end

function gameActorStatePlayerAssassinRun:GetMoveTime( actor )
    return global.MMO.DEFAULT_ASSASSIN_RUN_TIME / actor:GetRunSpeed()
end

function gameActorStatePlayerAssassinRun:OnEnter( actor )    
    self.super.OnEnter( self, actor )

    -- reset some data
    actor:SetAnimPrepare( 0.0 )
    actor:dirtyAnimFlag()
end

function gameActorStatePlayerAssassinRun:OnExit( actor )
    actor:SetAnimPrepare(0.1)
    actor:StopAllAnimation(6)
end

return gameActorStatePlayerAssassinRun