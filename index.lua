---
--- Generated by wjlin0(https://github.com/wjlin0)
--- Created by wjlin0.
--- DateTime: 2023/11/25 13:21
---

--- @作者     : wjlin0
--- @博客     : https://wjlin0.com

--[[ 注意事项
 1. 免责声明
   由于传播、利用此工具所提供的信息而造成的任何直接或者间接的后果及损失，均由使用者本人负责。本工具仅限学习开发编程Lua使用。
 2. 每次改动后关闭 ctrl + s 保存一下配置
 3. 配置完成保存后，在当前界面若没有出现 timeout = * 的字样时，联系作者。
 4. 若配置成功后，完成第三个，在游戏中不生效，可将GHUB关闭后，按管理员重新运行。
 5. 若要长期以管理员运行，请联系作者。
 6. 若鼠标只有两位侧位键，尽量开启的功能为两个
]]

Version = "v1.4" --- 脚本版本


--[[
  目前实现的功能如下所示
  各类鼠标宏开启按钮实现的功能
]]
FLAG_USP_COP = false --- 开启 USP COP 速点 鼠标宏 -
FLAG_LIAN_YU = false  --- 开启炼狱 -
FLAG_CTRL = false --- 开启 闪蹲 鼠标宏 -
FLAG_INSTANT_SNIPER = false  --- 开启 一键瞬狙 -
FLAG_RAG = false --- 开启 一键小碎步 -
FLAG_GHOST_JUMP = false ---开启 鬼跳 -
FLAG_M4A1_THOR_SPEED_POINT = false --- 开启 M4雷神速点 -
FLAG_AK47_SPEED_POINT = false --- 开启 AK47速点 -

--[[ 鼠标宏配置按钮
  1 --> 鼠标左键
  2 --> 鼠标中滑轮键
  3 --> 鼠标右键
  4 --> 鼠标左下键
  5 --> 鼠标左上键
  6 --> 鼠标右下键
  7 --> 鼠标右上键
  0 --> 表示不生效
]]
USP_ARG = 0 --- USP速点按键
LIAN_YU_ARG = 0 --- 炼狱速点
CTRL_ARG = 0 --- 闪蹲按键
INSTANT_SNIPER_ARG = 0 --- 一键瞬狙
RAG_ARG = 0 --- 小碎步 配合w
GHOST_JUMP_ARG = 0 --- 鬼跳
M4A1_THOR_SPEED_POINT_ARG = 0 --- M4雷神速点
AK47_SPEED_POINT_ARG = 0 --- AK47速点

--[[ 延迟相关的全局变量
 延迟区间 ，快很了，区间小了 会被封
 USP 建议 35 - 65 之间
 COP 建议 35 - 65 之间
 炼狱 建议 20 - 30 之间
 闪蹲 建议 35 - 50 之间
 瞬狙 建议 35 - 50 之间
 碎步 建议 60 - 70 之间
 鬼跳 建议 15 - 25 之间 只测试了几把 虽然稳定但是不知道封号不
 雷神 建议 25 - 50 之间
 AK  建议 25 - 50 之间
]]
G_TIME = {}
G_TIME["USP_INTERVAL"] = { 29, 45 }  -- USP/COP
G_TIME["LIAN_YU_INTERVAL"] = { 20 , 30 } -- 炼狱速点
G_TIME["CTRL_INTERVAL"] = { 35 ,50 } -- 闪蹲延迟
G_TIME["INSTANT_SNIPER_INTERVAL"] = { 35, 50 } -- 一键瞬狙延迟
G_TIME["RAG_INTERVAL"] = { 60, 70 } -- 小碎步延迟
G_TIME["GHOST_JUMP_INTERVAL"] = { 15, 25 } -- 鬼跳延迟
G_TIME["M4A1_THOR_SPEED_POINT_INTERVAL"] = { 25, 50 } -- M4雷神速点延迟
G_TIME["AK47_SPEED_POINT_INTERVAL"] = { 25, 50 } -- AK47速点延迟

EnablePrimaryMouseButtonEvents(true)

--- RandomSleep(),生成随机睡眠 -
function RandomSleep(min,max)
    local tmp = 0
    if (min >= max) then
        tmp = min
        min = max
        max = tmp
    end
    num = math.random(min, max)
    OutputLogMessage("timeout = %d\n",num)
    Sleep(num)
end

--- M4a1_Thor_Speed_Point(),M4雷神速点 -
function M4a1_Thor_Speed_Point(event,arg)
    i = 0
    while (1) do
        PressMouseButton(1)
        RandomSleep(G_TIME["M4A1_THOR_SPEED_POINT_INTERVAL"][1],G_TIME["M4A1_THOR_SPEED_POINT_INTERVAL"][2])
        ReleaseMouseButton(1)
        RandomSleep(G_TIME["M4A1_THOR_SPEED_POINT_INTERVAL"][1]+80,G_TIME["M4A1_THOR_SPEED_POINT_INTERVAL"][2]+80)
        if not IsMouseButtonPressed(arg) then
            break
        end
    end
end

function Ak47_Speed_Point(event,arg)
    while (1) do
        PressMouseButton(1)
        RandomSleep(G_TIME["AK47_SPEED_POINT_INTERVAL"][1],G_TIME["AK47_SPEED_POINT_INTERVAL"][2])
        ReleaseMouseButton(1)
        RandomSleep(G_TIME["AK47_SPEED_POINT_INTERVAL"][1]+85,G_TIME["AK47_SPEED_POINT_INTERVAL"][2]+90)
        if not IsMouseButtonPressed(arg) then
            break
        end
    end
end


--- Usp(),随机速点 -
function Usp(event, arg)
    i = 0
    while (1) do
        PressMouseButton(1)
        RandomSleep(G_TIME["USP_INTERVAL"][1],G_TIME["USP_INTERVAL"][2])
        ReleaseMouseButton(1)
        RandomSleep(G_TIME["USP_INTERVAL"][1],G_TIME["USP_INTERVAL"][2])
        if not IsMouseButtonPressed(arg) then
            break
        end
    end
end
--- LianYu(), 炼狱速点
function LianYu(event,arg)
    while (1) do
        PressMouseButton(1)
        RandomSleep(G_TIME["LIAN_YU_INTERVAL"][1]*2.5,G_TIME["LIAN_YU_INTERVAL"][2]*2.5)
        ReleaseMouseButton(1)
        RandomSleep(G_TIME["LIAN_YU_INTERVAL"][1],G_TIME["LIAN_YU_INTERVAL"][2])
        if not IsMouseButtonPressed(arg) then
            break
        end
    end
end

--- Ctrl() 闪蹲
function Ctrl(event,arg)
    i = 0
    while (1) do
        -- OutputLogMessage("event = %s\narg = %d\n",event,arg)
        PressKey("lctrl")
        RandomSleep(G_TIME["CTRL_INTERVAL"][1],G_TIME["CTRL_INTERVAL"][2])
        ReleaseKey("lctrl")
        RandomSleep(G_TIME["CTRL_INTERVAL"][1],G_TIME["CTRL_INTERVAL"][2])
        if not IsMouseButtonPressed(arg) then
            break
        end
    end
end

--- Instant_Sniper() 一键瞬狙
function Instant_Sniper(event,arg)
    PressMouseButton(3)
    RandomSleep(G_TIME["INSTANT_SNIPER_INTERVAL"][1],G_TIME["INSTANT_SNIPER_INTERVAL"][2])
    ReleaseMouseButton(3)
    RandomSleep(G_TIME["INSTANT_SNIPER_INTERVAL"][1]-10,G_TIME["INSTANT_SNIPER_INTERVAL"][2]-10)
    PressMouseButton(1)
    RandomSleep(G_TIME["INSTANT_SNIPER_INTERVAL"][1]-10,G_TIME["INSTANT_SNIPER_INTERVAL"][2]-10)
    ReleaseMouseButton(1)
    PressKey("3")
    RandomSleep(45,55)
    ReleaseKey("3")
    RandomSleep(45,55)
    PressKey("1")
    RandomSleep(45,55)
    ReleaseKey("1")
    RandomSleep(45,55)
    PressKey("1")
    RandomSleep(45,55)
    ReleaseKey("1")
    RandomSleep(45,55)
end

--- Rag() 碎步
function Rag(event, arg)
    while (1) do
        -- OutputLogMessage("event = %s\narg = %d\n",event,arg)
        PressKey("w")
        RandomSleep(G_TIME["RAG_INTERVAL"][1],G_TIME["RAG_INTERVAL"][2])
        ReleaseKey("w")
        RandomSleep(G_TIME["RAG_INTERVAL"][1],G_TIME["RAG_INTERVAL"][2])
        if not IsMouseButtonPressed(arg) then
            break
        end
    end
end


--- GhostJump() 鬼跳 -
function GhostJump(event,arg)
    PressKey("spacebar")
    RandomSleep(G_TIME["GHOST_JUMP_INTERVAL"][1],G_TIME["GHOST_JUMP_INTERVAL"][2])
    ReleaseKey("spacebar")
    RandomSleep(G_TIME["GHOST_JUMP_INTERVAL"][1],G_TIME["GHOST_JUMP_INTERVAL"][2])
    PressKey("lctrl")
    RandomSleep(G_TIME["GHOST_JUMP_INTERVAL"][1],G_TIME["GHOST_JUMP_INTERVAL"][2])
    while (1) do
        -- OutputLogMessage("event = %s\narg = %d\n",event,arg)
        PressKey("spacebar")
        RandomSleep(G_TIME["GHOST_JUMP_INTERVAL"][1],G_TIME["GHOST_JUMP_INTERVAL"][2])
        ReleaseKey("spacebar")
        RandomSleep(G_TIME["GHOST_JUMP_INTERVAL"][1],G_TIME["GHOST_JUMP_INTERVAL"][2])
        if not IsMouseButtonPressed(arg) then
            break
        end
    end
    ReleaseKey("lctrl")
end

function Event(event,arg,action)
    if (event ~= "MOUSE_BUTTON_PRESSED") then
        return false
    end
    return arg == action
end

--- OnEvent(),事件触发函数 -
function OnEvent(event, arg )
    
    local USP_EVENT = Event(event,arg,USP_ARG)
    local CTRL_EVENT = Event(event,arg,CTRL_ARG)
    local INSTANT_SNIPER_EVENT = Event(event,arg,INSTANT_SNIPER_ARG)
    local LIAN_YU_EVENT = Event(event,arg,LIAN_YU_ARG)
    local RAG_EVENT = Event(event,arg,RAG_ARG)
    local GHOST_JUMP_EVENT = Event(event,arg,GHOST_JUMP_ARG)
    local M4A1_THOR_SPEED_POINT_EVENT = Event(event,arg,M4A1_THOR_SPEED_POINT_ARG)
    local AK47_SPEED_POINT_EVENT = Event(event,arg,AK47_SPEED_POINT_ARG)
    if (USP_EVENT == true and FLAG_USP_COP == true)then
        Usp(event, arg)
        return

    end
    if (LIAN_YU_EVENT == true and FLAG_LIAN_YU == true)then
        LianYu(event, arg)
        return
    end
    if (CTRL_EVENT == true and FLAG_CTRL == true)then
        Ctrl(event, arg)
        return
    end
    if (INSTANT_SNIPER_EVENT == true and FLAG_INSTANT_SNIPER == true) then
        Instant_Sniper(event,arg)
        return
    end
    if (RAG_EVENT == true and FLAG_RAG == true) then
        Rag(event,arg)
        return
    end
    if (GHOST_JUMP_EVENT == true and FLAG_GHOST_JUMP == true) then
        GhostJump(event,arg)
        return
    end
    if (M4A1_THOR_SPEED_POINT_EVENT == true and FLAG_M4A1_THOR_SPEED_POINT == true) then
        M4a1_Thor_Speed_Point(event,arg)
        return
    end
    if (AK47_SPEED_POINT_EVENT == true and FLAG_AK47_SPEED_POINT == true) then
        Ak47_Speed_Point(event,arg)
        return
    end
end
