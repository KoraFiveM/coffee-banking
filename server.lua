local resource = GetCurrentResourceName()

AddEventHandler('onResourceStart', function(started)
    if started == resource then
        Kora.logging.info(
            'coffee_banking.started',
            'Coffee Banking started; clients register yen labels and the Windows 97 skin'
        )
    end
end)

AddEventHandler('onResourceStop', function(stopped)
    if stopped == resource then
        Kora.logging.info('coffee_banking.stopped', 'Coffee Banking stopped; clients restore banking defaults')
    end
end)
