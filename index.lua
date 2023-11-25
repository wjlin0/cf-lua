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


--[[
  各类鼠标宏开启按钮实现的功能
]]
FLAG_USP_COP = true --- 开启 USP COP 速点 鼠标宏 -
FLAG_LIAN_YU = false  --- 开启炼狱 -
FLAG_CTRL = true --- 开启 闪蹲 鼠标宏 -
FLAG_INSTANT_SNIPER = false  --- 开启 一键瞬狙 -
FLAG_RAG = false --- 开启 一键小碎步 -

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
USP_ARG = 5 --- USP速点按键
LIAN_YU_ARG = 5 --- 炼狱速点
CTRL_ARG = 4 --- 闪蹲按键
INSTANT_SNIPER_ARG = 4 --- 一键瞬狙
RAG_ARG = 5 --- 小碎步 配合w


--[[ 延迟相关的全局变量
 延迟区间 ，快很了，区间小了 会被封
 USP 建议 35 - 65 之间
 COP 建议 35 - 65 之间
 炼狱 建议 20 - 30 之间
 闪蹲 建议 35 - 50 之间
 瞬狙 建议 35 - 50 之间
 碎布 建议 60 - 70 之间
]]
G_TIME = {}
G_TIME["USP_INTERVAL"] = { 29, 45 }  -- USP/COP
G_TIME["LIAN_YU_INTERVAL"] = { 20 , 30 } -- 炼狱速点
G_TIME["CTRL_INTERVAL"] = { 35 ,50 } -- 闪蹲延迟
G_TIME["INSTANT_SNIPER_INTERVAL"] = { 35, 50 } -- 一键瞬狙延迟
G_TIME["RAG_INTERVAL"] = { 60, 70 } -- 小碎步延迟

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
function RAGEvent(event,arg)
    local rag_event = false
    if (event == "MOUSE_BUTTON_PRESSED" and arg == RAG_ARG ) then
        rag_event = true
    end
    return rag_event
end
function UspEvent(event ,arg)
    local USP_EVENT = false
    if (event == "MOUSE_BUTTON_PRESSED" and arg == USP_ARG) then
        USP_EVENT = true
    end
    return USP_EVENT
end
function CtrlEvent(event,arg)
    local ctrl_event = false
    if (event == "MOUSE_BUTTON_PRESSED" and arg == CTRL_ARG ) then
        ctrl_event = true
    end
    return ctrl_event
end
function LianYuEvent(event,arg)
    local lian_yu_event = false
    if (event == "MOUSE_BUTTON_PRESSED" and arg == LIAN_YU_ARG ) then
        lian_yu_event = true
    end
    return lian_yu_event
end
function InstantSniperEvent(event,arg)
    local instant_sniper_event = false
    if (event == "MOUSE_BUTTON_PRESSED" and arg == INSTANT_SNIPER_ARG ) then
        instant_sniper_event = true
    end
    return instant_sniper_event
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


function Instant_Sniper(event,arg)
    PressMouseButton(3)
    RandomSleep(G_TIME["INSTANT_SNIPER_INTERVAL"][1],G_TIME["INSTANT_SNIPER_INTERVAL"][2])
    ReleaseMouseButton(3)
    RandomSleep(G_TIME["INSTANT_SNIPER_INTERVAL"][1]-10,G_TIME["INSTANT_SNIPER_INTERVAL"][2]-10)
    PressMouseButton(1)
    RandomSleep(G_TIME["INSTANT_SNIPER_INTERVAL"][1]-10,G_TIME["INSTANT_SNIPER_INTERVAL"][2]-10)
    ReleaseMouseButton(1)
    PressKey("q")
    RandomSleep(70,80)
    ReleaseKey("q")
    RandomSleep(70,80)
    PressKey("q")
    RandomSleep(70,80)
    ReleaseKey("q")
    RandomSleep(70,80)
end


function RAG(event,arg)
    i = 0
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



--- OnEvent(),事件触发函数 -
function OnEvent(event, arg )
    local USP_EVENT = UspEvent(event,arg)
    local CTRL_EVENT = CtrlEvent(event,arg)
    local INSTANT_SNIPER_EVENT = InstantSniperEvent(event,arg)
    local LIAN_YU_EVENT = LianYuEvent(event,arg)
    local RAG_EVENT = RAGEvent(event,arg)


    if (USP_EVENT == true and FLAG_USP_COP == true)then
        Usp(event, arg)
    end
    if (LIAN_YU_EVENT == true and FLAG_LIAN_YU == true)then
        LianYu(event, arg)
    end
    if (CTRL_EVENT == true and FLAG_CTRL == true)then
        Ctrl(event, arg)
    end
    if (INSTANT_SNIPER_EVENT == true and FLAG_INSTANT_SNIPER == true) then
        Instant_Sniper(event,arg)
    end
    if (RAG_EVENT == true and FLAG_RAG == true) then
        RAG(event,arg)
    end

end
