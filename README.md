# ArdaFuat Showroom v1.1.0

ArdaFuat Showroom is a standalone QBCore vehicle showroom / catalog resource for FiveM servers.

The resource lets players browse configured vehicles through a clean NUI catalog opened from an NPC with `qb-target`. It does not handle purchases, test drives, payments, garage registration, vehicle keys, stock transactions, or database writes. This keeps the resource safe, simple, and easy to integrate with other dealership systems later.

This release adds Turkish/English locale support and a GitHub update checker.

---

## Features

- QBCore compatible structure.
- NPC interaction through `qb-target`.
- Modern NUI vehicle catalog interface.
- Config based vehicle list.
- JSON based vehicle detail data.
- Search and category filtering.
- Vehicle detail panel.
- Brand logo support.
- Vehicle image support.
- Trunk capacity display.
- Performance bars.
- Turkish and English locale support.
- GitHub update checker.
- No database requirement.
- No purchase system.
- No test drive system.
- No garage or key integration.

---

## Requirements

- `qb-core`
- `qb-target`

---

## Installation

1. Delete the old `af-showroom` folder completely.
2. Place the new `af-showroom` folder inside your server resources folder.
3. Add this line to your `server.cfg`:

    ensure af-showroom

4. Restart your server or run:

    refresh
    ensure af-showroom

---

## Basic Logic

The resource uses two main data sources:

1. `config.lua`
2. `html/vehicledata.json`

`config.lua` controls which vehicles appear in the catalog.

`html/vehicledata.json` only provides additional data such as images, descriptions, brand logos, trunk capacity, and performance values.

A vehicle must exist in `Config.Vehicles` to appear in the menu. A vehicle existing only in `vehicledata.json` will not be displayed.

Vehicle detail data is matched by `model` / `spawncode`. The names must match exactly.

---

## Locale Support

The resource supports multiple languages through the `locales` folder.

Available languages:

- `tr` Turkish
- `en` English

Change the language in `config.lua`:

    Config.Locale = 'tr'

or:

    Config.Locale = 'en'

Locale files:

    locales/tr.lua
    locales/en.lua

Most UI, target, console, and update checker texts are pulled from the locale files. Technical values such as event names, resource names, callbacks, model names, and spawncodes are not translated.

Existing vehicle categories from the config are also mapped in the locale files, so Turkish config categories can be displayed in English UI.

---

## GitHub Update Checker

The resource checks the latest version from GitHub when the server starts.

Configuration in `config.lua`:

    Config.Version = '1.1.0'

    Config.UpdateChecker = {
        enabled = true,
        url = 'https://raw.githubusercontent.com/ArdaFuat/af-showroom/main/version.json',
        repository = 'https://github.com/ArdaFuat/af-showroom'
    }

The public version file is:

    version.json

Example:

    {
      "version": "1.1.0",
      "changelog": "Added Turkish/English locale support and GitHub update checker.",
      "url": "https://github.com/ArdaFuat/af-showroom"
    }

When you release a new version, update these values together:

- `fxmanifest.lua` version
- `Config.Version`
- `version.json`
- GitHub release tag

Version flow:

- `1.0.0` Initial public release
- `1.1.0` Locale & Update Checker Update

---

## Commands

### `/showroom`

Debug command for opening the catalog quickly.

This command only exists when `Config.Debug = true`.

### `showroomreload`

Console-only command.

Reloads catalog/detail data without restarting the whole server.

---

## What This Resource Does Not Do

This resource intentionally does not include:

- Vehicle purchase
- Test drive
- Player payment
- Dealership stock transaction
- Vehicle database registration
- Garage registration
- Vehicle key assignment
- Job restriction
- Dealer employee panel
- Finance / installment system
- Vehicle spawning
- Vehicle deletion
- Plate generation

These are not bugs. The first scope of the resource is only a showroom/catalog display system.

---

## File Structure

    af-showroom/
    ├── fxmanifest.lua
    ├── config.lua
    ├── client.lua
    ├── server.lua
    ├── README.md
    ├── LICENSE
    ├── version.json
    ├── locales/
    │   ├── tr.lua
    │   └── en.lua
    └── html/
        ├── index.html
        ├── style.css
        ├── app.js
        └── vehicledata.json

---

## Recommended Use

Use this resource as a clean showroom/catalog layer for your dealership area.

Recommended flow:

1. Keep this resource as the visual catalog.
2. Keep purchase/test drive/stock logic in a separate dealership system.
3. Integrate later only when the catalog is stable.

---

## License

MIT License.

---

## Version

Current version: `v1.1.0`

Release name: `Locale & Update Checker Update`
