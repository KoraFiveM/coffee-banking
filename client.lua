local resource = GetCurrentResourceName()

local function install(trigger)
    Kora.logging.info('coffee_banking.installing', 'Installing the banking presentation', { trigger = trigger })
    local ok, err = exports.kora_banking:RegisterPresentation({
        currencySymbol = '¥',
        title = 'Coffee Banking · JPY',
        stylesheet = ('https://cfx-nui-%s/web/windows97.css'):format(resource),
    })
    if not ok then
        Kora.logging.error('coffee_banking.presentation_failed', 'Could not install the banking presentation', {
            error = err,
            trigger = trigger,
        })
        return
    end
    Kora.logging.info('coffee_banking.installed', 'Yen labels and Windows 97 skin registered', {
        currency = 'JPY',
        stylesheet = ('https://cfx-nui-%s/web/windows97.css'):format(resource),
        trigger = trigger,
    })
end

AddEventHandler('onClientResourceStart', function(started)
    if started == resource or started == 'kora_banking' then
        install(started)
    end
end)

-- kora_banking removes this resource's registration when it stops.
AddEventHandler('onClientResourceStop', function(stopped)
    if stopped == resource then
        Kora.logging.info('coffee_banking.stopped', 'Presentation resource stopped; banking restores its defaults')
    end
end)
