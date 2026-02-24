---@class UI
UI = {}

local is_ready = false

---@param hasFocus boolean
---@param hasCursor boolean

function UI.setFocus(hasFocus, hasCursor)
    SetNuiFocus(hasFocus, hasCursor)
end

---@param route string
---@param props table<string|number, unknown>?
function UI.mount(route, props)
    SendNUIMessage({
        event = 'router.mount',
        data = {
            route = route,
            props = props
        }
    })
end

---@param route string
function UI.unmount(route)
    SendNUIMessage({
        event = 'router.unmount',
        data = route
    })
end

---@param event string
---@param data unknown?
function UI.emit(event, data)
    SendNUIMessage({
        event = event,
        data = data
    })
end

function UI.is_ready()
    return is_ready
end

AddEventHandler('iuh_ui:ready', function()
    is_ready = true
end)

exports('UI', function()
    return UI
end)
