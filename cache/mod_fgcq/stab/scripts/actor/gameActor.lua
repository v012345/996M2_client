local gameActor = class("gameActor")
local INVALID_MAP_POS = 0xFFFF

function gameActor:ctor()
end

function gameActor:init()
    self.mONameStr          = ""
    self.mName              = ""
    self.mTypeIndex         = 0
    self.mID                = global.MMO.ACTOR_ID_INVALID
    self.mRace              = global.MMO.ACTOR_RACE_NONE
    self.mSubType           = global.MMO.ACTOR_SUBTYPE_NONE

    self.mCurrMapX          = INVALID_MAP_POS 
    self.mCurrMapY          = INVALID_MAP_POS 

    self.mLastMapX          = INVALID_MAP_POS
    self.mLastMapY          = INVALID_MAP_POS

    self.mPositionX         = 0
    self.mPositionY         = 0

    self.mAction            = global.MMO.ACTION_IDLE 
    self.mOrient            = global.MMO.ORIENT_U 

    self.mCurrActorNode     = nil
    self.mAnimation         = nil

    self.mIgnored           = nil
    self.mIgnoredT          = 0

    self.mIsAttack          = true          -- 可攻击的类型
    self.mIsPlayerAttacked  = true          -- 可被玩家攻击

    self.mLight             = nil           -- 灯光

    self.mPauseIgnored      = nil
    self.mPauseIgnoredT     = 0

    self.mVisible           = false

    self.mServerHpLabel     = false

    self.mObstacleFlag      = false         -- 阻挡标识

    self.mVisibles          = {}
end

function gameActor:destory()
end

function gameActor:Tick(dt)
    if self:IsIngored() then
        self.mIgnoredT = self.mIgnoredT + dt
        if self.mIgnoredT >= 3 then
            self.mIgnoredT = 0
            self:IgnoreActor(false)
        end
    end

    if self:IsPauseIgnored() then
        self.mPauseIgnoredT = self.mPauseIgnoredT + dt
        if self.mPauseIgnoredT >= 3 then
            self.mPauseIgnoredT = 0
            self:IgnoreActor(true)
            self:PauseIgnoredActor()
        end
    end
end

function gameActor:GetType()
    return global.MMO.ACTOR_NONE
end
function gameActor:SetLightID( Light )
    self.mLight = Light
end
function gameActor:GetLightID()
    return self.mLight
end
function gameActor:SetID( id )
    self.mID = id
end
function gameActor:GetID()
    return self.mID
end

function gameActor:GetRace()
    return self.mRace
end
function gameActor:SetRace(race)
    self.mRace = race
end

function gameActor:IsPlayer()
    return self:GetType() == global.MMO.ACTOR_PLAYER
end

function gameActor:IsMonster()
    return self:GetType() == global.MMO.ACTOR_MONSTER
end

function gameActor:IsNPC()
    return self:GetType() == global.MMO.ACTOR_NPC
end

function gameActor:IsDropItem()
    return self:GetType() == global.MMO.ACTOR_DROPITEM
end

function gameActor:IsSEffect()
    return self:GetType() == global.MMO.ACTOR_SEFFECT
end

function gameActor:IsNetPlayer()
    return self:GetRace() == global.MMO.ACTOR_RACE_NET_PLAYER
end

function gameActor:IsHero()
    return self:GetRace() == global.MMO.ACTOR_RACE_HERO
end

function gameActor:IsPet()
    return self:GetRace() == global.MMO.ACTOR_RACE_PET
end

function gameActor:IsPickUpSprite()
    return self:GetRace() == global.MMO.ACTOR_RACE_PICKUPSPRITE
end

function gameActor:IsHumanoid()
    return self:GetRace() == global.MMO.ACTOR_RACE_HUMANOID
end

function gameActor:IsDefender()
    return self:GetRace() == global.MMO.ACTOR_RACE_DEFENDER
end

function gameActor:IsBoss()
    return self:GetSubType() == global.MMO.ACTOR_SUBTYPE_BOSS
end

function gameActor:IsNormalMonster()
    return self:GetSubType() == global.MMO.ACTOR_SUBTYPE_NORMAL
end

function gameActor:IsElite()
    return self:GetSubType() == global.MMO.ACTOR_SUBTYPE_ELITE
end

function gameActor:IsEscort()
    return self:GetRace() == global.MMO.ACTOR_RACE_ESCORT
end

function gameActor:IsCollection()
    return self:GetRace() == global.MMO.ACTOR_RACE_COLLECTION
end

--沙巴克大门
function gameActor:IsGate()
    if self:IsMonster() and self:GetAnimationID() == 900 then
        return true
    end
    return false
end

--沙巴克城墙
function gameActor:IsWall()
    if not self:IsMonster() then
        return false
    end
    local animId = self:GetAnimationID()
    return (animId == 901 or animId == 902 or animId == 903 or animId == 904 or animId == 905 or animId == 906)
end

-- 是否是趴狗
function gameActor:IsFollowDog()
    if not self:IsMonster() then
        return false
    end
    local raceServer = self:GetRaceServer()
    return raceServer == global.MMO.ACTOR_SERVER_RACE_FOLLOW_DOG or raceServer == global.MMO.ACTOR_SERVER_RACE_FOLLOW_DOG1
        or raceServer == global.MMO.ACTOR_SERVER_RACE_FOLLOW_DOG2 or raceServer == global.MMO.ACTOR_SERVER_RACE_FOLLOW_DOG3
