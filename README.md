# Coffee Banking · Kora Framework

**This resource is purely a monkey patching/customisation example for
`kora_banking`.** It demonstrates how to keep a server-specific change in a separate
resource, using banking's supported presentation hook. It is not a standalone bank,
replacement banking system or currency conversion service.

Technically, this example registers a presentation extension rather than replacing
private Lua functions. Banking explicitly applies the registered settings; starting
a separate resource cannot patch another resource's private functions automatically.

Start `coffee-banking` after `kora_banking`, then use the usual bank counters and ATMs.
There is no replacement database or client request channel. Treat the resource as a
small learning example to adapt, not a complete banking product.

The presentation uses whole Japanese yen (`¥` / `JPY`) and a classic grey Windows
desktop skin: navy title bars, square controls, beveled buttons and inset white fields.
“Windows 97” is the name of this example skin, inspired by the Windows 95/98 era.
It loads no external fonts, scripts or images.

## Install and test

Requires the accompanying `RegisterPresentation` banking extension and AppShell's
local stylesheet support. Declare `ensure coffee-banking` after banking in the
active `server.cfg`. With the Docker setup, this folder belongs in the mounted
`resources/kora/` directory; edit it on the host.

```cfg
ensure kora_banking
ensure coffee-banking
```

From the server console, run `refresh`, then `ensure coffee-banking`. Restart
`kora_lib` and `kora_banking` first when installing their new extension code.
Reconnect if the shared browser frame has not refreshed after its resource restart.

Check branch accounts, activity, cash forms, preset labels, transfer forms, feedback,
the locked ATM PIN screen and the unlocked ATM. Closing banking must remove its
stylesheet and release focus. Other AppShell applications keep their normal theme.

Amounts are denominated in yen without changing stored numbers: an existing balance
of 500 becomes ¥500. Balances, limits and transaction amounts are not multiplied,
converted at an exchange rate or migrated. This does not change currency in the HUD,
other resources, server-only commands or stored statement descriptions.

`stop coffee-banking` restores banking's original presentation, including an open
banking window. `ensure coffee-banking` installs it again. The client reinstalls the
presentation after banking restarts. One resource may own the presentation at a time;
a conflicting registration reports an error rather than replacing its owner.

## Ownership

Lifecycle messages use `Kora.logging`. The server console records resource start
and stop. The client console records installation attempts, successful registration
(currency, stylesheet and triggering resource), registration failures and shutdown.
A server start message confirms the resource loaded; client success messages confirm
presentation registration. These logs contain no balances, PINs or player data.

`client.lua` supplies display settings. `web/windows97.css` scopes every rule to
banking's AppShell surface, including its portalled controls. Banking still validates
sessions, proximity, PINs, permissions and amounts on its server. The presentation
does not wrap or change mutation exports or their invoking-resource identity.

Keep this example in its own resource repository, separately from Docker setup,
kora_banking and kora_lib changes. Copyright © 2026 Kora Framework.
