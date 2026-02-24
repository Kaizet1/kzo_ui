---@param route string
---@param props unknown
RegisterNetEvent('iuh_ui:mount', function(route, props)
    SendNUIMessage({
        event = 'router.mount',
        data = {
            route,
            props
        }
    })
end)

---@param route string
RegisterNetEvent('iuh_ui:unmount', function(route)
    SendNUIMessage({
        event = 'router.unmount',
        data = route
    })
end)

---@param data { event: string, data: unknown }
RegisterNUICallback('messenger.emit', function(data, cb)
    if data.event == 'ui.ready' then
        TriggerEvent('iuh_ui:ready')
    else
        TriggerEvent(data.event, data.data)
    end
    cb(nil)
end)