end

-- 是否是站狗
function gameActor:IsFightDog()
    if not self:IsMonster() then
        return false
    end
    local raceServer = self:GetRaceServer()
    return raceServer == global.MMO.ACTOR_SERVER_RACE_FIGHT_DOG or raceServer == global.MMO.ACTOR_SERVER_RACE_FIGHT_DOG1
        or raceServer == global.MMO.ACTOR_SERVER_RACE_FIGHT_DOG2 or raceServer == global.MMO.ACTOR_SERVER_RACE_FIGHT_DOG3
end

--动画顺序播放
function gameActor:IsSequence()
    -- 趴狗 变身倒着播放
    if self:IsFollowDog() and self.mAction == global.MMO.ACTION_CHANGESHAPE then
        return false
    end
    -- 钻回地下
    if self.mAction == global.MMO.ACTION_CAVE then
        return false
    end
    return true
end

function gameActor:GetTypeIndex()
    return self.mTypeIndex
end
function gameActor:SetTypeIndex(index)
    self.mTypeIndex = index
end

function gameActor:GetSubType()
    return self.mSubType
end
function gameActor:SetSubType(type)
    self.mSubType = type
end

function gameActor:GetMapX()
    return self.mCurrMapX
end

function gameActor:GetLastMapX()
    return self.mLastMapX
end

function gameActor:SetMapX( x )
    self.mLastMapX = self.mCurrMapX
    self.mCurrMapX = x
end

function gameActor:GetMapY()
    return self.mCurrMapY
end

function gameActor:GetLastMapY()
    return self.mLastMapY
end

function gameActor:SetMapY( y )
    self.mLastMapY = self.mCurrMapY
    self.mCurrMapY = y
end

function gameActor:setPosition(x, y)
    if (self.mPositionX == x and self.mPositionY == y) then
        return
    end
    self.mPositionX = x
    self.mPositionY = y
    self:GetNode():setPosition( x, y )
end

function gameActor:getPosition()
    return cc.p(self.mPositionX, self.mPositionY)
end

function gameActor:SetAction( newAction, isTerminate )
end

function gameActor:GetAction()
    return self.mAction
end

function gameActor:IsDie()
    return self.mAction == global.MMO.ACTION_DIE
end

function gameActor:IsDeath()
    return self.mAction == global.MMO.ACTION_DEATH
end

function gameActor:IsBorn()
    return self.mAction == global.MMO.ACTION_BORN
end

function gameActor:IsCave()
    return self.mAction == global.MMO.ACTION_CAVE
end

function gameActor:IsLaunch()
    return self.mAction == global.MMO.ACTION_ATTACK or self.mAction == global.MMO.ACTION_SKILL
end

function gameActor:IsDash()
    return self.mAction == global.MMO.ACTION_DASH
end

function gameActor:IsOnPush()
    return self.mAction == global.MMO.ACTION_ONPUSH
end

function gameActor:IsAttackType()
    return self.mIsAttack
end

function gameActor:IsPlayerAttacked()
    return self.mIsPlayerAttacked
end

function gameActor:SetActionType( action_type )
    self.mIsAttack = not CheckBit(action_type or 0,1)
    self.mIsPlayerAttacked = not CheckBit(action_type or 0, 4)
end

function gameActor:SetDirection( dir )
    dir = tonumber(dir)
    if dir and (dir >= 0 and dir < 8) then
        self.mOrient = dir 
    else
        print("SetDirection error:", dir)
    end
end
function gameActor:GetDirection()
    return self.mOrient
end

function gameActor:GetNode()
    return self.mCurrActorNode
end

function gameActor:GetMountNode()
    return self.mCurrMountNode
end

function gameActor:GetAnimationID()
    if self.mAnimation then
        return self.mAnimation:GetID()
    end

    return 0
end

function gameActor:GetAnimation()
    return self.mAnimation
end

function gameActor:SetONameStr( str )
    self.mONameStr = str
end
function gameActor:GetONameStr()
    return self.mONameStr
end

function gameActor:SetName( name )
    self.mName = name
end
function gameActor:GetName()
    return self.mName
end

function gameActor:IsIngored()
    return self.mIgnored
end

function gameActor:IgnoreActor(state)
    self.mIgnored = state
end

function gameActor:Bright()
end

function gameActor:UnBright()
end

function gameActor:IsBright()
    return false
end

function gameActor:GetHUDTop()
    return 0
end

function gameActor:IsPauseIgnored()
    return self.mPauseIgnored
end

function gameActor:PauseIgnoredActor(state)
    self.mPauseIgnored = state
    if not state then
        self.mPauseIgnoredT = 0
    end
end

---------------------------------------------------------------------------
-- Server Hp
function gameActor:IsVisibleServerHpLabel()
    return self.mServerHpLabel
end

function gameActor:setVisibleServerHpLabel(visible)
    self.mServerHpLabel = visible
end

function gameActor:SetKeyValue(key, value)
    if self.mVisibles[key] == value then
        return false
    end
    self.mVisibles[key] = value
end

function gameActor:GetValueByKey(key)
    return self.mVisibles[key]
end

function gameActor:SetObstacleFlag( state )
    self.mObstacleFlag = state
end

function gameActor:IsObstacleFlag()
    return self.mObstacleFlag
end

return gameActor